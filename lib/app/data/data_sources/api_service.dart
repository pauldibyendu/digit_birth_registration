
// import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constant/constants.dart';
import '../models/birth_registration_application.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: apiBaseURL)
abstract class ApiService {

  factory ApiService(Dio dio) = _ApiService;

  @GET('/birth/registration/v1/_search')
  Future<HttpResponse<List<BirthRegistrationApplicationModel>>> getBirthRegistrationList();

}