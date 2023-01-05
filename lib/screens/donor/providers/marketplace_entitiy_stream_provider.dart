import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final marketplaceEntityStreamProvider =
    StreamProvider.family<DocumentSnapshot<Map<String, dynamic>>, String>(
        (ref, donorId) {
  return FirebaseFirestore.instance
      .collection('marketplace')
      .doc(donorId)
      .snapshots();
});
