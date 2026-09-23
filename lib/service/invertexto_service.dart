import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class InvertextoApiService {
  final String _token = "28483|LQy7XQqcDKLSyt1RUsrvszhyc3kMj94N";

  Future<Map<String, dynamic>> convertePorExtenso(
      String? valor) async {
    try {
      final uri = Uri.parse(
        "https://api.invertexto.com/v1/number-to-words"
        "?token=$_token&number=$valor"
        "&language=pt&currency=BRL",
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
          'Erro ${response.statusCode}: ${response.body}',
        );
      }
    } on SocketException {
      throw Exception('Erro de conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> buscaCEP(String? valor) async {
    try {
      final uri = Uri.parse(
        "https://api.invertexto.com/v1/cep/$valor"
        "?token=$_token",
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
          'Erro ${response.statusCode}: ${response.body}',
        );
      }
    } on SocketException {
      throw Exception('Erro de conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }

Future<Map<String, dynamic>> geraPessoa() async {
  try {
    final uri = Uri.https(
      'api.invertexto.com',
      '/v1/faker',
      {
        'token': _token,
        'fields': 'name,cpf',
        'locale': 'pt_BR',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
        'Erro ${response.statusCode}: ${response.body}',
      );
    }
  } on SocketException {
    throw Exception('Erro de conexão com a internet');
  } catch (e) {
    rethrow;
  }
}
  String gerarCodigoBarrasUrl(String valor) {
    return "https://api.invertexto.com/v1/barcode"
        "?token=$_token"
        "&text=$valor"
        "&type=code39";
  }

  Future<Map<String, dynamic>> validaEmail(String? valor) async {
    try {
      final uri = Uri.parse(
        "https://api.invertexto.com/v1/email-validator/$valor"
        "?token=$_token",
      );

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
          'Erro ${response.statusCode}: ${response.body}',
        );
      }
    } on SocketException {
      throw Exception('Erro de conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }
}