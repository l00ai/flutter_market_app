import 'package:flutter/material.dart';
import '../../../../components/app_icon_button.dart';

class SectionHeader extends StatelessWidget {
  String title;
  Function? onSeeMore;

  SectionHeader({super.key, required this.title, this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 44,
      child: Row(
        children: [
          Text(
            title,
            style: textStyle,
          ),
          const Spacer(),
          AppIconButton(
            title: "See More",
            icon: Icons.chevron_right,
            isTitleFirst: true,
            textStyle: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
