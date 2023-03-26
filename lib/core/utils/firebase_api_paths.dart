abstract class FirebaseApiPaths {
  static String products() => 'products/';
  static String users(String uid) => 'users/$uid';
  static String addToCart(String uid, String cartId) =>
      '${users(uid)}/cart/$cartId';
}
