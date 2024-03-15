

import 'package:digit_birth_certification/app/data/models/birth_registration_application.dart';

abstract class BirthRegistrationEvent {}

class BirthRegistrationSaveEvent extends BirthRegistrationEvent {
  final BirthRegistrationApplicationModel birthData;
  BirthRegistrationSaveEvent({
    required this.birthData,
  });
}

class BirthRegistrationUpdateEvent extends BirthRegistrationEvent {
  final BirthRegistrationApplicationModel birthData;
  BirthRegistrationUpdateEvent({
    required this.birthData,
  });
}

class BirthRegistrationInvalidInputEvent extends BirthRegistrationEvent {}

