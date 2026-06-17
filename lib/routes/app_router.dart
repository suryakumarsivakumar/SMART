import 'package:go_router/go_router.dart';
import '../features/history/history_screen.dart';
import '../features/splash/splash_screen.dart';
import '../features/connection/connection_screen.dart';
import '../features/patient/patient_screen.dart';
import '../features/doctor/doctor_screen.dart';
import '../features/device/device_selection_screen.dart';
import '../features/dashboard/dashboard_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, _) => const SplashScreen()),

    GoRoute(path: '/connection', builder: (_, _) => const ConnectionScreen()),

    GoRoute(path: '/patient', builder: (_, _) => const PatientScreen()),

    GoRoute(path: '/doctor', builder: (_, _) => const DoctorScreen()),

    GoRoute(path: '/device', builder: (_, _) => const DeviceSelectionScreen()),

    GoRoute(path: '/dashboard', builder: (_, _) => const DashboardScreen()),

    GoRoute(path: '/history', builder: (_, _) => const HistoryScreen()),
  ],
);
