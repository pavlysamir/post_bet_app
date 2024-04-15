String? conditionOfValidationEmail(value){
  var nonNullValue=value??'';
  if(nonNullValue.isEmpty){
    return ("Email is required");
  }
  if(!nonNullValue.contains("@")){
    return ("Email should contains @");
  }
  return null;
}

String? conditionOfValidationPassWord(value){
  RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  var passNonNullValue=value??"";
  if(passNonNullValue.isEmpty){
    return ("Password is required");
  }
  else if(passNonNullValue.length<8){
    return ("Password Must be more than 7 characters");
  }
  else if(!regex.hasMatch(passNonNullValue)){
    return ("Password should contain upper,lower,digit and Special character ");
  }
  return null;
}

String? conditionOfValidationName(value){
  var nonNullValue=value??'';
  if(nonNullValue.isEmpty){
    return ("username is required");
  }
  return null;
}
String? conditionOfValidationPhone(value){
  var nonNullValue=value??'';
  if(nonNullValue.isEmpty){
    return ("phone is required");
  }
  return null;
}



