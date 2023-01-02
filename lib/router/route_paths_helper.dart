class RoutePathsHelper {
  static String root = '/';
  static String auth = '/auth';
  static String donor = '/donor';
  static String receiver = '/receiver';
  static String volunteer = '/volunteer';
  static String marketplace = '/marketplace';
  static String EnlargedCard = '/EnlargedCard';

  static String register = 'register';

  static String verifyPhoneNumber(int phoneNumber) => '/verify/$phoneNumber';
}
