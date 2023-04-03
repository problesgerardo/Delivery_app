
import 'package:delivery_app/src/features/domain/Entities/User/UserEntity.dart';

class SaveUserDataUseCaseParameters {

  SaveUserDataUseCaseParameters({
    this.localId,
    this.role,
    this.userName,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.startDate,
    this.photo,
    this.shippingAddress,
    this.billingAddress,
    this.IdToken,
  });

  String? localId;
  UserRole? role;
  String? userName;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? startDate;
  String? photo;
  String? shippingAddress;
  String? billingAddress;
  String? IdToken;

  Map<String, dynamic> toJson /*toMap*/() => {
    "localId": localId == null ? null : localId,
    "role": role == null ? null : role,
    "userName": userName == null ? null : userName,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "dateOfBirth": dateOfBirth == null ? null : dateOfBirth,
    "startDate": startDate == null ? null : startDate,
    "photo": photo == null ? null : photo,
    "shippingAddress": shippingAddress == null ? null : shippingAddress,
    "billingAddress": billingAddress == null ? null : billingAddress,
    "IdToken": IdToken == null ? null : IdToken,

  };
}