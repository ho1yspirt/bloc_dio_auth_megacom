import 'package:bloc_final/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_final/ui/colors/app_colors.dart';
import 'package:bloc_final/ui/fonts/app_fonts.dart';
import 'package:bloc_final/ui/screens/auth_screen.dart';
import 'package:bloc_final/ui/widgets/custom_button.dart';
import 'package:bloc_final/ui/widgets/custom_textfield.dart';
import 'package:bloc_final/ui/widgets/gradient_background.dart';
import 'package:bloc_final/ui/widgets/gradient_circle.dart';
import 'package:bloc_final/ui/widgets/gradient_foreground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          const GradientBackground(),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            child: const GradientCircle(size: 215),
          ),
          Positioned(
            right: 0,
            bottom: MediaQuery.of(context).size.height / 10,
            child: const GradientCircle(size: 287),
          ),
          Center(
            child: GradientForeground(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: AppFonts.w600s25.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.model.object ?? ''),
                          ),
                        );
                      }
                    },
                    child: CustomTextField(
                      title: 'Phone',
                      controller: controller,
                    ),
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.model.message ?? ''),
                          ),
                        );
                      }
                    },
                    child: CustomButton(
                      title: 'Sign In',
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          SendPhoneEvent(
                            phoneNumber: controller.text,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  RichText(
                    textScaleFactor: 1,
                    text: TextSpan(
                      text: 'Are you a new user? ',
                      style: AppFonts.w600s15,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: AppFonts.w600s15.copyWith(
                            color: AppColors.secondary,
                          ),
                          onEnter: (event) {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
