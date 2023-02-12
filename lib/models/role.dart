enum Role {
  donor,
  volunteer,
  receiver,
}

extension RoleExt on Role {
  String get capName {
    return this.name.substring(0, 1).toUpperCase() + this.name.substring(1);
  }

  static Role getRoleByIndex(int index) {
    return Role.values.elementAt(index);
  }
}
