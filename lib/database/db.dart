import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage {
  static const String keyAmount = 'savedAmount';

  static Future<void> saveAmount(double amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double existingAmount = prefs.getDouble(keyAmount) ?? 0.0;
    double newAmount = existingAmount + amount;
    prefs.setDouble(keyAmount, newAmount);
  }

  static Future<double?> getSavedAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(keyAmount);
  }
}