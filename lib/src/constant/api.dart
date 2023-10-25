class Api {
  Api._internal();
  static final Api _instance = Api._internal();
  factory Api() => _instance;

  static const String urlTest = 'https://fakestoreapi.com/products';
}
