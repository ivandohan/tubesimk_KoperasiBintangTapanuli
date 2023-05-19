import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';

class DashboardSearchWidget extends StatelessWidget {
  const DashboardSearchWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tDashboardSearch,
            style: txtTheme.headline2?.apply(color: Colors.grey.withOpacity(0.5)),
          ),
          const Icon(Icons.mic, size: 25,),
        ],
      ),
    );
  }
}