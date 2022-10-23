class Validators {
  static final RegExp _userNameRegExp = RegExp(r'^[a-zA-Z0-9 ]{3,20}$');
  static final RegExp _phoneNumberRegExp = RegExp(r'^[0-9]{9,15}$');

  static isValidPhone(String phone) {
    return _phoneNumberRegExp.hasMatch(phone);
  }

  static isValidUserName(String username) {
    return _userNameRegExp.hasMatch(username);
  }
}
