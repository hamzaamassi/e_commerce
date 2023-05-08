class Item {
  late String imagePath;
  late double price;
  late String name;

  Item({required this.imagePath, required this.name, required this.price});
}
final List items = [
  Item(imagePath: "assets/images/photo1.jpg", price: 13, name: "سكلبشر"),
  Item(imagePath: "assets/images/photo2.jpg", price: 13, name: "انفكتوس"),
  Item(imagePath: "assets/images/photo3.jpg", price: 13, name: "دنهل دزير"),
  Item(imagePath: "assets/images/photo4.jpg", price: 13, name: "أزارو وانتد"),
  Item(imagePath: "assets/images/photo5.jpg", price: 13, name: "سكلبشر"),
  Item(imagePath: "assets/images/photo7.jpg", price: 13, name: "دنهل دزير"),
  Item(imagePath: "assets/images/photo8.jpg", price: 13, name: "أزارو وانتد"),
  Item(imagePath: "assets/images/photo9.jpg", price: 13, name: "سكلبشر"),
  Item(imagePath: "assets/images/photo10.jpg", price: 13, name: "انفكتوس"),
  Item(imagePath: "assets/images/photo11.jpg", price: 13, name: "دنهل دزير"),
  Item(
      imagePath: "assets/images/photo12.jpg", price: 13, name: "أزارو وانتد"),
];
