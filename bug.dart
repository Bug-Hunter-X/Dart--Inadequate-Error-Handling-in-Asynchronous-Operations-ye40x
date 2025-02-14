```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming JSON response
      final data = jsonDecode(response.body);
      // Process the data
      print(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Here's where the problem often lies:  Missing or inadequate error handling!
    // You might want to rethrow, handle gracefully, or use a more specific exception.
  }
}
```