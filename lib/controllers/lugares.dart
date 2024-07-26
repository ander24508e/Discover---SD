class Lugar {
  String name;
  String imagePath;
  String rating;
  String hora;
  String imagePathing;
  String direcc;
  String description;

  Lugar({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.hora,
    required this.imagePathing,
    required this.direcc,
    required this.description,
  });

  String get _name => name;
  String get _imagePath => imagePath;
  String get _rating => rating;
  String get _hora => hora;
  String get _imagePathing => imagePathing;
  String get _direcc => direcc;
  String get _description => description;
}