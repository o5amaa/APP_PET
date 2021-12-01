import 'package:validators/validators.dart' as validators;

class AppValidators {
  static const _messageEnterValue = "Enter Value";
  static const _messageCorrectEmail = 'Enter CorrectEmail';
  static const _massageCorrectPass = 'Entre Pass';
  static const _massageCorrectCPass = 'Error Confirm Pass';
  static const _messageCorrectPhoneNumber = 'Enter PhoneNamper';
  static const _messageCorrectTime = 'Enter Time (Hours)';

  static String? isEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isEmail(value!)) {
      return _messageCorrectEmail;
    }
    return null;
  }

  static String? isPass(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isLength(value!, 6)) {
      return _massageCorrectPass;
    }
    return null;
  }

  static String? isEqualPass(String? value, String pass) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.equals(value, pass)) {
      return _massageCorrectCPass;
    }
    return null;
  }

  static String? isEmpty(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    }
    return null;
  }

  static String? isPhoneNumber(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isLength(value!.trim(), 9, 9)) {
      return _messageCorrectPhoneNumber;
    }
    return null;
  }

  static String? isTim(String? value) {
    if (value?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isDate(value!)) {
      return _messageCorrectTime;
    }
    return null;
  }
}
