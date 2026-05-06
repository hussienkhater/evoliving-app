
// Endpoints & Base URL
class Endpoints {
  static const String baseUrl = 'graduation-project-sepia-eta.vercel.app';
  static const String baseUrl2 = 'mqtt-project-production.up.railway.app';

  /// Auth System Endpoints
  static const String signUp = '/api/user/register';
  static const String logout = 'logout';
  static const String login = '/api/user/login';
  static const String verifyAccount = 'verify-account';
  static const String forgotPassword = 'forgot-password';
  static const String resetPassword = 'reset-password';

  /// Device Control Endpoints
  static const String controlDevice = '/api/device/control';
  static const String getDeviceStatus = '/api/device/status';
}