import 'package:digit_birth_certification/app/data/repository/birth_registration_repository_impl.dart';
import 'package:digit_birth_certification/app/domain/usecase/birth_registration_use_case.dart';
import 'package:get_it/get_it.dart';

import 'app/data/data_sources/api_service.dart';
import 'app/domain/repository/birth_registration_repository.dart';
import 'app/bloc/birth_list/birth_list_bloc.dart';
import 'app/bloc/birth_registration/birth_registration_bloc.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<ApiService>(ApiService(sl()));

  sl.registerSingleton<BirthRegistrationRepository>(
      BirthRegistrationRepositoryImpl(sl())
  );

  sl.registerSingleton<BirthRegistrationUseCase>(
      BirthRegistrationUseCase(sl())
  );

  sl.registerSingleton<BirthRegistrationBloc>(
      BirthRegistrationBloc(sl())
  );

  sl.registerSingleton<BirthListBloc>(
      BirthListBloc(sl())
  );

}