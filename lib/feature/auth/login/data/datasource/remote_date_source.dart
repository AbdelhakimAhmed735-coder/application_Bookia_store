import 'package:application_clean/feature/auth/login/presenter/controllers/login_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.codingarabic.online/api/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
  Future<void> login(LoginRequestModel request) async {
    try {
      FormData formData = FormData.fromMap(request.toMap());

      final response = await _dio.post(
        'auth/login',
        data: formData,
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        print("🎉 Login Success: ${response.data}");
      }
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // دالة موحدة لمعالجة أخطاء ديو الاحترافية
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
