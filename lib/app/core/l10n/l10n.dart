import 'package:flutter/widgets.dart';
import 'package:evoliving/app/core/extension_methods/getit_x.dart';
import 'package:evoliving/app/core/injection/injection.dart';
import 'package:evoliving/app/core/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => getIt.l10nSvc.l10n(this);
  String tr(String trKey) => getIt.l10nSvc.trFromStr(trKey, this);
}
