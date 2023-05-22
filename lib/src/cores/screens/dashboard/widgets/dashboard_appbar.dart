import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/colors.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';


class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu, color: Colors.black,),
      title: Text(
        tDashboardAppbarTitle,
        style: Theme.of(context).textTheme.headline4,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 7, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tCardBgColor
          ),
          child: IconButton(
            onPressed: () {
              AuthFactory.instance.logout();
            },
            icon: const Image(
              image: AssetImage(tDashboardUserProfileImage),
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}