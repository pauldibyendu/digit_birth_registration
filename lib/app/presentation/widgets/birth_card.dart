import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:flutter/material.dart';

import '../../data/models/birth_registration_application.dart';
import 'card_text.dart';

class BirthCard extends StatelessWidget{

  final BirthRegistrationApplicationModel birthApplication;

  const BirthCard({required this.birthApplication, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DigitCard(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                CardText(formName: "Name", value: "${birthApplication.babyFirstName ?? ""} ${birthApplication.babyLastName ?? ""}",),
                CardText(formName: "Application Number", value: "${birthApplication.applicationNumber}",),
                CardText(formName: "Father name", value: "${birthApplication.father}",),
                CardText(formName: "Mother name", value: "${birthApplication.mother}",),
                CardText(formName: "Hospital name", value: "${birthApplication.hospitalName}",),
                CardText(formName: "Place of birth", value: "${birthApplication.placeOfBirth}",),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: DigitOutLineButton(
                        label: 'OPEN',
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: DigitOutLineButton(
                        label: 'EDIT',
                        onPressed: (){
                          Navigator.pushNamed(context, '/UpdateBirthData', arguments: birthApplication);
                        },
                      ),
                    ),
                  ],
                )
            ]
        ),
    );
  }

}