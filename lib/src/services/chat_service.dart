import 'package:app_authnode_bakapp/src/models/mensajes_response.dart';
import 'package:app_authnode_bakapp/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_authnode_bakapp/src/global/environment.dart';
import 'package:app_authnode_bakapp/src/models/usuario.dart';



class ChatService with ChangeNotifier {

late  Usuario usuarioPara;


  Future<List<Mensaje>> getChat( String usuarioID ) async {

    final resp = await http.get(Uri.https('${ Environment.apiUrl }/mensajes/$usuarioID'),
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken().toString()
        //'x-token': await AuthService.getToken()
      }
    );

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;


  }



}

