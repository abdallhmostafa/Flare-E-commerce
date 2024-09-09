String? passwordValidation(String? value) {
  if (value!.isEmpty) {
    return 'Password is required';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? emailValidation(String? value) {
  if (value!.isEmpty) {
    return 'Email address is required';
  } else if (!value.contains('@')) {
    return 'Invalid email address';
  } else if (!value.contains('.com')) {
    return 'Invalid email address';
  }

  return null;
}
