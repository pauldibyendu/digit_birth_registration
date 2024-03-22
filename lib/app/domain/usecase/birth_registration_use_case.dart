import 'package:digit_birth_certification/app/data/models/birth_registration_application.dart';
import 'package:digit_birth_certification/app/domain/repository/birth_registration_repository.dart';
import 'package:digit_birth_certification/core/resources/data_state.dart';

class BirthRegistrationUseCase {

  final BirthRegistrationRepository _birthRegistrationRepository;

  BirthRegistrationUseCase(this._birthRegistrationRepository);

  Future<DataState<List<BirthRegistrationApplicationModel>>> getBirthData() {
    return _birthRegistrationRepository.getBirthRegistrations();
  }

  Future<DataState<List<BirthRegistrationApplicationModel>>> getFilteredBirthData(String search) {
    return _birthRegistrationRepository.getBirthRegistrationsSearches(search);
  }

  Future<DataState<String>> updateBirthData(BirthRegistrationApplicationModel birthData) {
    return _birthRegistrationRepository.updateBirthData(birthData);
  }

  Future<DataState<String>> saveBirthData(BirthRegistrationApplicationModel birthData) {
    return _birthRegistrationRepository.saveBirthData(birthData);
  }

}