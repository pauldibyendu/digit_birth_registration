import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'app/presentation/pages/birth_registration_list.dart';
import 'config/bindings.dart';
import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bindings.registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: DigitTheme.instance.mobileTheme,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: BirthRegistrationList(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}