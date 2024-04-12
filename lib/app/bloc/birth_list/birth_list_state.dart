

import 'package:digit_birth_certification/app/data/models/birth_registration_application.dart';

abstract class BirthListState {}

abstract class BirthListActionState extends BirthListState {}

// initial state
class BirthListInitialState extends BirthListState {}

class BirthListLoadingState extends BirthListState {}

class BirthListLoadedSuccessState extends BirthListState {
  final List<BirthRegistrationApplicationModel> birthData;
  BirthListLoadedSuccessState({
    required this.birthData,
  });
}

class BirthListErrorState extends BirthListState {
  final String errorMsg;
  BirthListErrorState({
    required this.errorMsg,
  });
}