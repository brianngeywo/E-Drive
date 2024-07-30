import 'package:flutter/material.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async => ThemeMode.dark;

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}

class MyTheme {
  static final lightTheme = ThemeData(
      primaryColor: const Color(0xFFFFFFFF), // Primary color in light mode
      secondaryHeaderColor:
          const Color(0xFFE9EAF4), // Secondary color in light mode
      // backgroundColor: Color(0xFFFFFFFF), // Background color in light mode
      brightness: Brightness.light, // Light mode
      extensions: <ThemeExtension<dynamic>>[
        CustomThemeExtension(
          usedGradient: const LinearGradient(
            begin: Alignment(-0.684, 0.147),
            end: Alignment(0.701, 0.147),
            colors: <Color>[
              Color(0xFFE9EAF4),
              Color(0xFFFFFFFF),
            ],
            stops: <double>[
              0.0,
              1.0,
            ],
          ),
          // darkGradient: const LinearGradient(
          //   begin: Alignment(-0.684, 0.147),
          //   end: Alignment(0.701, 0.147),
          //   colors: <Color>[
          //     Color(0xFF3D3E42),
          //     Color(0xFF38393E),
          //     Color(0xFF33363B),
          //     Color(0xFF2D2F32),
          //     Color(0xFF28292B),
          //     Color(0xFF242526),
          //     Color(0xFF1E1F20),
          //     Color(0xFF1A1A1B),
          //     Color(0xFF171717),
          //     Color(0xFF121212),
          //     Colors.black,
          //   ],
          //   stops: <double>[
          //     0.0,
          //     0.1,
          //     0.2,
          //     0.3,
          //     0.4,
          //     0.5,
          //     0.7,
          //     0.8,
          //     0.85,
          //     0.95,
          //     1.0,
          //   ],
          // ),
        ),
      ]);

  static final darkTheme = ThemeData(
      primaryColor: const Color(0xFF090A0A), // Primary color in dark mode
      secondaryHeaderColor:
          const Color(0xFF202325), // Secondary color in dark mode
      // backgroundColor: Color(0xFF000000), // Background color in dark mode (or another dark color)
      brightness: Brightness.dark, // Dark mode
      // Define dark mode gradient
      extensions: <ThemeExtension<dynamic>>[
        CustomThemeExtension(
          usedGradient: const LinearGradient(
            begin: Alignment(-0.684, 0.147),
            end: Alignment(0.701, 0.147),
            colors: <Color>[Color(0xFF1D1E22), Color(0x00141414)],
            stops: <double>[
              0.0,
              1.0,
            ],
          ),
          // darkGradient: const LinearGradient(
          //   begin: Alignment(-0.684, 0.147),
          //   end: Alignment(0.701, 0.147),
          //   colors: <Color>[
          //     Color(0xFF3D3E42),
          //     Color(0xFF38393E),
          //     Color(0xFF33363B),
          //     Color(0xFF2D2F32),
          //     Color(0xFF28292B),
          //     Color(0xFF242526),
          //     Color(0xFF1E1F20),
          //     Color(0xFF1A1A1B),
          //     Color(0xFF171717),
          //     Color(0xFF121212),
          //     Colors.black,
          //   ],
          //   stops: <double>[
          //     0.0,
          //     0.1,
          //     0.2,
          //     0.3,
          //     0.4,
          //     0.5,
          //     0.7,
          //     0.8,
          //     0.85,
          //     0.95,
          //     1.0,
          //   ],
          // ),
        ),
      ]);
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final LinearGradient usedGradient;
  // final LinearGradient darkGradient;

  CustomThemeExtension({
    required this.usedGradient,
    // required this.darkGradient,
  });

  @override
  CustomThemeExtension copyWith({
    LinearGradient? usedGradient,
    LinearGradient? darkGradient,
  }) {
    return CustomThemeExtension(
      usedGradient: usedGradient ?? this.usedGradient,
      // darkGradient: darkGradient ?? this.darkGradient,
    );
  }

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    return CustomThemeExtension(
      usedGradient: LinearGradient.lerp(usedGradient, other.usedGradient, t)!,
      // darkGradient: LinearGradient.lerp(darkGradient, other.darkGradient, t)!,
    );
  }
}
