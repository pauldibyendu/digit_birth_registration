import 'dart:async';

import 'package:digit_birth_certification/app/data/models/birth_registration_application.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/constants.dart';
import 'birth_registration_event.dart';
import 'birth_registration_state.dart';

class BirthRegistrationBloc extends Bloc<BirthDataEvent, BirthDataState> {

  BirthRegistrationBloc() : super(BirthDataInitial()) {
    on<BirthDataInitialEvent>(birthDataInitialEvent);
    on<BirthRegistrationNavigateEvent>(birthRegistrationNavigateEvent);
    on<BirthDataSaveEvent>(saveBirthDataEvent);
    on<BirthDataUpdateEvent>(updateBirthDataEvent);
    on<BirthDataInvalidInputEvent>(invalidBirthDataEvent);
  }

  FutureOr<void> birthDataInitialEvent(BirthDataInitialEvent event,
      Emitter<BirthDataState> emit) async {
    emit(BirthDataLoadedSuccessState(birthData: birthList));
  }

  FutureOr<void> birthRegistrationNavigateEvent(BirthRegistrationNavigateEvent event,
      Emitter<BirthDataState> emit) async {
    emit(NavigateToRegistrationActionState());
  }

  FutureOr<void> saveBirthDataEvent(BirthDataSaveEvent event,
      Emitter<BirthDataState> emit) async {
    event.birthData.id = (birthList.length + 1).toString();
    event.birthData.applicationNumber = "APP00${event.birthData.id!}";
    birthList.add(event.birthData);
    emit(SaveDataActionState());
  }

  FutureOr<void> updateBirthDataEvent(BirthDataUpdateEvent event,
      Emitter<BirthDataState> emit) async {
    BirthRegistrationApplicationModel updateObject = birthList.firstWhere((obj) => obj.id == event.birthData.id);
    updateObject.copyFrom(event.birthData);
    emit(UpdateDataActionState());
  }

  FutureOr<void> invalidBirthDataEvent(BirthDataInvalidInputEvent event,
      Emitter<BirthDataState> emit) async {
    emit(InvalidDataActionState());
  }

}