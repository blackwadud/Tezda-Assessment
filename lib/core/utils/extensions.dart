extension StringExtensions on String {
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(this);
  }

  bool get isValidPassword {
    return length >= 6;
  }
}


