class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String completeProfile = '$_baseUrl/CreateProfile';
  static String productSlider = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String productListByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';
  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String productDetailsById(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
  static String addToCart = '$_baseUrl/CreateCartList';
  static String getCartList = '$_baseUrl/CartList';
  static String deleteCart(int productId) =>
      '$_baseUrl/DeleteCartList/$productId';
}
