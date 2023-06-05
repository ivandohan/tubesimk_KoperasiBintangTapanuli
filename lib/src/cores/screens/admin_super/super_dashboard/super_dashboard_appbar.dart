import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/text_strings.dart';

class SuperDashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SuperDashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => // Ensure Scaffold is in context
        IconButton(
          icon: Icon(Icons.menu, color: Colors.black,),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
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
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dashboard_outlined,
              color: Colors.black,
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