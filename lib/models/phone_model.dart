import 'package:formz/formz.dart';

enum PhoneValidationError { invalid }

class PhoneModel extends FormzInput<String, PhoneValidationError> {
  const PhoneModel.pure([super.value = '']) : super.pure();
  const PhoneModel.dirty([super.value = '']) : super.dirty();

  static final _phoneRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  PhoneValidationError? validator(String? value) {
    return _phoneRegex.hasMatch(value ?? '')
        ? null
        : PhoneValidationError.invalid;
  }
}