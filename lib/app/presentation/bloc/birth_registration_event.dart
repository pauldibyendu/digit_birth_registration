
import '../../data/models/birth_registration_application.dart';

abstract class BirthDataEvent {}

class BirthDataInitialEvent extends BirthDataEvent {}

class BirthRegistrationNavigateEvent extends BirthDataEvent {}

class BirthDataSaveEvent extends BirthDataEvent {
  final BirthRegistrationApplicationModel birthData;
  BirthDataSaveEvent({
    required this.birthData,
  });
}

class BirthDataUpdateEvent extends BirthDataEvent {
  final BirthRegistrationApplicationModel birthData;
  BirthDataUpdateEvent({
    required this.birthData,
  });
}

class BirthDataInvalidInputEvent extends BirthDataEvent {}

