import 'package:anaaj/screens/receiver/services/order_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final donorOrdersListStreamProvider =
    StreamProvider.family<QuerySnapshot<Map<String, dynamic>>, String>(
        (ref, id) {
  return OrderServices().fetchOrdersStreamByDonorId(id);
});
