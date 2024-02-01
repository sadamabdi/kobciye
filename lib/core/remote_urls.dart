class RemoteUrls {
  static const String rootUrl = "http://159.223.81.156:3000";

  static const countries = '$rootUrl/countries/allcountries';

  static const sendOtp = '$rootUrl/verification/sendotp';
  static const verifyOtp = '$rootUrl/verification/check-verification-code';
  //'${rootUrl}category-subcategory/$categoryId';
}
