import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrderAppBar({
    super.key,
    required this.icon,
    required this.title
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
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
          child: Icon(icon, color: Colors.black54,),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}