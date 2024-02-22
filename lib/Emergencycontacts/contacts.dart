class ContactManager {
  static List<Map<String, String>> _contacts = [];

  static List<Map<String, String>> get contacts => _contacts;

  static void addContact(Map<String, String> contact) {
    _contacts.add(contact);
  }

  static void removeContact(Map<String, String> contact) {
    _contacts.remove(contact);
  }
}
