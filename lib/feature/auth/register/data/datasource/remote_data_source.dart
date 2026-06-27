import 'package:application_clean/feature/auth/register/presenter/controllers/register_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://api.codingarabic.online/api/'),
  );

  Future<void> register(RegisterRequestModel request) async {
    try {
      FormData formData = FormData.fromMap(request.toMap());

      final response = await _dio.post(
        'auth/register',
        data: formData,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("🎉 Register Success: ${response.data}");
      }
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  void _handleDioError(DioException e) {
    if (e.response != null) {
      print("Server Error: ${e.response?.data}");
      throw Exception(
        e.response?.data['message'] ?? 'حدث خطأ ما، تأكد من البيانات!',
      );
    } else {
      throw Exception('مشكلة في الشبكة، تأكد من اتصالك بالإنترنت يا بطل.');
    }
  }
}
