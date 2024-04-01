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
      builder: (context, state) => const RegistrationScreen(),
    ),
    GoRoute(
      name: 'lobbyStudent',
      path: '/lobbyStudent',
      builder: (context, state) => const LobbyScreenStudent(),
    ),
    GoRoute(
      name: 'settings',
      path: '/settings',
      builder: (context, state) => const SettingStudent(),
    ),
    GoRoute(
      name: 'camera',
      path: '/camera',
      builder: (context, state) => const CameraScreen(),
    ),
     GoRoute(
      name: 'settingProfi',
      path: '/settingProfi',
      builder: (context, state) => const SettingProfileView(),
    ),
     GoRoute(
      name: 'settingAccount',
      path: '/settingAccount',
      builder: (context, state) => const SettingAccountView(),
    ),
     GoRoute(
      name: 'settingSecure',
      path: '/settingSecure',
      builder: (context, state) => const SettingSecureView(),
    ),
  ],
);