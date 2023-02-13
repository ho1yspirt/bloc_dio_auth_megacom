part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SendPhoneEvent extends AuthEvent {
  final String phoneNumber;
  SendPhoneEvent({required this.phoneNumber});
}
