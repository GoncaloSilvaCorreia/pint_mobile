// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pint/models/utilizador.dart';

class ApiService {
  static const String _baseUrl = 'https://pint-13nr.onrender.com/api';

  String? _token;

  Future<Utilizador?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password
        }),
      );

      print('Resposta do login: ${response.body}'); 

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token']; // Armazena o token
        return Utilizador.fromJson(data['user']);
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? 'Credenciais inválidas');
      }
    } catch (e) {
      print('Erro no login: $e');
      throw Exception('Falha na conexão. Tente novamente.');
    }
  }

  // Método para usar em outras requisições
  Future<Map<String, String>> _getAuthHeaders() async {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_token',
    };
  }
}