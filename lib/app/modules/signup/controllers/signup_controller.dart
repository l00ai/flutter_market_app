import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignupController extends GetxController {

  final form = FormGroup({
    'fName': FormControl<String>(validators: [Validators.required]),
    'LName': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(validators: [Validators.required, Validators.email,]),
    'password': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
  });


  signup(){
    if(!form.valid){
      return;
    }

    final data = form.rawValue;
    data['name'] = "";

    print(data);
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
