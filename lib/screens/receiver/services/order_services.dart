import 'dart:convert';

import 'package:anaaj/models/order.dart' as orderModel;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

var url = Uri(
    scheme: "https",
    host: "us-central1-anaaj-e5948.cloudfunctions.net",
    path: "api/createOrder");

// var url = Uri(
//     scheme: "https",
//     host: "us-central1-anaaj-e5948.cloudfunctions.net",
//     path: "api/createOrder");

class OrderServices {
  String ordersCollectionPath = 'orders';

  Future<void> placeOrder(orderModel.Order order) async {
    var body = json.encode(order);
    print(body);
    final res = await post(url, body: body);
    print("placedOrder");
    print(res.body);
  }

  Future<orderModel.Order?> fetchOrderById(String id) async {
    final fetchedOrder = await FirebaseFirestore.instance
        .collection(ordersCollectionPath)
        .doc(id)
        .get();
    final rawOrder = fetchedOrder.data();
    if (rawOrder != null) {
      final parsedOrder = orderModel.Order.fromJson(rawOrder);
      return parsedOrder;
    }
    return null;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      fetchOrdersByReceiverId(String id) async {
    final fetchedOrder = await FirebaseFirestore.instance
        .collection(ordersCollectionPath)
        .where(
          'receiverInstituition.id',
          isEqualTo: id,
        )
        .get();

    return fetchedOrder.docs;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchOrdersStreamByReceiverId(
      String id) {
    final fetchedOrderSnapshots = FirebaseFirestore.instance
        .collection(ordersCollectionPath)
        .where(
          'receiverInstituition.id',
          isEqualTo: id,
        )
        .snapshots();

    return fetchedOrderSnapshots;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      fetchOrdersByDonorId(String id) async {
    final fetchedOrder = await FirebaseFirestore.instance
        .collection(ordersCollectionPath)
        .where(
          'donorInstituition.id',
          isEqualTo: id,
        )
        .get();

    return fetchedOrder.docs;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchOrdersStreamByDonorId(
      String id) {
    final fetchedOrderSnapshots = FirebaseFirestore.instance
        .collection(ordersCollectionPath)
        .where(
          'donorInstituition.id',
          isEqualTo: id,
        )
        .snapshots();

    return fetchedOrderSnapshots;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchOrdersStreamByVolunteerId(
      String id) {
    final fetchedOrderSnapshots = FirebaseFirestore.instance
        .collection(ordersCollectionPath)
        .where(
          'volunteer.id',
          isEqualTo: id,
        )
        .snapshots();

    return fetchedOrderSnapshots;
  }
}
