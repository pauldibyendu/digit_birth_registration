import 'package:get/get.dart';

import '../app/presentation/bloc/birth_registration_bloc.dart';

class Bindings{

  static void registerDependencies() {
    Get.put<BirthRegistrationBloc>(BirthRegistrationBloc());
  }

}