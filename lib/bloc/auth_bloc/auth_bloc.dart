// ignore_for_file: depend_on_referenced_packages, unused_import
import 'package:bloc/bloc.dart';
import 'package:bloc_final/dio/dio_settings.dart';
import 'package:bloc_final/models/auth_model.dart';
import 'package:bloc_final/repositories/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.repo,
  }) : super(AuthInitial()) {
    on<SendPhoneEvent>(
      (event, emit) async {
        final model = await repo.sendPhone(phoneNumber: event.phoneNumber);
        if (model.status == 1) {
          emit(AuthSuccess(model: model));
        } else {
          emit(AuthError());
        }
        // try {
        //   final model = await repo.sendPhone(phoneNumber: event.phoneNumber);
        //   emit(AuthSuccess(model: model));
        // } catch (e) {
        //   emit(AuthError());
        // }
      },
    );
  }
  final AuthRepo repo;
}
