

abstract class BirthRegistrationState {}

abstract class BirthRegistrationActionState extends BirthRegistrationState {}

// initial state
class BirthRegistrationInitialState extends BirthRegistrationState {}

class SuccessActionState extends BirthRegistrationActionState {
  final String successMsg;
  SuccessActionState({
    required this.successMsg,
  });
}

class FailedActionState extends BirthRegistrationActionState {
  final String failedMsg;
  FailedActionState({
    required this.failedMsg,
  });
}

class InvalidDataActionState extends BirthRegistrationActionState {}

