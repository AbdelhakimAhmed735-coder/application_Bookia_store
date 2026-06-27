import 'package:application_clean/core/utils/app_colors.dart';
import 'package:application_clean/core/widgets/custom_text_formfield.dart';
import 'package:application_clean/feature/auth/login/ui/login_views.dart';
import 'package:application_clean/feature/auth/register/presenter/controllers/cubit/register_cubit.dart';
import 'package:application_clean/feature/auth/register/presenter/controllers/cubit/register_state.dart';
import 'package:application_clean/feature/auth/register/presenter/controllers/register_model.dart';
import 'package:application_clean/feature/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => AuthCubit(),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Hello! Register to get started",
                  style: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.h),

                CustomTextFormField(
                  hintText: "Name",
                  controller: _nameController,
                ),
                const SizedBox(height: 15),

                CustomTextFormField(
                  hintText: "Email",
                  controller: _emailController,
                ),
                const SizedBox(height: 15),

                CustomTextFormField(
                  hintText: "Password",
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                CustomTextFormField(
                  hintText: "Confirm Password",
                  controller: _confirmPasswordController,
                  obscureText: true,
                ),

                SizedBox(height: 40.h),

                BlocConsumer<AuthCubit, RegisterState>(
                  listener: (context, state) async {
                    if (state is RegisterSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Register Success"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      await Future.delayed(const Duration(seconds: 1));

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeView()),
                      );
                    }

                    if (state is RegisterErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoadingState) {
                      return const CircularProgressIndicator();
                    }

                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final model = RegisterRequestModel(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              passwordConfirmation: _confirmPasswordController
                                  .text
                                  .trim(),
                            );

                            context.read<AuthCubit>().register(model);
                          }
                        },
                        child: const Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginViews()),
                        );
                      },
                      child: const Text(
                        " Login Now",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
