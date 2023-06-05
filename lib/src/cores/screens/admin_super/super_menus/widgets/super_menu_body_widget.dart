import 'package:flutter/material.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';

class SuperMenuBodyWidget extends StatelessWidget {
  const SuperMenuBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            Text(
              "Seluruh Menu",
              style: txtTheme.headline4,
            ),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
