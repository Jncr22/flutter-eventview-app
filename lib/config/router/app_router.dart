import 'package:go_router/go_router.dart';

import '../../presentation/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'lobby',
      path: '/lobby',
      builder: (context, state) =>  const LobyScreen(),
    ),
     GoRoute(
      name: 'start',
      path: '/',
      builder: (context, state) => const StartView(),
    ),
     GoRoute(
      name: 'signIn',
      path: '/logIn',
      builder: (context, state) => LoginScreen(),
    ),
     GoRoute(
      name: 'register',
      path: '/registration',
      builder: (context, state) => RegistrationScreen(),
    ),
  ],
);