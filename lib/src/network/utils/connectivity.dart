import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Connectivity represents a singleton helper for retrieving connectivity
/// from the internet
class Connectivity {
  static final instance = Connectivity._internal();

  // internal constructor
  Connectivity._internal();

  /// Returns true if connected, false otherwise
  Future<bool> isConnected() async {
    try {
      final response = await http
          .head(Uri.parse('https://pokeapi.co/api/v2/pokemon/1/'))
          .timeout(const Duration(seconds: 3));
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Connectivity check failed: $e');
      return false;
    }
  }
}
