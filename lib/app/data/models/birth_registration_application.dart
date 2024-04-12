
import 'package:freezed_annotation/freezed_annotation.dart';

part 'birth_registration_application.freezed.dart';
part 'birth_registration_application.g.dart';

// class BirthRegistrationApplicationModel {
//
//   String ? id;
//   String ? tenantId;
//   String ? applicationNumber;
//   String ? babyFirstName;
//   String ? babyLastName;
//   String ? father;
//   String ? mother;
//   String ? doctorName;
//   String ? hospitalName;
//   String ? placeOfBirth;
//   int ? timeOfBirth;
//
//   BirthRegistrationApplicationModel({
//     this.id,
//     this.tenantId,
//     this.applicationNumber,
//     this.babyFirstName,
//     this.babyLastName,
//     this.father,
//     this.mother,
//     this.doctorName,
//     this.hospitalName,
//     this.placeOfBirth,
//     this.timeOfBirth
//   });
//
//   factory BirthRegistrationApplicationModel.fromJson(Map < String, dynamic > map) {
//     return BirthRegistrationApplicationModel(
//       id: map['id'] ?? "",
//       tenantId: map['tenantId'] ?? "",
//       applicationNumber: map['applicationNumber'] ?? "",
//       babyFirstName: map['babyFirstName'] ?? "",
//       babyLastName: map['babyLastName'] ?? "",
//       father: map['father'] ?? "",
//       mother: map['mother'] ?? "",
//       doctorName: map['doctorName'] ?? "",
//       hospitalName: map['hospitalName'] ?? "",
//       placeOfBirth: map['placeOfBirth'] ?? "",
//       timeOfBirth: map['timeOfBirth']
//     );
//   }
//
//   factory BirthRegistrationApplicationModel.fromEntity(BirthRegistrationApplicationEntity entity) {
//     return BirthRegistrationApplicationModel(
//       id: entity.id,
//       tenantId: entity.tenantId,
//       applicationNumber: entity.applicationNumber,
//       babyFirstName: entity.babyFirstName,
//       babyLastName: entity.babyLastName,
//       father: entity.father,
//       mother: entity.mother,
//       doctorName: entity.doctorName,
//       hospitalName: entity.hospitalName,
//       placeOfBirth: entity.placeOfBirth,
//       timeOfBirth: entity.timeOfBirth,
//     );
//   }
//
//   copyFrom(BirthRegistrationApplicationModel entity){
//     id = entity.id;
//     tenantId = entity.tenantId;
//     applicationNumber = entity.applicationNumber;
//     babyFirstName = entity.babyFirstName;
//     babyLastName = entity.babyLastName;
//     father = entity.father;
//     mother = entity.mother;
//     doctorName = entity.doctorName;
//     hospitalName = entity.hospitalName;
//     placeOfBirth = entity.placeOfBirth;
//     timeOfBirth = entity.timeOfBirth;
//   }
//
// }


@freezed
class BirthRegistrationApplicationModel with _$BirthRegistrationApplicationModel {

  const factory BirthRegistrationApplicationModel({
    String? id,
    String? tenantId,
    String? applicationNumber,
    String? babyFirstName,
    String? babyLastName,
    String? father,
    String? mother,
    String? doctorName,
    String? hospitalName,
    String? placeOfBirth,
    int? timeOfBirth
  }) = _BirthRegistrationApplicationModel;

  factory BirthRegistrationApplicationModel.mutable({
    String? id,
    String? tenantId,
    String? applicationNumber,
    String? babyFirstName,
    String? babyLastName,
    String? father,
    String? mother,
    String? doctorName,
    String? hospitalName,
    String? placeOfBirth,
    int? timeOfBirth
  }) = _MutableBirthRegistrationApplicationModel;

  factory BirthRegistrationApplicationModel.fromJson(
      Map<String, dynamic> json) =>
      _$BirthRegistrationApplicationModelFromJson(json);

}
