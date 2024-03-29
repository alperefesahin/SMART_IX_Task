import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_ix_task/application/phone_sign_in/phone_sign_in_event.dart';
import 'package:smart_ix_task/presentation/common_widgets/colors.dart';
import 'package:smart_ix_task/presentation/common_widgets/custom_text.dart';
import 'package:smart_ix_task/presentation/pages/sign_in/constants/texts.dart';
import 'package:smart_ix_task/presentation/pages/sign_in/widgets/phone_number_sign_in_section.dart';
import 'package:smart_ix_task/presentation/providers/auth/anonymously_sign_in_state_provider.dart';
import 'package:smart_ix_task/presentation/providers/auth/phone_sign_in_state_provider.dart';
import 'package:smart_ix_task/presentation/routes/router.gr.dart';

class BottomSectionOfThePage extends ConsumerWidget {
  const BottomSectionOfThePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPhoneNumberInputValidated =
        ref.watch(phoneSignInStateProvider.select((state) => state.isPhoneNumberInputValidated));
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 32.h,
          right: 25,
          left: 25,
          bottom: 25,
        ),
        height: 85.h,
        width: 100.h,
        child: Card(
          color: whiteColor,
          elevation: 4.0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: const [
                    CustomText(
                      text: personalInformationText,
                      minFontSize: 20,
                      maxFontSize: 25,
                      textPadding: EdgeInsets.only(),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const PhoneNumberSignInSection(),
              CustomText(
                text: smsInformationMessage,
                minFontSize: 15,
                maxFontSize: 20,
                textPadding: EdgeInsets.only(
                  right: 25,
                  left: 25,
                  top: 3.h,
                ),
              ),
              InkWell(
                splashColor: transparentColor,
                highlightColor: transparentColor,
                onTap: () {
                  if (isPhoneNumberInputValidated) {
                    ref.read(phoneSignInStateProvider.notifier).mapEventsToState(const SignInWithPhoneNumber());
                    AutoRouter.of(context).navigate(
                      const SignInVerificationRoute(),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5.h),
                  width: 22.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: customIndigoColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: customIndigoColor.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 30,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: InkWell(
                  splashColor: transparentColor,
                  highlightColor: transparentColor,
                  onTap: () => ref.read(anonymousSignInStateProvider.notifier).signInAnonymously(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(CupertinoIcons.person, size: 30),
                      SizedBox(width: 10),
                      CustomText(
                        text: signInAnonymously,
                        minFontSize: 22,
                        maxFontSize: 27,
                        textPadding: EdgeInsets.only(),
                        textStyle: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
