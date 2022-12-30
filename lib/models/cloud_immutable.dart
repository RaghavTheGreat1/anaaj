import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:anaaj/cloud/cloud_constants.dart';

@immutable
class CloudFood {
  final String documentId;
  final String InstitutionId;
  final String Address;
  final String Quantity;
  final String Time;

  const CloudFood({
    required this.documentId,
    required this.InstitutionId,
    required this.Address,
    required this.Quantity,
    required this.Time,
  });
  CloudFood.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        InstitutionId = snapshot.data()[InstitutionIdRem],
        Address = snapshot.data()[AddressFieldName] as String,
        Quantity = snapshot.data()[QuantityFieldName] as String,
        Time = snapshot.data()[TimeFieldName] as String;
}
