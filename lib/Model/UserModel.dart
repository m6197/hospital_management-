class User {
  late String name;
  late String phone;
  late String email;
  List<Reservation> reservations = [];
  User.fromJson(Map data) {
    this.name = data['name'];
    this.email = data['email'];
    this.phone = data['phone'];
    data['reservation'].forEach((i) {
      this.reservations.add(Reservation.fromJson(i));
    });
  }
}

class Reservation {
  late double id;
  late double reserved_to;
  late double price;
  late String reservation_date;
  late String reservation_time;
  late String type;
  late String status;
  late double? rate;
  late String payment_method;
  late String payment_status;

  Reservation.fromJson(Map data) {
    this.id = data['id'];
    this.reserved_to = data['reserved_to'];
    this.price = data['price'];
    this.reservation_date = data['reservation_date'];
    this.reservation_time = data['reservation_time'];
    this.type = data['type'];
    this.status = data['status'];
    this.rate = data['rate'];

    this.payment_method = data['payment_method'];
    this.payment_status = data['payment_status'];
  }
}
