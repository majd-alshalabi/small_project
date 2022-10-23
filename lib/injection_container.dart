import 'package:get_it/get_it.dart';
import 'package:small_project/core/feature/bloc/theme_bloc/theme_cubit.dart';
import 'package:small_project/feature/create_user/bloc/create_user_cubit/create_user_cubit.dart';

final sl = GetIt.instance;

void init() {
//----------------//-----------------//----Bloc  & cubit per feature----

  sl.registerLazySingleton(() => ThemeCubit());
  sl.registerLazySingleton(() => CreateUserCubit());
}
