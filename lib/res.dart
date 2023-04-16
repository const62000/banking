import 'package:flutter/material.dart';

// For Assets, Colors, Fonts Etc..
class Res {
  // UI Resources
  static const String logo = "assets/images/logo.png";
  static const Color accentColor = Colors.blue;
  static const Color primaryColor = Colors.blue;
  static const gradient = LinearGradient(colors: [accentColor, primaryColor]);
  static const Color white54 = Color(0x8AFFFFFF);

  //API Constants
  static const String baseURL = 'http://192.168.63.243:8000/api/';
  static const String loginAPI = baseURL + 'auth/login';
  static const String registerAPI = baseURL + 'auth/register';
  static const String createAccount = baseURL + 'createAccount';
  static const String accountType = baseURL + 'accountTypeList';
  static const String createDepositAPI = baseURL + 'createDepositRequest';
  static const String accountListAPI = baseURL + 'accountList?userId=';
  static const String depositAmountListAPI =
      baseURL + 'depositAmountRequestList';
  static const String depositAmountAPI = baseURL + 'depositAmount';

  static const String accountForAPI = baseURL + 'accountForList';
  static const String accountModeAPI = baseURL + 'accountModeList';
  static const String addBenefciaryAPI = baseURL + 'addBeneficiary';
  static const String requestKycAPI = baseURL + 'kycRequestList?agentId=';
  static const String updateKycAPI = baseURL + 'updateKyc';

  // Database Fields
  static const String aHiveDB = 'alokDB';
  static const String loggedInStatus = 'loginStatus';
  static const String aUserData = 'userData';
  static const String aUserId = 'userId';
}
