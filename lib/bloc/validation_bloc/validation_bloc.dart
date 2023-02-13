// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:bloc/bloc.dart';
import 'package:bloc_final/models/phone_model.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(const ValidationState()) {
    on<PhoneChanged>(_onPhoneChanged);
    on<PhoneUnfocused>(_onPhoneUnfocused);
    on<FormSubmitted>(_onFormSubmitted);
  }
  void _onPhoneChanged(PhoneChanged event, Emitter<ValidationState> emit) {
    final phone = PhoneModel.dirty(event.phone);
    emit(
      state.copyWith(
        phone: phone.valid ? phone : PhoneModel.pure(event.phone),
        status: Formz.validate([
          phone,
        ]),
      ),
    );
  }

  void _onPhoneUnfocused(PhoneUnfocused event, Emitter<ValidationState> emit) {
    final phone = PhoneModel.dirty(state.phone.value);
    emit(
      state.copyWith(
        phone: phone,
        status: Formz.validate([phone]),
      ),
    );
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<ValidationState> emit,
  ) async {
    final phone = PhoneModel.dirty(state.phone.value);
    emit(
      state.copyWith(
        phone: phone,
        status: Formz.validate([phone]),
      ),
    );
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
