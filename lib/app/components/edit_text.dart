import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../config/theme/light_theme_colors.dart';
import 'booster.dart';

class EditText extends StatelessWidget {
  final String hint;
  final String controlName;
  final bool isSecure;
  final bool multiline;
  final int lines;
  final int? maxLength;
  final bool isReadonly;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final bool required;

  const EditText(
      {Key? key, required this.hint,
      required this.controlName,
      this.isSecure = false,
      this.multiline = false,
      this.lines = 3,
      this.maxLength,
      this.inputType,
      this.isReadonly = false,
      this.required = false,
        this.textInputAction,
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Booster.textBody(hint, fontSize: 13.sp, fontWeight: FontWeight.w400),
          //     if(required)
          //     Booster.textBody("*", fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.redAccent),
          //   ],
          // ),
          // 7.verticalSpace,
          ReactiveTextField(
            minLines: multiline ? lines : 1,
            maxLines: multiline ? null : 1,
            maxLength: maxLength,
            keyboardType: inputType ?? (multiline ? TextInputType.multiline : TextInputType.text),
            textInputAction: textInputAction ?? TextInputAction.next,
            readOnly: isReadonly,
            style: TextStyle(fontSize: 13.sp, fontFamily: 'Almarai'),
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 11.sp, fontFamily: 'Almarai'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                hintText: hint,
                hintStyle: TextStyle(color: LightThemeColors.hintTextColor, fontSize: 13.sp, fontFamily: 'Almarai'),
                filled: true,
                fillColor: Colors.transparent,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  //borderSide: BorderSide(color: Colors.white),
                  borderSide: BorderSide(color: LightThemeColors.selectBorderColor.withOpacity(0.4)),
                )),
            obscureText: isSecure,
            formControlName: controlName,
            showErrors: (control) => control.invalid && control.touched,
            validationMessages: {
              ValidationMessage.required: (control) => 'Required',
              ValidationMessage.email: (control) => 'Email not valid',
              ValidationMessage.minLength: (control) => 'Password less than 6 numbers',
              ValidationMessage.max: (control) => 'تجاوزت الحد الأقصى',
            },
          ),
        ],
      );
  }
}
