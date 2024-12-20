import 'package:Casca/features/authentication/data/data_sources/user_database.dart';
import 'package:Casca/features/authentication/data/repository/user_repository_impl.dart';
import 'package:Casca/features/authentication/domain/usecases/login_user.dart';
import 'package:Casca/features/authentication/domain/usecases/signup_user.dart';
import 'package:Casca/features/authentication/domain/usecases/update_user.dart';
import 'package:Casca/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:Casca/features/authentication/presentation/pages/authentication_signup_page.dart';
import 'package:Casca/features/dashboard/data/data_sources/barber_database.dart';
import 'package:Casca/features/dashboard/data/repository/barber_repository_impl.dart';
import 'package:Casca/features/dashboard/domain/usecases/get_data.dart';
import 'package:Casca/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import 'config/routes/routes.dart';
import 'features/dashboard/presentation/bloc/explore/explore_bloc.dart';
import 'features/dashboard/presentation/bloc/home/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CascaUsersDB.connect();
  await CascaBarberDB.connect();
  final storage = FlutterSecureStorage();
  final GoRouter router = CascaRouter().router;
  runApp(BlocProvider<ThemeBloc>(
    create: (context) => ThemeBloc(storage: storage)..loadSavedTheme(),
    child: Casca(router: router),
  ));
}

class Casca extends StatelessWidget {
  final GoRouter router;
  const Casca({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoginUser>(
            create: (_) => LoginUser(UserRepositoryImpl(CascaUsersDB()))),
        RepositoryProvider<SignupUser>(
            create: (_) => SignupUser(UserRepositoryImpl(CascaUsersDB()))),
        RepositoryProvider<UpdateUser>(
            create: (_) => UpdateUser(UserRepositoryImpl(CascaUsersDB()))),
        RepositoryProvider<GetData>(
            create: (_) => GetData(BarberRepositoryImpl(CascaBarberDB()))),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(
                  loginUser: LoginUser(UserRepositoryImpl(CascaUsersDB())),
                  signupUser: SignupUser(UserRepositoryImpl(CascaUsersDB())),
                  updateUser: UpdateUser(UserRepositoryImpl(CascaUsersDB())))),
          BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(
                  getData: GetData(BarberRepositoryImpl(CascaBarberDB())))),
          BlocProvider<ExploreBloc>(
              create: (context) => ExploreBloc(
                  getData: GetData(BarberRepositoryImpl(CascaBarberDB())))),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Casca',
              themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
              theme: CascaTheme.lightTheme,
              darkTheme: CascaTheme.darkTheme,
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
