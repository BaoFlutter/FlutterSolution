import 'package:mvp_flutter/data_sources/dependency_injection.dart';
import 'package:mvp_flutter/data_sources/repositories/user_list_repository.dart';
import 'package:mvp_flutter/models/user.dart';

abstract class UserListViewContract {
  void onLoadUserComplete(List<User> users);
  void onLoadUserError();
}
class UserListPresenter {
  UserListViewContract? _view;
  UserListRepository? _repository;
  UserListPresenter(this._view) {
    _repository = new Injector().getUserListRepository();
  }

  void loadUser() {
    assert(_view != null && _repository != null);
    _repository!
        .fetchUser()
        .then((contacts) => _view!.onLoadUserComplete(contacts))
        .catchError((onError) => _view!.onLoadUserError());
  }
}
