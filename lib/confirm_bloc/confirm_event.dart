part of 'confirm_bloc.dart';

@immutable
abstract class ConfirmEvent {}

class ConfirmCodeEvent extends ConfirmEvent {
  final String code;
  ConfirmCodeEvent({required this.code});
}
