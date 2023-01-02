class RoutePathsHelper {
  static String root = '/';
  static String auth = '/auth';
  static String donor = '/donor';
  static String receiver = '/receiver';
  static String volunteer = '/volunteer';

  static String register(int phoneNumber) => 'register/$phoneNumber';

  static String verifyPhoneNumber(int phoneNumber) => '/verify/$phoneNumber';
}
