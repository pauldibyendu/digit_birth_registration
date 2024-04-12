
import 'dart:async';

import 'package:digit_birth_certification/app/domain/usecase/birth_registration_use_case.dart';
import 'package:digit_birth_certification/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'birth_list_event.dart';
import 'birth_list_state.dart';


class BirthListBloc extends Bloc<BirthListEvent, BirthListState> {

  final BirthRegistrationUseCase _birthRegistrationUseCase;

  BirthListBloc(this._birthRegistrationUseCase) : super(BirthListInitialState()) {
    on<BirthListInitialEvent>(birthDataInitialEvent);
    on<BirthListSearchEvent>(birthDataSearchEvent);
  }

  FutureOr<void> birthDataInitialEvent(BirthListInitialEvent event,
      Emitter<BirthListState> emit) async {

    emit(BirthListLoadingState());

    final dataState = await _birthRegistrationUseCase.getBirthData();

    if(dataState is DataSuccess){
      emit(BirthListLoadedSuccessState(birthData: dataState.data ?? []));
    }
    if(dataState is DataFailed){
      emit(BirthListErrorState(errorMsg: dataState.error?.message ?? ""));
    }

  }

  FutureOr<void> birthDataSearchEvent(BirthListSearchEvent event,
      Emitter<BirthListState> emit) async {

    emit(BirthListLoadingState());

    final dataState = await _birthRegistrationUseCase.getFilteredBirthData(event.searchString);

    if(dataState is DataSuccess){
      emit(BirthListLoadedSuccessState(birthData: dataState.data ?? []));
    }
    if(dataState is DataFailed){
      emit(BirthListErrorState(errorMsg: dataState.error?.message ?? ""));
    }

  }

}


