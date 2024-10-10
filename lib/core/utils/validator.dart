class Validator{

  static bool isEmail(String? value){
    if(value==null || value.isEmpty) return false;
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  static bool isPassword(String? value){
    if(value==null || value.isEmpty) return false;
    return value.trim().length>=6;
  }

}