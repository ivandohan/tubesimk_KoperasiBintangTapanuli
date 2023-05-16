import 'package:flutter/material.dart';
import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * 0.3,
        ),
        const SizedBox(height: 10,),
        Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}