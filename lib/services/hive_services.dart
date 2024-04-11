import 'package:hive/hive.dart';

void saveUserData(Box localStorage, String token, Map<String, dynamic> userData){
  localStorage.put('token', token);
  localStorage.put('user', userData);
}

Map getUserData(Box localStorage)
{
  if(localStorage.containsKey('token') && localStorage.containsKey('user')){
    return {'token' : localStorage.get('token'), 'user' : localStorage.get('user')};
  }
  return {};
}