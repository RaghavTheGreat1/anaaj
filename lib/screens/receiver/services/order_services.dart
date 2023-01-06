import 'package:anaaj/models/order.dart' as orderModel;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

var url = Uri(
    host: "192.168.0.115",
    port: 5001,
    scheme: "http",
    path: "anaaj-e5948/us-central1/api/createOrder");

class OrderServices {
  String ordersCollectionPath = 'orders';

  Future<void> placeOrder(orderModel.Order order) async {
    String body = order.toJson().toString();
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
}
