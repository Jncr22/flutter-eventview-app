import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SettingSecureTeacherView extends StatelessWidget {
  const SettingSecureTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return  GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar( 
          backgroundColor: Colors.transparent,
          title: Align(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text( 'Seguridad',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                IconButton(color: Colors.black,
                onPressed: (){
                  context.goNamed('settingsTeach');
                }, icon:const Icon(Icons.arrow_back)),
              ],
            ),),
        ),
        body: const Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height:  20.0),
                  TextFieldCustom(labelText: 'Contraseña',
                  hintText: 'lorem ipsum',
                  fontSize: 16,
                  constraints: BoxConstraints(minWidth: 100, maxWidth: 350),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}