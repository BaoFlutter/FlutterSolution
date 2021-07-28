import 'package:mvp_flutter/data_sources/repositories/user_list_repository.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();
  factory Injector() {
    return _singleton;
  }
  Injector._internal();
  UserListRepository getUserListRepository() => new UserListRepositoryIml();
}
