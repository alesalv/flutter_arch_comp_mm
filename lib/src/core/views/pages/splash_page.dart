import 'package:flutter/material.dart';
import 'package:flutter_arch_comp/src/core/views/pages/home_page.dart';

import '../../../settings/notifiers/settings_notifier.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((final _) => _afterSplash(context));
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('Flutter Architecture Components'),
      ),
    );
  }

  Future<void> _afterSplash(BuildContext context) async {
    // initialize the settings controller
    await settingsNotifierManager.notifier.loadSettings();
    if (!context.mounted) {
      return;
    }
    Navigator.restorablePushNamed(context, HomePage.routeName);
  }
}
