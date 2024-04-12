import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future apiLoginUser(Map body) async {
  const host = "https://clik-chap-admin.vercel.app/api/mobile/v1";
  const url = "$host/auth/login?route=customer";
  final uri = Uri.parse(url);
  try {
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
      },
    );
    final responseBody = jsonDecode(response.body);
    return {
      'status': responseBody['status'],
      'message': responseBody['message']
    };
  } on SocketException catch (e) {
    // Gestion spécifique de SocketException
    print('Erreur de connexion: $e');
    return {'status': false, 'type': 1, 'message': '$e'};
  } on http.ClientException catch (e) {
    // Gestion spécifique de ClientException
    print('Erreur de client: $e');
    return {'status': false, 'type': 2, 'message': '$e'};
  } catch (e) {
    // Gestion d'autres erreurs non spécifiques
    print('Une erreur s\'est produite: $e');
    return {'status': false, 'type': 3, 'message': '$e'};
  }
}

Future apiSignUpUser(Map body) async {
  const host = "https://clik-chap-admin.vercel.app/api/mobile/v1";
  const url = "$host/auth/register?route=customer";
  final uri = Uri.parse(url);
  try {
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final responseBody = jsonDecode(response.body);
    return {
      'status': responseBody['status'],
      'message': responseBody['message']
    };
  } on SocketException catch (e) {
    // Gestion spécifique de SocketException
    print('Erreur de connexion: $e');
    return {'status': false, 'type': 1, 'message': '$e'};
  } on http.ClientException catch (e) {
    // Gestion spécifique de ClientException
    print('Erreur de client: $e');
    return {'status': false, 'type': 2, 'message': '$e'};
  } catch (e) {
    // Gestion d'autres erreurs non spécifiques
    print('Une erreur s\'est produite: $e');
    return {'status': false, 'type': 3, 'message': '$e'};
  }
}

Future apiSearchMerchants(String token, String value) async {
  const host = "https://clik-chap-admin.vercel.app/api/mobile/v1";
  final url = "$host//client/merchants?search=$value&limit=2&page=1";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : token,
      },
    );
    final responseBody = jsonDecode(response.body);
    return {
      'status': responseBody['status'],
      'message': responseBody['message']
    };
  } on SocketException catch (e) {
    // Gestion spécifique de SocketException
    print('Erreur de connexion: $e');
    return {'status': false, 'type': 1, 'message': '$e'};
  } on http.ClientException catch (e) {
    // Gestion spécifique de ClientException
    print('Erreur de client: $e');
    return {'status': false, 'type': 2, 'message': '$e'};
  } catch (e) {
    // Gestion d'autres erreurs non spécifiques
    print('Une erreur s\'est produite: $e');
    return {'status': false, 'type': 3, 'message': '$e'};
  }
}

Future apiGetAllMerchants(String token) async {
  const host = "https://clik-chap-admin.vercel.app/api/mobile/v1";
  final url = "$host//client/merchants?limit=2&page=1";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : token,
      },
    );
    final responseBody = jsonDecode(response.body);
    return {
      'status': responseBody['status'],
      'message': responseBody['message']
    };
  } on SocketException catch (e) {
    // Gestion spécifique de SocketException
    print('Erreur de connexion: $e');
    return {'status': false, 'type': 1, 'message': '$e'};
  } on http.ClientException catch (e) {
    // Gestion spécifique de ClientException
    print('Erreur de client: $e');
    return {'status': false, 'type': 2, 'message': '$e'};
  } catch (e) {
    // Gestion d'autres erreurs non spécifiques
    print('Une erreur s\'est produite: $e');
    return {'status': false, 'type': 3, 'message': '$e'};
  }
}

Future apiGetMerchant(String token, String id) async {
  const host = "https://clik-chap-admin.vercel.app/api/mobile/v1";
  final url = "$host//client/merchants/$id";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : token,
      },
    );
    final responseBody = jsonDecode(response.body);
    return {
      'status': responseBody['status'],
      'message': responseBody['message']
    };
  } on SocketException catch (e) {
    // Gestion spécifique de SocketException
    print('Erreur de connexion: $e');
    return {'status': false, 'type': 1, 'message': '$e'};
  } on http.ClientException catch (e) {
    // Gestion spécifique de ClientException
    print('Erreur de client: $e');
    return {'status': false, 'type': 2, 'message': '$e'};
  } catch (e) {
    // Gestion d'autres erreurs non spécifiques
    print('Une erreur s\'est produite: $e');
    return {'status': false, 'type': 3, 'message': '$e'};
  }
}