import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentAssignedStreamProvider =
    StreamProvider.family<QuerySnapshot<Map<String, dynamic>>, String>(
        (ref, id) {
  return FirebaseFirestore.instance
      .collection('orders')
      .where(
        "volunteer.id",
        isEqualTo: id,
      )
      .snapshots();
});
