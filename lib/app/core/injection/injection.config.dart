// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:evoliving/app/core/firestore/firestore_service.dart' as _i506;
import 'package:evoliving/app/core/injection/auth_module.dart' as _i449;
import 'package:evoliving/app/core/isar/isar_service.dart' as _i692;
import 'package:evoliving/app/core/l10n/l10n_service.dart' as _i506;
import 'package:evoliving/app/features/authentication/data/data_sources/local/user_isar_source.dart'
    as _i957;
import 'package:evoliving/app/features/authentication/data/data_sources/remote/user_firestore_source.dart'
    as _i593;
import 'package:evoliving/app/features/authentication/domain/repositories/auth_repository.dart'
    as _i581;
import 'package:evoliving/app/features/authentication/domain/repositories/user_repository.dart'
    as _i764;
import 'package:evoliving/app/features/authentication/presentation/bloc/auth_bloc.dart'
    as _i429;
import 'package:evoliving/app/features/login/cubit/login_cubit.dart' as _i766;
import 'package:evoliving/app/features/login/presentation/cubit/login_cubit.dart'
    as _i1062;
import 'package:evoliving/app/features/settings/data/sources/local/settings_isar_source.dart'
    as _i731;
import 'package:evoliving/app/features/settings/domain/settings_repository.dart'
    as _i496;
import 'package:evoliving/app/features/settings/presentation/widgets/settings_bloc.dart'
    as _i361;
import 'package:evoliving/app/features/signup/cubit/sign_up_cubit.dart' as _i167;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final authModule = _$AuthModule();
    gh.singleton<_i506.FirestoreService>(() => _i506.FirestoreService());
    gh.singleton<_i59.FirebaseAuth>(() => authModule.auth);
    gh.singleton<_i116.GoogleSignIn>(() => authModule.googleSignIn);
    await gh.singletonAsync<_i692.IsarService>(
      () => _i692.IsarService.create(),
      preResolve: true,
    );
    gh.singleton<_i506.L10nService>(() => _i506.L10nService());
    gh.singleton<_i957.UserIsarSource>(
        () => _i957.UserIsarSource(gh<_i692.IsarService>()));
    gh.singleton<_i731.SettingsIsarSource>(
        () => _i731.SettingsIsarSource(gh<_i692.IsarService>()));
    gh.singleton<_i496.SettingsRepository>(
        () => _i496.SettingsRepository(gh<_i731.SettingsIsarSource>()));
    gh.singleton<_i593.UserFirestoreSource>(
        () => _i593.UserFirestoreSource(gh<_i506.FirestoreService>()));
    gh.singleton<_i764.UserRepository>(() => _i764.UserRepository(
          gh<_i957.UserIsarSource>(),
          gh<_i593.UserFirestoreSource>(),
        ));
    gh.factory<_i361.SettingsBloc>(
        () => _i361.SettingsBloc(gh<_i496.SettingsRepository>()));
    gh.singleton<_i581.AuthRepository>(
      () => _i581.AuthRepository(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
        gh<_i764.UserRepository>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i429.AuthBloc>(
        () => _i429.AuthBloc(gh<_i581.AuthRepository>()));
    gh.singleton<_i766.LoginCubit>(
        () => _i766.LoginCubit(gh<_i581.AuthRepository>()));
    gh.singleton<_i1062.LoginCubit>(
        () => _i1062.LoginCubit(gh<_i581.AuthRepository>()));
    gh.singleton<_i167.SignUpCubit>(
        () => _i167.SignUpCubit(gh<_i581.AuthRepository>()));
    return this;
  }
}

class _$AuthModule extends _i449.AuthModule {}
