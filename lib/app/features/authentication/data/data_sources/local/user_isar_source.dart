import 'package:injectable/injectable.dart';
import 'package:evoliving/app/core/isar/isar_source.dart';
import 'package:evoliving/app/features/authentication/data/models/local/user_isar.dart';
import 'package:evoliving/app/features/authentication/domain/models/user.dart';

@singleton
final class UserIsarSource extends IsarSource<User, UserIsar> {
  const UserIsarSource(super.isarService);

  @override
  UserIsar fromDomain(User dm) => UserIsar.fromDomain(dm);
}
