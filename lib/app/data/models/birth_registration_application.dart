
import '../../domain/entities/birth_registration_application.dart';

class BirthRegistrationApplicationModel extends BirthRegistrationApplicationEntity{

  final String ? id;
  final String ? tenantId;
  final String ? applicationNumber;
  final String ? babyFirstName;
  final String ? babyLastName;
  final String ? father;
  final String ? mother;
  final String ? doctorName;
  final String ? hospitalName;
  final String ? placeOfBirth;
  final int ? timeOfBirth;

  const BirthRegistrationApplicationModel({
    this.id,
    this.tenantId,
    this.applicationNumber,
    this.babyFirstName,
    this.babyLastName,
    this.father,
    this.mother,
    this.doctorName,
    this.hospitalName,
    this.placeOfBirth,
    this.timeOfBirth
  });

  factory BirthRegistrationApplicationModel.fromJson(Map < String, dynamic > map) {
    return BirthRegistrationApplicationModel(
      id: map['id'] ?? "",
      tenantId: map['tenantId'] ?? "",
      applicationNumber: map['applicationNumber'] ?? "",
      babyFirstName: map['babyFirstName'] ?? "",
      babyLastName: map['babyLastName'] ?? "",
      father: map['father'] ?? "",
      mother: map['mother'] ?? "",
      doctorName: map['doctorName'] ?? "",
      hospitalName: map['hospitalName'] ?? "",
      placeOfBirth: map['placeOfBirth'] ?? "",
      timeOfBirth: map['timeOfBirth']
    );
  }

  factory BirthRegistrationApplicationModel.fromEntity(BirthRegistrationApplicationEntity entity) {
    return BirthRegistrationApplicationModel(
      id: entity.id,
      tenantId: entity.tenantId,
      applicationNumber: entity.applicationNumber,
      babyFirstName: entity.babyFirstName,
      babyLastName: entity.babyLastName,
      father: entity.father,
      mother: entity.mother,
      doctorName: entity.doctorName,
      hospitalName: entity.hospitalName,
      placeOfBirth: entity.placeOfBirth,
      timeOfBirth: entity.timeOfBirth,
    );
  }
}

// id:
// type: string
//
// tenantId:
// type: string
//
// applicationNumber:
// type: string
//
// babyFirstName:
// type: string
//
// babyLastName:
// type: string
//
// father:
// mother:
//
// doctorName:
// type: string
//
// hospitalName:
// type: string
//
// placeOfBirth:
// type: string
//
// timeOfBirth:
// type: integer
