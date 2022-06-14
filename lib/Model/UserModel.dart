class User {
  late String name;
  late String phone;
  late String email;

  User.fromJson(Map data) {
    this.name = data['name'];
    this.email = data['email'];
    this.phone = data['phone'];
  }
}
