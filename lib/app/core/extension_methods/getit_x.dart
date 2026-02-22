
import 'package:get_it/get_it.dart';
import 'package:evoliving/app/core/l10n/l10n_service.dart';
import 'package:evoliving/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:evoliving/app/features/authentication/presentation/bloc/auth_bloc.dart';

extension GetItX on GetIt {
  // Blocs
  AuthBloc get authBloc => get<AuthBloc>();

  // Services
  L10nService get l10nSvc => get<L10nService>();

  // Repositories
  AuthRepository get authRepo => get<AuthRepository>();
}
