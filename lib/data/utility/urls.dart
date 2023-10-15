class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static const String completeProfile = '$_baseUrl/CreateProfile';
  static const String productSlider = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';
  static String productListByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';
  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String productDetailsById(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
  static const String addToCart = '$_baseUrl/CreateCartList';
  static const String getCartList = '$_baseUrl/CartList';
  static String deleteCart(int productId) =>
      '$_baseUrl/DeleteCartList/$productId';
  static const String readProfile = '$_baseUrl/ReadProfile';
  static const String createProfile = '$_baseUrl/CreateProfile';
  static String productReviewById(int productId) =>
      '$_baseUrl/ListReviewByProduct/$productId';
  static String get createReview => '$_baseUrl/CreateProductReview';
  static String createWishList(int productId) =>
      '$_baseUrl/CreateWishList/$productId';
  static String get getWishList => '$_baseUrl/ProductWishList';
  static String addWishList(int productId) =>
      '$_baseUrl/CreateWishList/$productId';
}
