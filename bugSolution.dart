```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException('Failed to load data: ${response.statusCode}', response.body);
    }
  } on HttpException catch (e) {
    print('HTTP Error: ${e.message}  Response Body: ${e.response}');
    // Consider retry logic, alternative data, or user notification
    return null; // or handle the error appropriately
  } on FormatException catch (e) {
    print('JSON Format Error: $e');
    return null; // or handle accordingly
  } catch (e) {
    print('Unexpected Error: $e');
    // Log the error for debugging
    return null; // or handle accordingly
  }
}

// Custom exception for HTTP errors
class HttpException implements Exception {
  final String message;
  final String? response;

  HttpException(this.message, this.response);
}
```