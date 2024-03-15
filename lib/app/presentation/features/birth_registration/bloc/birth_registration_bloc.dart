import 'dart:async';

import 'package:digit_birth_certification/app/data/models/birth_registration_application.dart';
import 'package:digit_birth_certification/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../domain/usecase/birth_registration_use_case.dart';
import 'birth_registration_event.dart';
import 'birth_registration_state.dart';

class BirthRegistrationBloc extends Bloc<BirthRegistrationEvent, BirthRegistrationState> {

  final BirthRegistrationUseCase _birthRegistrationUseCase;

  BirthRegistrationBloc(this._birthRegistrationUseCase) : super(BirthRegistrationInitialState()) {
    on<BirthRegistrationSaveEvent>(saveBirthDataEvent);
    on<BirthRegistrationUpdateEvent>(updateBirthDataEvent);
    on<BirthRegistrationInvalidInputEvent>(invalidBirthDataEvent);
  }

  FutureOr<void> saveBirthDataEvent(BirthRegistrationSaveEvent event,
      Emitter<BirthRegistrationState> emit) async {

    final dataState = await _birthRegistrationUseCase.saveBirthData(event.birthData);

    if(dataState is DataSuccess){
      emit(SuccessActionState(successMsg: dataState.data ?? ""));
    }
    if(dataState is DataFailed){
      emit(FailedActionState(failedMsg: dataState.error?.message ?? ""));
    }

  }

  FutureOr<void> updateBirthDataEvent(BirthRegistrationUpdateEvent event,
      Emitter<BirthRegistrationState> emit) async {

    final dataState = await _birthRegistrationUseCase.updateBirthData(event.birthData);

    if(dataState is DataSuccess){
      emit(SuccessActionState(successMsg: dataState.data ?? ""));
    }
    if(dataState is DataFailed){
      emit(FailedActionState(failedMsg: dataState.error?.message ?? ""));
    }

  }

  FutureOr<void> invalidBirthDataEvent(BirthRegistrationInvalidInputEvent event,
      Emitter<BirthRegistrationState> emit) async {
    emit(InvalidDataActionState());
  }

}