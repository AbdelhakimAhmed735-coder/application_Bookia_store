import 'package:application_clean/feature/auth/register/presenter/controllers/cubit/register_cubit.dart';
import 'package:application_clean/feature/auth/register/presenter/controllers/cubit/register_state.dart';
import 'package:application_clean/feature/auth/register/presenter/controllers/register_model.dart';
import 'package:application_clean/feature/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        title: const Text("Coding Arabic Register 📝"),
        backgroundColor: Colors.orange[800],
      ),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25),

                BlocConsumer<AuthCubit, RegisterState>(
                  listener: (context, state) async {
                    if (state is RegisterSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.green,
                        ),
                      );
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    }
                    if (state is RegisterErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: const Color.fromARGB(
                            255,
                            238,
                            234,
                            233,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoadingState) {
                      return const CircularProgressIndicator(
                        color: Colors.orange,
                      );
                    }

                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[800],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
