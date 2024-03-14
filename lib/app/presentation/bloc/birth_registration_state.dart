
import '../../data/models/birth_registration_application.dart';

abstract class BirthDataState {}

class BirthDataInitial extends BirthDataState {}

class BirthDataLoadingState extends BirthDataState {}

class BirthDataLoadedSuccessState extends BirthDataState {
  final List<BirthRegistrationApplicationModel> birthData;
  BirthDataLoadedSuccessState({
    required this.birthData,
  });
}

class BirthDataErrorState extends BirthDataState {}

abstract class BirthDataActionState extends BirthDataState {}

class NavigateToRegistrationActionState extends BirthDataActionState {}

class SaveDataActionState extends BirthDataActionState {}

class ViewDataState extends BirthDataActionState {}
