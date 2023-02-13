part of 'validation_bloc.dart';

class ValidationState extends Equatable {
  const ValidationState({
    this.phone = const PhoneModel.pure(),
    this.status = FormzStatus.pure,
  });

  final PhoneModel phone;
  final FormzStatus status;

  ValidationState copyWith({
    PhoneModel? phone,
    FormzStatus? status,
  }) {
    return ValidationState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [phone, status];
}
