import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/factory/auth_factory.dart';


class DriverDashboardAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const DriverDashboardAppbarWidget({
    super.key,
    required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
        color: Colors.black,
      ),
      title: Text(
        title,
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
          ),
          child: IconButton(
            onPressed: () {
              AuthFactory.instance.logout();
            },
            icon: Icon(Icons.dashboard_outlined, color: Colors.black,),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}