// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$userAtom = Atom(name: '_AuthStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isLoggedAtom = Atom(name: '_AuthStore.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$tokenAtom = Atom(name: '_AuthStore.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$setIsLoggedAsyncAction = AsyncAction('_AuthStore.setIsLogged');

  @override
  Future<void> setIsLogged(bool isLogged) {
    return _$setIsLoggedAsyncAction.run(() => super.setIsLogged(isLogged));
  }

  final _$initAsyncAction = AsyncAction('_AuthStore.init');

  @override
  Future<dynamic> init(ILocalStorage localStorageService) {
    return _$initAsyncAction.run(() => super.init(localStorageService));
  }

  final _$setUserAsyncAction = AsyncAction('_AuthStore.setUser');

  @override
  Future<User> setUser(User _user) {
    return _$setUserAsyncAction.run(() => super.setUser(_user));
  }

  final _$setTokenAsyncAction = AsyncAction('_AuthStore.setToken');

  @override
  Future<String> setToken(String _token) {
    return _$setTokenAsyncAction.run(() => super.setToken(_token));
  }

  final _$clearUserAsyncAction = AsyncAction('_AuthStore.clearUser');

  @override
  Future<void> clearUser() {
    return _$clearUserAsyncAction.run(() => super.clearUser());
  }

  final _$signOutAsyncAction = AsyncAction('_AuthStore.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged},
token: ${token}
    ''';
  }
}
