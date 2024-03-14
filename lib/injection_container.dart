import 'package:get/get.dart';


import 'app/presentation/bloc/birth_registration_bloc.dart';


Future<void> initializeDependencies() async {

  Get.put(BirthRegistrationBloc());

  Get.find<BirthRegistrationBloc>();

}