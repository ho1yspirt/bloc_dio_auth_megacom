part of 'confirm_bloc.dart';

@immutable
abstract class ConfirmState {}

class ConfirmInitial extends ConfirmState {}

class ConfirmSuccess extends ConfirmState {
  final SendCodeModel model;
  ConfirmSuccess({
    required this.model,
  });
}

class ConfirmError extends ConfirmState {}

class ConfirmLoading extends ConfirmState {}
