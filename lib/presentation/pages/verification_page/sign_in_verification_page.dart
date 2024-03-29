import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_ix_task/application/phone_sign_in/phone_sign_in_event.dart';
import 'package:smart_ix_task/presentation/common_widgets/colors.dart';
import 'package:smart_ix_task/presentation/common_widgets/custom_app_bar.dart';
import 'package:smart_ix_task/presentation/pages/verification_page/constants/texts.dart';
import 'package:smart_ix_task/presentation/pages/verification_page/widgets/verification_page_body.dart';
import 'package:smart_ix_task/presentation/providers/auth/auth_state_provider.dart';
import 'package:smart_ix_task/presentation/providers/auth/phone_sign_in_state_provider.dart';
import 'package:smart_ix_task/presentation/routes/router.gr.dart';

class SignInVerificationPage extends ConsumerWidget {
  const SignInVerificationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<bool>(
      authStateProvider.select((value) => value.isUserSignedIn),
      (p, c) {
        if (c) {
          AutoRouter.of(context).replace(const RouteNavigator());
        } else if (!c) {
          AutoRouter.of(context).replace(const SignInRoute());
        }
      },
    );

    final phoneNumber = ref.read(phoneSignInStateProvider).phoneNumber;

    return WillPopScope(
      onWillPop: () => Future<bool>.value(false),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          leadingOnPressed: () {
            ref.read(phoneSignInStateProvider.notifier).mapEventsToState(
                  const Reset(),
                );
            AutoRouter.of(context).popUntilRoot();
          },
          appBarBackgroundColor: whiteColor,
          appBarTitle: verificationText,
          appBarAction: Icons.lock,
          appBarLeading: Icons.arrow_back_ios,
          appBarTitleTextStyle: const TextStyle(
            color: blackColor,
            fontWeight: FontWeight.w500,
          ),
          appBarIconColor: blackColor,
        ),
        body: VerificationPageBody(
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }
}
