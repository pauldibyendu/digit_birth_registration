import 'package:digit_birth_certification/app/bloc/birth_list/birth_list_bloc.dart';
import 'package:digit_birth_certification/app/bloc/birth_registration/birth_registration_bloc.dart';
import 'package:get/get.dart';

import '../../app/domain/usecase/birth_registration_use_case.dart';
import '../../injection_container.dart';

mixin AppMixin {

  BirthRegistrationBloc birthRegistrationBloc = sl<BirthRegistrationBloc>();

  BirthListBloc birthListBloc = sl<BirthListBloc>();

}