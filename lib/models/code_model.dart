import 'package:formz/formz.dart';

enum CodeValidationError { invalid }

class CodeModel extends FormzInput<String, CodeValidationError> {
  const CodeModel.pure([super.value = '']) : super.pure();
  const CodeModel.dirty([super.value = '']) : super.dirty();

  static final _codeRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  CodeValidationError? validator(String? value) {
    return _codeRegex.hasMatch(value ?? '')
        ? null
        : CodeValidationError.invalid;
  }
}
