import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/booster.dart';
import 'package:getx_skeleton/app/components/edit_text.dart';
import 'package:getx_skeleton/app/components/my_button.dart';
import 'package:getx_skeleton/app/modules/boarding/views/boarding_view.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/app/services/api_call_status.dart';
import 'package:hive/hive.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light));
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/bg.jpeg"))),
      child: Column(
        children: [
          Container(
            height: 180.h,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 25.h),
            child: Image.asset(
              width: size.width * 0.4,
              "assets/images/logo.png",
              color: Colors.white,
            ),
          ),
          Expanded(
              child: ReactiveForm(
            formGroup: controller.form,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Booster.textTitle("Create an account",
                        color: theme.textTheme.titleLarge!.color!),
                    8.verticalSpace,
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Already have an account?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: theme
                                            .textTheme.titleLarge!.color!)),
                            TextSpan(
                              text: " Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: theme.textTheme.titleLarge!.color!,
                                      fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                            ),
                          ],
                        )),
                    20.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Expanded(
                          child: EditText(
                            hint: "FName",
                            controlName: "fName",
                          ),
                        ),
                        10.horizontalSpace,
                        const Expanded(
                          child: EditText(
                            hint: "LName",
                            controlName: "LName",
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    const EditText(
                      hint: "Email",
                      controlName: "email",
                      inputType: TextInputType.emailAddress,
                    ),
                    10.verticalSpace,
                    const EditText(
                      hint: "Password",
                      controlName: "password",
                      isSecure: true,
                    ),
                    20.verticalSpace,
                    GetBuilder<SignupController>(
                        builder: (ctrl) {

                          if(ctrl.signupCallStatus == ApiCallStatus.loading){
                            return const Center(child: CupertinoActivityIndicator(),);
                          }

                          if(ctrl.signupCallStatus == ApiCallStatus.success){
                            return const SizedBox();
                          }

                          return MyButton(
                            label: "SIGN UP",
                            onTap: ()=> ctrl.signup(),
                          );
                        }
                    ),
                    15.verticalSpace,
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "By tap Sign Up button you ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: theme
                                            .textTheme.titleLarge!.color!)),
                            TextSpan(
                              text: "accept term and privacy ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: theme.textTheme.titleLarge!.color!,
                                      fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                            ),
                            TextSpan(
                              text: "this app",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: theme.textTheme.titleLarge!.color!,
                                  ),
                            ),
                          ],
                        )),
                    20.verticalSpace,
                    TextButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith((states) => Colors.black12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back, color: theme.primaryColor),
                            10.horizontalSpace,
                            Booster.textBody("Back to sign in page", color: theme.primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
                          ],
                        ))

                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
