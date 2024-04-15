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
      name: 'settingsTeach',
      path: '/settingsTeach',
      builder: (context, state) => const SettingTeacher(),
    ),
    GoRoute(
      name: 'camera',
      path: '/camera',
      builder: (context, state) => const CameraScreen(),
    ),
    GoRoute(
      name: 'cameraTeacher',
      path: '/cameraTeacher',
      builder: (context, state) => const CameraTeacherScreen(),
    ),
     GoRoute(
      name: 'settingProfi',
      path: '/settingProfi',
      builder: (context, state) => const SettingProfileView(),
    ),
     GoRoute(
      name: 'settingProfileTeacher',
      path: '/settingProfileTeacher',
      builder: (context, state) => const SettingProfileTeacherView(),
    ),
     GoRoute(
      name: 'settingAccount',
      path: '/settingAccount',
      builder: (context, state) => const SettingAccountView(),
    ),
    GoRoute(
      name: 'settingAccountTeacher',
      path: '/settingAccountTeacher',
      builder: (context, state) => const SettingAccountTeacherView(),
    ),
     GoRoute(
      name: 'settingSecure',
      path: '/settingSecure',
      builder: (context, state) => const SettingSecureView(),
    ),
    GoRoute(
      name: 'settingSecureTeacher',
      path: '/settingSecureTeacher',
      builder: (context, state) => const SettingSecureTeacherView(),
    ),
  ],
);