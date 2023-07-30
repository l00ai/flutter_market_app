import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/services/api_call_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignupController extends GetxController {

  String x = "";

  final form = FormGroup({
    'fName': FormControl<String>(validators: [Validators.required]),
    'LName': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(validators: [Validators.required, Validators.email,]),
    'password': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
  });


  signup(){


    form.unfocus();

    if(!form.valid){
      form.markAllAsTouched();
      return;
    }

    final data = form.rawValue;

    callSignup();
  }



  ApiCallStatus signupCallStatus = ApiCallStatus.holding;

  callSignup() async {
    signupCallStatus = ApiCallStatus.loading;
    update();
    await Future.delayed(const Duration(seconds: 4));
    signupCallStatus = ApiCallStatus.success;
    update();
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    form.dispose();
    super.onClose();
  }

}
