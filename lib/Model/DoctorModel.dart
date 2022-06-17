class Doctor {
  late String name;
  late double id;
  late double? rate;
  late String specialize;
  late Schedule schedule;
  late double price;
  late String photo;

  Doctor.fromJson(Map data) {
    this.name = data['name'];
    this.id = data['id'];
    this.rate = data['rate'];
    this.specialize = data['specialize'];
    this.schedule = data['schedule'].isEmpty
        ? Schedule.fromJson({})
        : Schedule.fromJson(data['schedule'][0]);
    this.price = data['price'];
    this.photo = data['photo'];
  }
}

class Schedule {
  List<String> sat_time = [];
  List<String> sun_time = [];
  List<String> mon_time = [];
  List<String> tue_time = [];
  List<String> wed_time = [];
  List<String> fri_time = [];
  List<String> thu_time = [];

  Schedule.fromJson(Map data) {
    if (data.isNotEmpty) {
      this.sat_time = splitTime(data['sat_time']);
      this.sun_time = splitTime(data['sun_time']);
      this.mon_time = splitTime(data['mon_time']);
      this.tue_time = splitTime(data['tue_time']);
      this.wed_time = splitTime(data['wed_time']);
      this.fri_time = splitTime(data['fri_time']);
      this.thu_time = splitTime(data['thu_time']);
    }
  }

  List<String> splitTime(String? time) {
    return time == null ? [] : time.split(' ');
  }
}
