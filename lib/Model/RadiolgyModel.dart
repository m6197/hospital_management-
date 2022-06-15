class Radiolgy {
  late double id;
  late String name;
  late List description;
  late List instructions;
  late double price;
  late String category;

  Radiolgy.froJson(Map data) {
    this.id = data['id'];
    this.name = data['name'];
    this.description = data['description'].split(',,,');
    this.instructions = data['instructions'].split(',,,');
    this.price = data['price'];
    this.category = data['category'];
  }
}
