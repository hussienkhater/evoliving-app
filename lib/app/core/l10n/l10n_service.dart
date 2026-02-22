import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:evoliving/app/core/extension_methods/bloc_x.dart';
import 'package:evoliving/app/core/l10n/arb/app_localizations.dart';
import 'package:evoliving/app/core/l10n/language.dart';
import 'package:evoliving/app/features/settings/presentation/widgets/settings_bloc.dart';


@singleton
final class L10nService {
  AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context);

  String trFromStr(String trStrKey, BuildContext context) {
    final trKey =
        _Transaltions.values.firstOrNullWhere((tr) => tr.name == trStrKey);
    if (trKey == null) return trStrKey;
    return trKey.getTr(context.settingsBloc.state.settings.language);
  }
}

/// Translations that can't be predefined in [AppLocalizations]
enum _Transaltions {
  other(ar: 'أخرى', en: 'Other');

  final String ar;
  final String en;

  const _Transaltions({
    required this.ar,
    required this.en,
  });

  String getTr(Language lang) => switch (lang) {
        Language.arabic => ar,
        Language.english => en,
      };
}
