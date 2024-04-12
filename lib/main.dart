import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'app/presentation/features/birth_list/pages/birth_registration_list.dart';
import 'config/bindings/bindings.dart';
import 'config/routes/routes.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
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
    );
  }
}