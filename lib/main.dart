import 'package:bloc_final/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_final/bloc/confirm_bloc/confirm_bloc.dart';
import 'package:bloc_final/bloc/validation_bloc/validation_bloc.dart';
import 'package:bloc_final/dio/dio_settings.dart';
import 'package:bloc_final/repositories/auth_repo.dart';
import 'package:bloc_final/repositories/confirm_code_repo.dart';
import 'package:bloc_final/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => DioSettings(),
          ),
          RepositoryProvider(
            create: (context) =>
                AuthRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
          ),
          RepositoryProvider(
            create: (context) => ConfirmCodeRepo(
                dio: RepositoryProvider.of<DioSettings>(context).dio),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                repo: RepositoryProvider.of<AuthRepo>(context),
              ),
            ),
            BlocProvider(
              create: (context) => ConfirmBloc(
                repo: RepositoryProvider.of<ConfirmCodeRepo>(context),
              ),
            ),
            BlocProvider(
              create: (context) => ValidationBloc(),
            ),
          ],
          child: const MaterialApp(
            title: 'Block + Dio Auth',
            home: SigninScreen(),
          ),
        ));
  }
}
