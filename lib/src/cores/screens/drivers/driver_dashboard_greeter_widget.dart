import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';


class DriverDashboardGreeterWidget extends StatelessWidget {
  DriverDashboardGreeterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$tDashboardTitle Supir!",
          style: txtTheme.bodyText2,
        ),
        Text(
          "Sudah siap untuk pergi?",
          style: txtTheme.headline2,
        ),
      ],
    );
  }
}