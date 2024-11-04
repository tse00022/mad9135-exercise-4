import 'package:mad9135_exercise_4/mad9135_exercise_4.dart'
    as mad9135_exercise_4;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final url = Uri.parse('https://random-data-api.com/api/v2/users?size=10');
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decode the response to a List of Map objects
      final List<dynamic> users = jsonDecode(response.body);

      // Loop through and print each user's details
      for (var user in users) {
        final uid = user['id'] ?? 'N/A';
        final firstName = user['first_name'] ?? 'N/A';
        final lastName = user['last_name'] ?? 'N/A';
        print('User: ID $uid, Name: $firstName $lastName');
      }
    } else {
      print('Failed to load user data');
    }
  } catch (e) {
    print('Error: $e');
  }
}
