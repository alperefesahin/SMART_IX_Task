import 'package:auto_route/auto_route.dart';
import 'package:smart_ix_task/presentation/pages/create_routine/create_routine_page.dart';
import 'package:smart_ix_task/presentation/pages/current_user_routine/current_user_routine_page.dart';
import 'package:smart_ix_task/presentation/pages/current_user_routine_edit/current_user_routine_edit_page.dart';
import 'package:smart_ix_task/presentation/pages/dashboard/dashboard_page.dart';
import 'package:smart_ix_task/presentation/pages/landing/landing_page.dart';
import 'package:smart_ix_task/presentation/pages/navigator/navigator_page.dart';
import 'package:smart_ix_task/presentation/pages/sign_in/sign_in_page.dart';
import 'package:smart_ix_task/presentation/pages/verification_page/sign_in_verification_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LandingPage,
      initial: true,
    ),
    AutoRoute(
      page: PageNavigator,
      children: [
        AutoRoute(
          page: DashboardPage,
        ),
        AutoRoute(
          page: CurrentUserRoutinePage,
        ),
      ],
    ),
    AutoRoute(
      page: SignInPage,
    ),
    AutoRoute(
      page: SignInVerificationPage,
    ),
    AutoRoute(
      page: CreateRoutinePage,
    ),
    AutoRoute(
      page: CurrentUserRoutineEditPage,
    ),
  ],
)
class $AppRouter {}
