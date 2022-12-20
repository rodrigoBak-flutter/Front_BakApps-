import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_authnode_bakapp/src/services/socket_service.dart';
import 'package:app_authnode_bakapp/src/services/auth_service.dart';

import 'package:app_authnode_bakapp/src/pages/login_page.dart';
import 'package:app_authnode_bakapp/src/pages/usuarios_page.dart';



class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: ( context, snapshot) {
          return Center(
                child: Text('Espere...'),
          );
        },
        
      ),
   );
  }

  Future checkLoginState( BuildContext context ) async {

    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>( context, listen: false );

    final autenticado = await authService.isLoggedIn();

    if ( autenticado ) {
      socketService.connect();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: ( _, __, ___ ) => UsuariosPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: ( _, __, ___ ) => LoginPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    }

  }

}