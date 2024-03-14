import 'package:equatable/equatable.dart';

class BirthRegistrationApplicationEntity extends Equatable{

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

  const BirthRegistrationApplicationEntity({
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

  @override
  List < Object ? > get props {
    return [
      id,
      tenantId,
      applicationNumber,
      babyFirstName,
      babyLastName,
      father,
      mother,
      doctorName,
      hospitalName,
      placeOfBirth,
      timeOfBirth
    ];
  }
}