import 'package:fic4_flutter_bloc_auth/bloc/profile/profile_bloc.dart';
import 'package:fic4_flutter_bloc_auth/bloc/register/register_bloc.dart';
import 'package:fic4_flutter_bloc_auth/data/datasources/auth_datasources.dart';
import 'package:fic4_flutter_bloc_auth/presentation/pages/home_page.dart';
import 'package:fic4_flutter_bloc_auth/presentation/pages/login_page.dart';
import 'package:fic4_flutter_bloc_auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(AuthDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: LoginPage.routeName,
        routes: {
          RegisterPage.routeName: (context) => const RegisterPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}

//! NEXT -> logout(remove token)
