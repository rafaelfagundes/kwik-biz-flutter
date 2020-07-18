// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$isDarkAtom = Atom(name: '_AppStore.isDark');

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_AppStore.init');

  @override
  Future<dynamic> init(ILocalStorage localStorageService) {
    return _$initAsyncAction.run(() => super.init(localStorageService));
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  bool setIsDark(bool _isDark) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setIsDark');
    try {
      return super.setIsDark(_isDark);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDark: ${isDark}
    ''';
  }
}
