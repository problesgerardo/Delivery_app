

class SignUpUseCaseParameter{

  SignUpUseCaseParameter({
    required this.userName,
    required this.email,
    required this.password,
    this.phone,
    this.date
  });
  
  final String userName;
  final String email;
  final String password;
  final String? phone;
  final String? date;

}