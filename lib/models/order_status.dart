enum OrderStatus {
  placed,
  inTransit,
  delivered,
}

extension OrderStatusExt on OrderStatus {

  String get displayName {
    String name;
    switch (this) {
      case OrderStatus.placed:
        name = 'Placed';
        break;
      case OrderStatus.inTransit:
        name = 'In Transit';
        break;
      case OrderStatus.delivered:
        name = 'Delivered';
        break;
      default:
        name = 'Placed';
        break;
    }
    return name;
  }
}