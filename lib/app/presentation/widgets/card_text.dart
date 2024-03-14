
import 'package:flutter/cupertino.dart';

import '../../../config/theme/app_themes.dart';

class CardText extends StatelessWidget{

  String ? formName;
  String ? value;

  CardText({this.formName, this.value, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
        text: TextSpan(
          style: subLabel(),
          children: [
            TextSpan(
              text: '$formName: ',
              style: bold(),
            ),
            TextSpan(
              text: '$value',
              style: normal(),
            )
          ]
        )
    );
    throw UnimplementedError();
  }

}

