
import '../../../core/resources/data_state.dart';
import '../../data/models/birth_registration_application.dart';

abstract class BirthRegistrationRepository {

  Future<DataState<List<BirthRegistrationApplicationModel>>> getBirthRegistrations();

  // Future < void > saveBirthRegistrations(BirthRegistrationApplicationEntity entity);
  //
  // Future < void > updateBirthRegistrations(BirthRegistrationApplicationEntity entity);

}