class RemoteUrls {
  static const String rootUrl = 'http://0.0.0.0:3000'; //"http://159.223.81.156:3000";

  static const countries = '$rootUrl/countries/allcountries';

  static const sendOtp = '$rootUrl/verification/sendotp';
  static const verifyOtp = '$rootUrl/verification/check-verification-code';
  //'${rootUrl}category-subcategory/$categoryId';
}
