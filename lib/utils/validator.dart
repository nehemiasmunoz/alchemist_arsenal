class Validator {
  static String? validateIsNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName cannot be empty.';
    }
    return null;
  }

  static String? validateIsNumber(String? value, String fieldName) {
    // First, check if the value is empty
    final notEmptyError = validateIsNotEmpty(value, fieldName);
    if (notEmptyError != null) {
      return notEmptyError;
    }

    // Validate if it's a number using a regex
    final numberRegExp = RegExp(r'^-?\d+(\.\d+)?$');
    if (!numberRegExp.hasMatch(value!)) {
      return '$fieldName must be a valid number.';
    }
    return null;
  }
}
