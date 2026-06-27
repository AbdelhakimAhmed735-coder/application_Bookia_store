import 'package:application_clean/feature/auth/register/data/datasource/remote_data_source.dart';
import 'package:application_clean/feature/auth/register/presenter/controllers/cubit/register_state.dart';
import 'package:application_clean/feature/auth/register/presenter/controllers/register_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<RegisterState> {
  final AuthRemoteDataSource _dataSource = AuthRemoteDataSource();

  AuthCubit() : super(RegisterInitialState());

  // دالة الـ Register
  void register(RegisterRequestModel model) async {
    emit(RegisterLoadingState());
    try {
      await _dataSource.register(model);
      emit(
        RegisterSuccessState("Account created successfully! 🎉", message: ''),
      );
    } catch (e) {
      emit(
        RegisterErrorState(
          e.toString().replaceAll('Exception:', ''),
          errorMessage: '',
        ),
      );
    }
  }
}
