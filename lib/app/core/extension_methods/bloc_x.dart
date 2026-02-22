import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evoliving/app/features/settings/presentation/widgets/settings_bloc.dart'
    show SettingsBloc;

extension Blocs on BuildContext {
  SettingsBloc get settingsBloc => read<SettingsBloc>();
}
