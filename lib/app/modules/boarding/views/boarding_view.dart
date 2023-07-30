import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/booster.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../controllers/boarding_controller.dart';

class BoardingView extends GetView<BoardingController> {
  const BoardingView({Key? key}) : super(key: key);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              child: Image.asset(
                width: size.width * 0.6,
                "assets/images/logo.png", color: Colors.white,),
            ),


            Booster.textTitle("We Provide The Best Electronic Products From Great Brands", textAlign: TextAlign.center),

            50.verticalSpace,

            Booster.textBody("We will be able to find a wide selection of electronics from top brand", textAlign: TextAlign.center),

            50.verticalSpace,

            IconButton(
              onClicked: () => Get.toNamed(Routes.SIGNUP),
            ),

            30.verticalSpace,

          ],
        ),
      )
    );
  }
}


class IconButton extends StatelessWidget {
  final Function onClicked;
  const IconButton({Key? key, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Material(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: ()=> onClicked(),
        borderRadius: BorderRadius.circular(15),
        child: Ink(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.arrow_forward, color: Colors.black,)
        ),
      ),
    );
  }
}

