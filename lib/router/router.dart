import 'package:anaaj/models/app_user.dart';
import 'package:anaaj/providers/app_user_providers.dart';
import 'package:anaaj/router/route_paths_helper.dart';
import 'package:anaaj/screens/authentication_screen/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:anaaj/screens/receiver/home_screen/screens/marketplace_entity_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

import '../screens/authentication_screen/authentication_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/receiver/home_screen/marketplace_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/EnlargedCard',
    debugLogDiagnostics: true,
    refreshListenable: router,
    redirect: router._redirectLogic,
    routes: router._routes,
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    ref.listen<AppUser?>(
      appUserProvider, // In our case, we're interested in the log in / log out events.
      (_, __) => notifyListeners(), // Obviously more logic can be added here
    );
  }

  final Ref ref;

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final AppUser? user = ref.watch(appUserProvider);

    // // From here we can use the state and implement our custom logic

    // final areWeLoggingIn = state.location == '/' ||
    //     state.location.contains('/auth') ||
    //     state.location.contains('/verify');

    // if (user == null) {
    //   // We're not logged in
    //   // So, IF we aren't in the login page, go there.
    //   return areWeLoggingIn ? null : '/';
    // }
    // // We're logged in

    // // At this point, IF we're in the login page, go to the home page

    // if (areWeLoggingIn) {
    //   Object appUser = user.appUser;
    //   if (appUser is DonorInstituition) {
    //     return RoutePathsHelper.donor;
    //   } else if (appUser is ReceiverInstituition) {
    //     return RoutePathsHelper.receiver;
    //   } else if (appUser is Volunteer) {
    //     return RoutePathsHelper.volunteer;
    //   } else {
    //     return null;
    //   }
    // }

    // There's no need for a redirect at this point.
    return null;
  }

  List<RouteBase> get _routes => [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: rightToLeftFadeTransition,
              child: OnboardingScreen(),
            );
          },
        ),
        GoRoute(
          path: '/marketplace',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: rightToLeftFadeTransition,
              child: MarketPlaceScreen(),
            );
          },
        ),
        GoRoute(
          path: '/EnlargedCard',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: rightToLeftFadeTransition,
              child: MarketplaceEntityScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePathsHelper.auth,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: rightToLeftFadeTransition,
              child: AuthenticationScreen(),
            );
          },
          routes: [
            GoRoute(
              path: RoutePathsHelper.register,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  transitionsBuilder: rightToLeftFadeTransition,
                  child: Scaffold(),
                );
              },
            ),
            GoRoute(
              path: 'verify/:phonenumber',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  transitionsBuilder: rightToLeftFadeTransition,
                  child: OtpVerificationScreen(
                    phoneNumber: state.params['phonenumber'].toString(),
                    onVerificationSuccessful: () async {
                      if (state.extra != AppUser) {
                        throw Exception(
                            "App user needs to be passed through GoRoute state");
                      }
                      AppUser appUser = state.extra as AppUser;
                      ref.read(appUserProvider.notifier).state = appUser;
                    },
                  ),
                );
              },
            ),
          ],
        ),
        // GoRoute(
        //   path: RoutePathsHelper.donor,
        //   routes: [],
        // ),
        // GoRoute(
        //   path: RoutePathsHelper.receiver,
        //   routes: [],
        // ),
        // GoRoute(
        //   path: RoutePathsHelper.volunteer,
        //   routes: [],
        // ),
      ];
}

Widget rightToLeftFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(animation),
    child: FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    ),
  );
}
