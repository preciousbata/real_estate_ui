import '../model/house_model.dart';

//Houses
final _house1 = House(
  price: 560,
  name: 'Hobbit House Summer',
  location: 'Kec, Liverpool',
  imageurl: 'assets/images/h1.jpg',
);
final _house2 = House(
  price: 500,
  name: 'White House',
  location: 'Zone 6',
  imageurl: 'assets/images/h2.jpg',
);
final _house3 = House(
  price: 579,
  location: 'Enugu',
  name: 'Lagos',
  imageurl: 'assets/images/h3.jpg',
);

final List<House> Houses = [_house1, _house2, _house3];
