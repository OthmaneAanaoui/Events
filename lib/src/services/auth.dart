import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/src/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on User
  Users? _userFromFirebaseUser(User? user) {
    return user !=null ? Users(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Users?> get user {
    return _auth.authStateChanges()
    .map((User? user) => _userFromFirebaseUser(user));
  }

  // sign in anon
Future signInAnon() async {
  try {
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return _userFromFirebaseUser(user);
  } catch(e) {
    print(e.toString());
    return null;
  }
}

  // sign in with email & password

  // register with email & password

  // sign out
Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
}

}