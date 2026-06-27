import 'package:flutter/material.dart';

@immutable
abstract class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final String message;

  RegisterSuccessState(String s, {required this.message});
}

final class RegisterErrorState extends RegisterState {
  final String errorMessage;

  RegisterErrorState(String replaceAll, {required this.errorMessage});
}
