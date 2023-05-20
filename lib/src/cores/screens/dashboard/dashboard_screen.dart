import 'package:flutter/material.dart';

import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'widgets/dashboard_appbar.dart';
import 'widgets/dashboard_banners.dart';
import 'widgets/dashboard_search.dart';
import 'widgets/dashboard_top_parts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: const DashboardAppBard(),
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDashboardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tDashboardTitle,
                    style: txtTheme.bodyText2,
                  ),
                  Text(
                    tDashboardHeading,
                    style: txtTheme.headline2,
                  ),
                  const SizedBox(height: tDashboardPadding,),

                  DashboardSearchWidget(txtTheme: txtTheme),
                  const SizedBox(height: tDashboardPadding,),

                  // DashboardCategoriesWidget(txtTheme: txtTheme),
                  // const SizedBox(height: tDashboardPadding,),

                  Text(
                    tDashboardBannerText,
                    style: Theme.of(context).textTheme.headline4?.apply(fontSizeFactor: 1.2),
                  ),
                  const SizedBox(height: 5,),
                  DashboardBannersWidget(txtTheme: txtTheme),

                  const SizedBox(height: tDashboardPadding,),
                  Text(
                    tDashboardTopPartText,
                    style: Theme.of(context).textTheme.headline4?.apply(fontSizeFactor: 1.2),
                  ),
                  const SizedBox(height: 5,),
                  DashboardTopPartsWidget(txtTheme: txtTheme),
                ],
              ),
            ),
        ),
      ),
    );
  }
}









