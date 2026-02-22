// ignore_for_file: avoid_js_rounded_ints

import 'package:isar/isar.dart';
import 'package:evoliving/app/core/isar/isar_helper.dart';

abstract base class CacheModel<D> with IsarHelper {
  String get id;
  Id get cacheID => toIntID(id);

  const CacheModel();

  D toDomain();
}
