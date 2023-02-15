/// *** functions *** ///
/// email validator ///
bool emailValidator(String str) {
  final regex = RegExp(r'^[a-zA-Z0-9_\-.]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$');
  return regex.hasMatch(str.trim()); //_emailController.text
}

/// password validator ///
bool passwordValidator(String str) {
  final regex = RegExp(r'[!@#\$&*~0-9a-zA-Z]{7,}');
  return regex.hasMatch(str); //_passwordController.text
}

/// phone validator ///
bool phoneValidator(String str) {
  final regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,13}$)');
  return regex.hasMatch(str); //_phoneController.text
}

bool nameValidator(String str) {
  final regex = RegExp(r'^[a-zA-Z ]*$');
  if (regex.hasMatch(str) && str.trim().isNotEmpty) {
    return true;
  }
  return false;
}
