import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';

class DashboardGreeterWidget extends StatelessWidget {
  DashboardGreeterWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$tDashboardTitle $name!",
          style: txtTheme.bodyText2,
        ),
        Text(
          tDashboardHeading,
          style: txtTheme.headline2,
        ),
      ],
    );
  }
}