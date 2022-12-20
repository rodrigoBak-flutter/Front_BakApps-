import 'package:http/http.dart' as http;


import 'package:app_authnode_bakapp/src/models/usuario.dart';
import 'package:app_authnode_bakapp/src/models/usuarios_response.dart';
import 'package:app_authnode_bakapp/src/services/auth_service.dart';

import 'package:app_authnode_bakapp/src/global/environment.dart';


class UsuariosService {

  Future<List<Usuario>> getUsuarios() async {

    try {
      
      final resp = await http.get(Uri.http('${ Environment.apiUrl }/usuarios'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken().toString()
         // 'x-token': await AuthService.getToken()
        }
      );

      final usuariosResponse = usuariosResponseFromJson( resp.body );

      return usuariosResponse.usuarios;

    } catch (e) {
      return [];
    }

  }


}