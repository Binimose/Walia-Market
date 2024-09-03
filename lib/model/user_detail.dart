class User {
  final String name;
  final String address;

  // Constructor should use parentheses, not curly braces
  User({required this.name, required this.address});

  // Method to convert the User object to a JSON-like Map
  Map<String, dynamic> getJson() => {
        'name': name,
        'address': address, // Corrected 'adress' to 'address'
      };

  // Factory constructor to create a User object from a JSON-like Map
  factory User.getModelFromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      address: json["address"],
    );
  }
}
