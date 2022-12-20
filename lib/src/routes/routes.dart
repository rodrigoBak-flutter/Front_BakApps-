import 'package:app_authnode_bakapp/src/pages/status_pages.dart';
import 'package:flutter/material.dart';

import 'package:app_authnode_bakapp/src/pages/chat_page.dart';
import 'package:app_authnode_bakapp/src/pages/loading_page.dart';
import 'package:app_authnode_bakapp/src/pages/login_page.dart';
import 'package:app_authnode_bakapp/src/pages/register_page.dart';
import 'package:app_authnode_bakapp/src/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'status': ( _ ) => StatusPage(),
  'usuarios': ( _ ) => UsuariosPage(),
  'chat'    : ( _ ) => ChatPage(),
  'login'   : ( _ ) => LoginPage(),
  'register': ( _ ) => RegisterPage(),
  'loading' : ( _ ) => LoadingPage(),

};


