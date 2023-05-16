import 'package:flutter/material.dart';

class ForgetPwBtnWidget extends StatelessWidget {
  const ForgetPwBtnWidget({
    required this.iconData,
    required this.title,
    required this.subTitle,
    required this.onTap,
    super.key,
  });

  final IconData iconData;
  final String title, subTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  Theme.of(context).textTheme.headline6,
                ),
                Text(
                  subTitle,
                  style:
                  Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}