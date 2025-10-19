class DioEndpoints {
  static const String baseUrl = "https://codingarabic.online/api";

  static const String login = "/login";
  static const String register = "/register";
  static const String forget_password = "/forget-password";
  static const String otp = "/check-forget-password";

  //Home
  static const String products_bestseller = "/products-bestseller";
  static const String sliders = "/sliders";

  //Wishlist
  static const String wishlist = "/wishlist";
  static const String add_to_wishlist = "/add-to-wishlist";
  static const String remove_from_wishlist = "/remove-from-wishlist";

  //Search
  static const String allProducts = "/products";
  static const String searchProducts = "/products-search";

  //Cart
  static const String showCart = "/cart";
  static const String addToCart = "/add-to-cart";
  static const String updateCart = "/update-cart";
  static const String removeFromCart = "/remove-from-cart";
}
