class Doctor {
  late String name;
  late double id;
  late double? rate;
  late String specialize;

  Doctor.fromJson(Map data) {
    this.name = data['name'];
    this.id = data['id'];
    this.rate = data['rate'];
    this.specialize = data['specialize'];
  }
}
