import 'package:flutter/material.dart';

class SuperMenuCardsWidget extends StatefulWidget {
  const SuperMenuCardsWidget({super.key, required this.menuTitle, required this.onTap});

  final String menuTitle;
  final onTap;

  @override
  State<SuperMenuCardsWidget> createState() => _SuperMenuCardsWidgetState();
}

class _SuperMenuCardsWidgetState extends State<SuperMenuCardsWidget> {
  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: 60,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.menuTitle,
                    style: txtTheme.bodyText1,
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
      ),
    );
  }
}