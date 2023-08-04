import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../components/edit_text.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg.jpeg"))
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(30),
                    topEnd: Radius.circular(30))),
            width: double.infinity,
            height: 630,
            child: ReactiveForm(
              formGroup: controller.form,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Log in your account',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    const Text(
                      'Please Provide your Email ID to \n login / sign up before you place the order',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Tajawal',

                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const EditText(
                      controlName: "username",
                      hint: "Username",
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const EditText(
                      controlName: "password",
                      hint: "Password",
                      textInputAction: TextInputAction.done,
                      isSecure: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => controller.login(),
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(7))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SIGN IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Tajawal',
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register_screen');
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(0, 55),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(7))),
                          backgroundColor: Colors.grey.shade300),
                      child: const Text(
                        'Create an Account',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}