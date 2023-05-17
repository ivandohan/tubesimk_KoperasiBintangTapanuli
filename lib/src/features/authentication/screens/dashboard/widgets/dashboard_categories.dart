import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/features/authentication/models/dashboard_category_model.dart';
import '../../../../../constants/colors.dart';

class DashboardCategoriesWidget extends StatelessWidget {
  const DashboardCategoriesWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoryModel.list;

    return Container(
      height: 60,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.black26.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (_, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 170,
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tDarkColor,
                  ),
                  child: Center(
                    child: Text(
                      list[index].title,
                      style: txtTheme.headline6?.apply(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        list[index].heading,
                        style: txtTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        list[index].subHeading,
                        style: txtTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
