import 'package:firebase_auth/firebase_auth.dart';
import 'package:show_reminder_app/models/user.dart';


class AuthenticationService{

  final FirebaseAuth _authService= FirebaseAuth.instance;

  //create custom user from firebase user
  User _convertToCustomUser(FirebaseUser user){
    return user !=null ? User(uid:user.uid) : null;
  }

  //auth change user stream mapped to a custom user. every time user sign in sign out we get respone down the stream
  Stream<User> get user{
    return _authService.onAuthStateChanged
      .map((FirebaseUser user)=> _convertToCustomUser(user));
  }


  //Register with email/Password
  Future signUp(String email,String pass) async{ 
    try{
      AuthResult result= await _authService.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user= result.user;
      return _convertToCustomUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //Sign-in with email/Password
  Future signIn(String email,String pass) async{ 
    try{
      AuthResult result= await _authService.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user= result.user;
      return _convertToCustomUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  
  //sign-out service
  Future signOut() async{ 
    try{
      return await _authService.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}