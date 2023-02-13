// ignore_for_file: depend_on_referenced_packages, unused_import
import 'package:bloc/bloc.dart';
import 'package:bloc_final/models/send_code_model.dart';
import 'package:bloc_final/repositories/confirm_code_repo.dart';
import 'package:meta/meta.dart';

part 'confirm_event.dart';
part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  ConfirmBloc({
    required this.repo,
  }) : super(ConfirmInitial()) {
    on<ConfirmCodeEvent>((event, emit) async {
      final model = await repo.sendCode(code: event.code);
      try {
        emit(ConfirmSuccess(model: model));
      } catch (e) {
        emit(ConfirmError());
      }
    });
  }
  final ConfirmCodeRepo repo;
}
