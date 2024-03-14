import 'package:flutter/material.dart';

import '../../app/presentation/pages/birth_registration_form.dart';
import '../../app/presentation/pages/birth_registration_list.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(BirthRegistrationList());

      case '/BirthRegistration':
        return _materialRoute(const BirthRegistrationForm(title: "Birth registration form",));
        
      default:
        return _materialRoute(BirthRegistrationList());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
