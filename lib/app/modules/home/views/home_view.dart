import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/app_search_text_field.dart';
import 'package:getx_skeleton/app/components/booster.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/category_view.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/header.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/product_view.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/app/services/api_call_status.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height -
    //     MediaQuery.of(context).padding.top -
    //     MediaQuery.of(context).padding.bottom -
    //     MediaQuery.of(context).viewPadding.top -
    //     MediaQuery.of(context).viewPadding.bottom;

    Widget categoriesSection = SizedBox(
      height: 64,
      child: GetBuilder<HomeController>(
        id: "categoryList",
        builder: (ctrl) {
          if(ctrl.categoryStatus == ApiCallStatus.loading){
            return const Center(child: CupertinoActivityIndicator(),);
          }else if(ctrl.categoryStatus == ApiCallStatus.success) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              scrollDirection: Axis.horizontal,
              itemCount: ctrl.categoryList.length,
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () {},
                    // onTap: () => Get.toNamed(Routes.CATEGORY),
                    child: CategoryView(text: ctrl.categoryList[index]),
                  ),
            );
          }else if(ctrl.categoryStatus == ApiCallStatus.empty) {
            return Center(child: Booster.textBody("Empty"),);
          }else if(ctrl.categoryStatus == ApiCallStatus.error) {
            return Center(child: Booster.textBody("Error"),);
          }else{
            return const SizedBox();
          }
        }
      ),
    );

    Widget productSection = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey.shade200,
      child: GetBuilder<HomeController>(
        id: "productList",
        builder: (ctrl) {
          if(ctrl.categoryStatus == ApiCallStatus.loading){
            return const Center(child: CupertinoActivityIndicator(),);
          }else if(ctrl.categoryStatus == ApiCallStatus.success) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ctrl.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                mainAxisExtent: 240,
              ),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  // onTap: () => Get.toNamed(Routes.PRODUCT_DETAILS),
                  child: ProductView(
                    product: ctrl.productList[index],
                  )),
            );
          }else if(ctrl.categoryStatus == ApiCallStatus.empty) {
            return Center(child: Booster.textBody("Empty"),);
          }else if(ctrl.categoryStatus == ApiCallStatus.error) {
            return Center(child: Booster.textBody("Error"),);
          }else{
            return const SizedBox();
          }

        }
      ),
    );

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        actions: const [
          SizedBox(
            width: 40,
            child: Icon(Icons.notifications, color: Colors.black),
          ),
          SizedBox(
            width: 40,
            child: Icon(Icons.menu, color: Colors.black),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const AppSearchTextField(),
              SectionHeader(title: "Categories"),
              categoriesSection,
              const SizedBox(height: 16),
              SectionHeader(title: "Top Deals Electronics"),
              productSection
            ],
          ),
        ),
      ),
    );
  }
}


