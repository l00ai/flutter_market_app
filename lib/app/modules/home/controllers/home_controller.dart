import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';

import '../../../../utils/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {



  List<String> categoryList = [];
  ApiCallStatus categoryStatus = ApiCallStatus.holding;

  getCategories() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.getCategories, // url
      RequestType.get, // re
      // quest type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
        categoryStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response){ // api done successfully
        categoryList = List.from(response.data);
        // *) indicate success state

        if(categoryList.isNotEmpty){
          categoryStatus = ApiCallStatus.success;
        }else{
          categoryStatus = ApiCallStatus.empty;
        }

        //CustomSnackBar.showCustomToast(message: "Success");

        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error){
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        categoryStatus = ApiCallStatus.error;
        update();
      },
    );
  }




  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
