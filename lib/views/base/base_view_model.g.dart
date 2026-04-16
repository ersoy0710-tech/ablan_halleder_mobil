// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseViewModel on _BaseViewModelBase, Store {
  late final _$seciliSayfaAtom = Atom(
    name: '_BaseViewModelBase.seciliSayfa',
    context: context,
  );

  @override
  int get seciliSayfa {
    _$seciliSayfaAtom.reportRead();
    return super.seciliSayfa;
  }

  @override
  set seciliSayfa(int value) {
    _$seciliSayfaAtom.reportWrite(value, super.seciliSayfa, () {
      super.seciliSayfa = value;
    });
  }

  late final _$_BaseViewModelBaseActionController = ActionController(
    name: '_BaseViewModelBase',
    context: context,
  );

  @override
  void sayfaDegistir(int index) {
    final _$actionInfo = _$_BaseViewModelBaseActionController.startAction(
      name: '_BaseViewModelBase.sayfaDegistir',
    );
    try {
      return super.sayfaDegistir(index);
    } finally {
      _$_BaseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seciliSayfa: ${seciliSayfa}
    ''';
  }
}
