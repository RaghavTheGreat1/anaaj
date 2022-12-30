import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:anaaj/cloud/cloud_constants.dart';
import 'package:anaaj/cloud/exceptions.dart';
import 'package:anaaj/models/cloud_immutable.dart';

// import 'package:flutter_test_for_vs/services/crud/notes_services.dart';

class CloudStorage {
  final Food = FirebaseFirestore.instance.collection('FoodData');

  Future<void> deleteFoodCard({
    required String documentId,
  }) async {
    try {
      Food.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteFood();
    }
  }

  Future<void> updateNote({
    required String documentId,
    required String text,
  }) async {
    try {
      // log("${text} text to higher");
      await Food.doc(documentId).update({
        InstitutionIdRem: InstitutionIdRem,
        QuantityFieldName: QuantityFieldName,
        TimeFieldName: TimeFieldName,
        AddressFieldName: AddressFieldName,
      });
    } catch (e) {
      log("in the exp");
      throw CouldNotUpdateFood();
    }
  }
  // Stream<Iterable<CloudFood>> allFoodCards({required String InstitutionIdRem}) {
  //   try {
  //     return Food.snapshots().map((event) => event.docs
  //         .map((e) => CloudFood.fromSnapshot(e))
  //         .where((Food) => Food.InstitutionIdRem== InstitutionIdRem));
  //   } catch (e) {
  //     e.toString();
  //     return Food.snapshots().map((event) => event.docs
  //         .map((e) => CloudFood.fromSnapshot(e))
  //         .where((Food) => Food.InstitutionIdRem == InstitutionIdRem));
  //   }
  // }

  Future<CloudFood> createNewFoodCard(
      {required String InstitutionIdFieldName,
      QuantityFieldName,
      TimeFieldName,
      AddressFieldName}) async {
    final document = await Food.add({
      InstitutionIdRem: InstitutionIdRem,
      QuantityFieldName: QuantityFieldName,
      TimeFieldName: TimeFieldName,
      AddressFieldName: AddressFieldName,
    });
    final fetchNote = await document.get();
    return CloudFood(
      documentId: fetchNote.id,
      InstitutionId: InstitutionIdFieldName,
      Address: AddressFieldName,
      Quantity: TimeFieldName,
      Time: AddressFieldName,
    );
  }

  static final CloudStorage _shared = CloudStorage._sharedinstance();

  CloudStorage._sharedinstance();
  factory CloudStorage() => _shared;
}
