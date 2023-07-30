import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_skeleton/app/components/booster.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function onTap;
  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: ()=> onTap(),
        borderRadius: BorderRadius.circular(6.r),
        child: Ink(
          height: 45.h,
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(6.r)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Booster.textBody(label, fontWeight: FontWeight.bold, fontSize: 18),
                const Icon(Icons.arrow_forward, color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
