class RegisterModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String password;

  RegisterModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.id,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': fullName,
    'phone': phone,
    'email': email,
    'password':password,
    'createdAt': DateTime.now().toIso8601String(),
  };

  factory RegisterModel.fromMap(Map<String, dynamic> map) => RegisterModel(
    id: map['id'] ?? '',
    fullName: map['name'] ?? '',
    phone: map['phone'] ?? '',
    email: map['email'] ?? '',
    password:  map['password'] ?? '',
  );
}
