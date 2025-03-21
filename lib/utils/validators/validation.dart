
class TValidator{

  static String? validateEmptyText(String? fieldName, String? value){
    if(value==null || value.isEmpty){
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String? value){
if(value==null || value.isEmpty){
//check error using text widget
  return 'Email is required';
}

//Regular expression for email vallidation

  final emailRegExp=RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

if(!emailRegExp.hasMatch(value)){
  return 'Invalid email address';

}
return null;
  }

  static String? validatePassword(String? value){
    if(value==null || value.isEmpty){
//check error using text widget
      return 'Password is required';
    }
    // check for minimum password length
    if(value.length<6){
      return 'Password must be siz characters';
    }
    // check for uppercase letters

    if(!value.contains(RegExp(r'[A-Z]'))){
      return 'password must contain atleast one uppercase letter';

    }
    if(!value.contains(RegExp(r'[0-9]'))){
      return 'password must contain atleast one uppercase number';

    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'password must contain at least one special character';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value){
    if(value==null || value.isEmpty){
//check error using text widget
      return 'Phone is required';
    }

    //assuming a 10 digit us phone number format
    final phoneRegExp= RegExp(r'^\d{10}$');


    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number';
    }

    return null;
  }






}