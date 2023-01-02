enum Role {
  donor,
  volunteer,
  receiver,
}

extension RoleExt on Role {

  String get capName {
    return this.name.substring(0, 1) + this.name.substring(1);
  }
}