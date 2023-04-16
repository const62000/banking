class LoginResponse {
  int userId = 0;
  String firstName;
  String lastName;
  String role;
  int isAccountCreated;
  int noOfDepositRequest;
  int availableBalance;

  LoginResponse({this.userId,
    this.firstName,
    this.lastName,
    this.role,
    this.isAccountCreated,
    this.noOfDepositRequest,
    this.availableBalance});


  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> nameMap = json['user'];
print('Checking  $nameMap');

    return LoginResponse(

      userId: json["id"],
      firstName: nameMap["name"],
      // lastName: json["lastName"],
      role: json["role"],
      isAccountCreated: json["isAccountCreated"],
      noOfDepositRequest: json["noOfDepositRequest"],
      availableBalance: nameMap["availableBalance"],
    );
  }
}