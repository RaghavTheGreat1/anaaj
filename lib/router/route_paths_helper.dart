class RoutePathsHelper {
  static String root = '/';
  static String auth = '/auth';
  static String donor = '/donor';
  static String receiver = '/receiver';
  static String volunteer = '/volunteer';
  static String marketplace = '/marketplace';
  static String EnlargedCard = '/EnlargedCard';
  static String VolunteerDashboard = '/VolunteerDashboard';
  static String History = '/History';
  static String CurrentOrder = '/CurrentOrder';

  static String register(int phoneNumber) => 'register/$phoneNumber';

  static String verifyPhoneNumber(int phoneNumber) => '/verify/$phoneNumber';
}
