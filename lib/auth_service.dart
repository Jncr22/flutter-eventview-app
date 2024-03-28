// auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para iniciar sesión
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  // Método para registrarse
  Future<UserCredential?> signUp(String email, String password, String name,
      String lastName, String category) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Guarda la información adicional en Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'lastName': lastName,
        'email': email,
        'category': category,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  // Método para iniciar sesión con Google
  // Método para iniciar sesión con Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Inicia el proceso de autenticación con Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Si el usuario cancela el inicio de sesión, googleUser será null
      if (googleUser == null) return null;

      // Obtiene las credenciales de Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Crea una credencial de Firebase con el token de Google
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Inicia sesión en Firebase con las credenciales de Google
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Obtiene el nombre y apellido del usuario de Google
      String name = googleUser.displayName!.split(' ')[0];
      String lastName = googleUser.displayName!.split(' ')[1];

      // Guarda la información adicional en Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'lastName': lastName,
        'email': userCredential.user!.email,
        'category': 'Alumno', // Asigna la categoría de "Alumno" automáticamente
      });

      return userCredential;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
