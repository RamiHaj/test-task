// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'package:test_task/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

List<ProductElement> productFromJson(List str) =>
    List<ProductElement>.from(str.map((x) => ProductElement.fromJson(x)));

@Entity()
class ProductElement {
  ProductElement({
    required this.name,
    required this.id,
    required this.price,
    required this.rate,
    required this.description,
    required this.imageUrl,
    this.count = 0,
  });
  @Id(assignable: true)
  final int id;
  final String name;
  final int price;
  double rate;
  String description;
  String imageUrl;
  int count;
  final market = ToOne<Market>();

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    name: json["name"],
    id: int.parse(json["id"]),
    price: json["price"],
    rate: json["rate"].toDouble()?? 2.5,
    description: json["description"]??"No Description",
    imageUrl: json["imageUrl"]??'https://bitsofco.de/content/images/2018/12/broken-1.png',
  )..market.target = Market.fromJson(json["market"]);

}
@Entity()
class Market {
  Market({
    this.id = 0,
    required this.name,
    required this.address,
  });

  int id;
  String? name;
  String? address;
  @Backlink()
  final productElement= ToMany<ProductElement>();

  factory Market.fromJson(Map<String, dynamic> json) => Market(
    name: json["name"],
    address: json["address"],
  );

}
