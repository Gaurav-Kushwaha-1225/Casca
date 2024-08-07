import 'package:Casca/features/authentication/data/data_sources/user_database.dart';
import 'package:Casca/features/authentication/data/repository/user_repository_impl.dart';
import 'package:Casca/features/authentication/domain/usecases/login_user.dart';
import 'package:Casca/features/authentication/domain/usecases/signup_user.dart';
import 'package:Casca/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:Casca/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CascaUsersDB.db();
  runApp(const Casca());
}

class Casca extends StatelessWidget {
  const Casca({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoginUser>(
            create: (_) => LoginUser(UserRepositoryImpl(CascaUsersDB()))),
        RepositoryProvider<SignupUser>(
            create: (_) => SignupUser(UserRepositoryImpl(CascaUsersDB()))),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(
                  loginUser: LoginUser(UserRepositoryImpl(CascaUsersDB())),
                  signupUser: SignupUser(UserRepositoryImpl(CascaUsersDB()))))
        ],
        child: MaterialApp.router(
          title: 'Casca',
          themeMode: ThemeMode.system,
          theme: CascaTheme.lightTheme,
          darkTheme: CascaTheme.darkTheme,
          routerConfig: CascaRouter().router,
        ),
      ),
    );
  }
}
