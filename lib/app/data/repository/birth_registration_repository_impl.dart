

import 'dart:io';

import 'package:digit_birth_certification/app/domain/entities/birth_registration_application.dart';
import 'package:dio/dio.dart';
import '../../../core/constant/constants.dart';
import '../../../core/resources/data_state.dart';
import '../../domain/repository/birth_registration_repository.dart';
import '../data_sources/api_service.dart';
import '../models/birth_registration_application.dart';

class BirthRegistrationRepositoryImpl implements BirthRegistrationRepository {

  final ApiService _apiService;

  BirthRegistrationRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<BirthRegistrationApplicationModel>>> getBirthRegistrations() async {

    return DataSuccess(birthList);

    // try {
    //   final httpResponse = await _apiService.getBirthRegistrationList();
    //
    //   if (httpResponse.response.statusCode == HttpStatus.ok) {
    //     return DataSuccess(httpResponse.data);
    //   } else {
    //     return DataFailed(
    //         DioError(
    //             error: httpResponse.response.statusMessage,
    //             response: httpResponse.response,
    //             type: DioErrorType.response,
    //             requestOptions: httpResponse.response.requestOptions
    //         )
    //     );
    //   }
    // } on DioError catch(e){
    //   return DataFailed(e);
    // }

  }

  @override
  Future<DataState<List<BirthRegistrationApplicationModel>>> getBirthRegistrationsSearches(String search) async {

    List<BirthRegistrationApplicationModel> filteredList = birthList.where((person) => search.isEmpty ? true : person.tenantId?.contains(search) ?? false).toList();

    return DataSuccess(filteredList);

  }

  @override
  Future<DataState<String>> saveBirthData(BirthRegistrationApplicationModel birthData) async {

    String id = (birthList.length + 1).toString();
    String applicationNumber = "APP00$id";
    String tennantId = "tenant$id";
    birthData = birthData.copyWith(id: id, applicationNumber: applicationNumber, tenantId: tennantId);
    birthList.add(birthData);

    return const DataSuccess("Data saved successfully");

  }

  @override
  Future<DataState<String>> updateBirthData(BirthRegistrationApplicationModel birthData) async {

    BirthRegistrationApplicationModel updateObject = birthList.firstWhere((obj) => obj.id == birthData.id);
    updateObject = BirthRegistrationApplicationModel.fromJson(birthData.toJson());

    return const DataSuccess("Data updated successfully");

  }

}