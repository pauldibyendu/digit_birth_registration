import 'package:flutter/material.dart';

import '../../app/data/models/birth_registration_application.dart';
import '../../app/presentation/features/birth_registration/pages/birth_registration_form.dart';
import '../../app/presentation/features/birth_list/pages/birth_registration_list.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(BirthRegistrationList());

      case '/BirthRegistration':
        return _materialRoute(BirthRegistrationForm(title: "Birth registration form",));

      case '/UpdateBirthData':
        return _materialRoute(BirthRegistrationForm(title: "Update Birth Data form", birthData: settings.arguments as BirthRegistrationApplicationModel,));

      default:
        return _materialRoute(BirthRegistrationList());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
