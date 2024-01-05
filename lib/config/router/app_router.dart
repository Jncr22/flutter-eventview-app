import 'package:go_router/go_router.dart';

import '../../presentation/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
     GoRoute(
      name: 'signIn',
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
     GoRoute(
      name: 'register',
      path: '/registration',
      builder: (context, state) => RegistrationScreen(),
    ),
  ],
);