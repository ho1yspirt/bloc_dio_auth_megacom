part of 'validation_bloc.dart';

abstract class ValidationEvent extends Equatable {
  const ValidationEvent();

  @override
  List<Object> get props => [];
}

class PhoneChanged extends ValidationEvent {
  const PhoneChanged({required this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class PhoneUnfocused extends ValidationEvent {}

class FormSubmitted extends ValidationEvent {}
