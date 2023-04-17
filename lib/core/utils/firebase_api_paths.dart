abstract class FirebaseApiPaths {
  static String productsPath() => 'products/';
  static String usersPaht(String uid) => 'users/$uid';
  static String addToCartPath(String uid, String cartId) =>
      '${usersPaht(uid)}/cart/$cartId';
}
