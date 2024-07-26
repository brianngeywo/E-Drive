import 'package:e_driver_theme_mode_settings/settings/settings_controller.dart';
import 'package:e_driver_theme_mode_settings/settings/settings_service.dart';
import 'package:flutter_app/constants.dart';

void setupGetIt() {
  setupThemeSettings();
}

void setupThemeSettings() {
  getIt.registerSingleton<SettingsController>(
      SettingsController(SettingsService()));
}
