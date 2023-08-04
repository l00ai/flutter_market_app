import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:logger/logger.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class LoginController extends GetxController {

  final form = FormGroup({
    'username': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
  });


  ApiCallStatus loginStatus = ApiCallStatus.holding;
  login() async {

    form.unfocus();

    if(!form.valid){
      form.markAllAsTouched();
      return;
    }


    showLoadingOverLay(
      asyncFunction: () async {
        // await Future.delayed(Duration(seconds: 30));
        await BaseClient.safeApiCall(
          Constants.login, // url
          RequestType.post,
          data: form.rawValue,
          // quest type (get,post,delete,put)
          onLoading: () {
            // *) indicate loading state
            loginStatus = ApiCallStatus.loading;
            update(['']);
          },
          onSuccess: (response) { // api done successfully

            Logger().i(response.data);
            // *) indicate success state

            loginStatus = ApiCallStatus.success;

            Get.offAllNamed(Routes.HOME);

            //CustomSnackBar.showCustomToast(message: "Success");

            update(['']);
          },
          // if you don't pass this method base client
          // will automaticly handle error and show message to user
          onError: (error) {
            // show error message to user
            BaseClient.handleApiError(error);
            // *) indicate error status
            loginStatus = ApiCallStatus.error;
            update(['productList']);
          },
        );
      }
    );

    // *) perform api call

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
