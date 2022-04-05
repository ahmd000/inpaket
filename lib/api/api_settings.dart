class ApiSettings {

  static const String _baseUrl = "https://inpaket.com/test2/wp-json/wc/v2/" ;
  static const String _consumerKey= "ck_4f71f1870361aedd0f52051035854523e7cef4d5" ;
  static const String _consumerSecret = "cs_a2560388e81d300960f4274fce56b2f8a6bc0e8b" ;



  static const  products = _baseUrl+"products?$_consumerKey&$_consumerSecret" ;







  static const _apiBaseUrl = _baseUrl + "api/";
  static const city = 'https://smart-store.mr-dev.tech/api/cities';
  static const String storeApiKey = '458310ba-02b2-45b5-8eaf-87df40bdafa3';

  static const login = _apiBaseUrl + 'auth/login';
  static const registerApi = _apiBaseUrl + 'auth/register';
  static const activatePhone = _apiBaseUrl + 'auth/activate';
  static const logout = _apiBaseUrl + 'auth/logout';
  static const forgetPassword = _apiBaseUrl + 'auth/forget-password';
  static const resetPassword = _apiBaseUrl + 'auth/reset-password';

  static const home = _apiBaseUrl + 'home';
  static const categories = _apiBaseUrl + 'categories/';
  static const sub_categories = _apiBaseUrl + 'sub-categories/';
  static const offers = _apiBaseUrl + 'offers';
  static const favorite = _apiBaseUrl + 'favorite-products';
  static const update_profile = _apiBaseUrl + "auth/update-profile";


}
