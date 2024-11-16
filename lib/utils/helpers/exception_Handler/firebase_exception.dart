class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return "The email address is invalid.";
      case 'weak-password':
        return "The password is too weak.";
      case 'user-disabled':
        return "This user has been disabled. Please contact support.";
      case 'user-not-found':
        return "No user found with this email address.";
      case 'wrong-password':
        return "The password is incorrect.";
      case 'invalid-verification-id':
        return "The verification ID is invalid.";
      case 'quota-exceeded':
        return "The quota has been exceeded. Please try again later.";
      case 'email-already-exists':
        return "The email address is already in use by another account.";
      case 'provider-already-linked':
        return "This account is already linked with a provider.";
      default:
        return "An unknown error occurred. Please try again.";
    }
  }
}
// user-mismatch
//requires-recent-login
//credential-already-used
