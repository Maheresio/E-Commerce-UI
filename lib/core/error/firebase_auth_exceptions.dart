import 'package:firebase_auth/firebase_auth.dart';

String handleAuthException(FirebaseException error) {
  switch (error.code) {
    case "invalid-email":
      return "Your email address is not valid";
    case "wrong-password":
      return "Your password is wrong.";
    case "user-not-found":
      return "User with this email doesn't exist.";
    case "user-disabled":
      return "User with this email has been disabled.";
    case "email-already-in-use":
      return "already exists an account with the given email address.";
    case "operation-not-allowed":
      return "email/password accounts are not enabled.";
    case "weak-password":
      return " the password is not strong enough.";
    default:
      return "An undefined Error happened.";
  }
}
