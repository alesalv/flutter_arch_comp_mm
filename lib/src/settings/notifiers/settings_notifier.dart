import 'package:flutter/material.dart';
import 'package:flutter_arch_comp/src/settings/notifiers/settings_state.dart';
import 'package:minimal/minimal.dart';

import '../services/settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Notifiers glue Data Services to Flutter Widgets. The SettingsNotifier
/// uses the SettingsService to store and retrieve user settings.
class SettingsNotifier extends MMNotifier<SettingsState> {
  SettingsNotifier(this._settingsService)
      : super(const SettingsState(themeMode: ThemeMode.system));

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    final theme = await _settingsService.themeMode();
    notify(state.copyWith(themeMode: theme));
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Dot not perform any work if new and old ThemeMode are identical
    if (newThemeMode == state.themeMode) return;

    // Otherwise, store the new theme mode in memory
    notify(state.copyWith(themeMode: newThemeMode));

    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
  }
}

/// settingsNotifierManager provides the settings controller
final settingsNotifierManager = MMManager<SettingsNotifier>(
  () {
    final settingsService = settingsServiceManager.instance;
    return SettingsNotifier(settingsService);
  },
);
