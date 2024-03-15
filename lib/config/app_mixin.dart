import 'package:digit_birth_certification/app/presentation/features/birth_list/bloc/birth_list_bloc.dart';
import 'package:digit_birth_certification/app/presentation/features/birth_registration/bloc/birth_registration_bloc.dart';
import 'package:get/get.dart';

import '../app/domain/usecase/birth_registration_use_case.dart';
import '../injection_container.dart';

mixin AppMixin {

  BirthRegistrationBloc birthRegistrationBloc = sl<BirthRegistrationBloc>();

  BirthListBloc birthListBloc = sl<BirthListBloc>();

}