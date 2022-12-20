import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_authnode_bakapp/src/services/auth_service.dart';
import 'package:app_authnode_bakapp/src/services/chat_service.dart';
import 'package:app_authnode_bakapp/src/services/socket_service.dart';

import 'package:app_authnode_bakapp/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(create: (_) => ChatService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Conexion Backend Node - Frontend Flutter',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}
