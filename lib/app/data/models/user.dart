class User {
  final int? idUser;
  final String? name;
  final String? cpf;
  final String? email;
  final String? phone;
  final String? token;

  const User({
    this.idUser,
    this.name,
    this.cpf,
    this.email,
    this.phone,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json)
      : idUser = json['idUser'],
        name = json['name'],
        cpf = json['cpf'],
        email = json['email'],
        phone = json['phone'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'cpf': cpf,
        'email': email,
        'phone': phone,
        'token': token,
      };
}
