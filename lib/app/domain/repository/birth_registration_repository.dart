
import '../../../core/resources/data_state.dart';
import '../../data/models/birth_registration_application.dart';

abstract class BirthRegistrationRepository {

  Future<DataState<List<BirthRegistrationApplicationModel>>> getBirthRegistrations();

  Future<DataState<String>> updateBirthData(BirthRegistrationApplicationModel birthData);

  Future<DataState<String>> saveBirthData(BirthRegistrationApplicationModel birthData);

}