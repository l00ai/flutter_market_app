import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:getx_skeleton/app/data/models/product.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';
import '../../../services/location_service.dart';

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
        update(['categoryList']);
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

        update(['categoryList']);
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error){
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        categoryStatus = ApiCallStatus.error;
        update(['categoryList']);
      },
    );
  }




  List<Product> productList = [];
  ApiCallStatus productStatus = ApiCallStatus.holding;

  getProducts() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.getProducts, // url
      RequestType.get, // re
      // quest type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
        productStatus = ApiCallStatus.loading;
        update(['productList']);
      },
      onSuccess: (response){ // api done successfully
        productList = (response.data['products'] as List).map((e) => Product.fromJson(e)).toList();
        // *) indicate success state

        if(productList.isNotEmpty){
          productStatus = ApiCallStatus.success;
        }else{
          productStatus = ApiCallStatus.empty;
        }

        //CustomSnackBar.showCustomToast(message: "Success");

        update(['productList']);
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error){
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        productStatus = ApiCallStatus.error;
        update(['productList']);
      },
    );
  }



  callData() async {
    await LocationService.initLocationService();

    final locationData = LocationService.getLocationData();

    Logger().w(locationData?.latitude ?? "_");
    Logger().w(locationData?.longitude ?? "-");

   await getCategories();
   await getProducts();
  }


  @override
  void onInit() {
    callData();
    super.onInit();
  }
}
