import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'settings_state.mapper.dart';

@MappableClass()
class SettingsState with SettingsStateMappable {
  const SettingsState({required this.themeMode});

  final ThemeMode themeMode;
}
