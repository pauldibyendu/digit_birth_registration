import 'package:digit_birth_certification/app/data/repository/birth_registration_repository_impl.dart';
import 'package:get/get.dart';

import '../../app/domain/repository/birth_registration_repository.dart';
import '../../app/domain/usecase/birth_registration_use_case.dart';
import '../../app/bloc/birth_registration/birth_registration_bloc.dart';

class Bindings{

  static void registerDependencies() {

    // Get.put<BirthRegistrationRepository>(BirthRegistrationRepositoryImpl(_apiService));
    // Get.put<BirthRegistrationBloc>(BirthRegistrationBloc());
    // Get.put<BirthRegistrationUseCase>(BirthRegistrationUseCase());
  }

}