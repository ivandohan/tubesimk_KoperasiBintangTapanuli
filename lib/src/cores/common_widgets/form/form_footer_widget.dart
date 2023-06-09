import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/image_strings.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget({
    super.key,
    required this.buttonLabel,
    required this.textSpan1,
    required this.textSpan2,
    this.onPressed,
  });

  final String buttonLabel, textSpan1, textSpan2;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: tFormHeight - 20,
        ),
        Center(
          child: TextButton(
            onPressed: onPressed,
            child: Text.rich(
              TextSpan(
                text: textSpan1,
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                    text: textSpan2,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}