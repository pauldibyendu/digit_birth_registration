import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/constants.dart';
import 'birth_registration_event.dart';
import 'birth_registration_state.dart';

class BirthRegistrationBloc extends Bloc<BirthDataEvent, BirthDataState> {

  BirthRegistrationBloc() : super(BirthDataInitial()) {
    on<BirthDataInitialEvent>(birthDataInitialEvent);
    on<BirthRegistrationNavigateEvent>(birthRegistrationNavigateEvent);
    on<BirthDataSaveEvent>(saveBirthDataEvent);
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
    birthList.add(event.birthData);
    emit(BirthDataInitial());
  }

}