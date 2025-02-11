import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:minimal_mvn/minimal_mvn.dart';

part 'settings_state.mapper.dart';

@MappableClass()
class SettingsState extends MMState with SettingsStateMappable {
  const SettingsState({required this.themeMode});

  final ThemeMode themeMode;
}
