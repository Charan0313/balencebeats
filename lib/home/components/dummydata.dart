import 'dart:convert';
import 'dart:math';

String jsonData = '[{"id": 1, "name": "Item 1"},{"id": 2, "name": "Item 2"},{"id": 3, "name": "Item 3"}]';

List<Map<String, dynamic>> data = json.decode(jsonData).cast<Map<String, dynamic>>();

// Function to get a random item
Map<String, dynamic> getRandomItem() {
  final random = Random();
  return data[random.nextInt(data.length)];
}

void main() {
  print(getRandomItem());
}
