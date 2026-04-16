// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adreslerim_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdreslerimViewModel on _AdreslerimViewModelBase, Store {
  late final _$successAtom = Atom(
    name: '_AdreslerimViewModelBase.success',
    context: context,
  );

  @override
  bool? get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool? value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$messageAtom = Atom(
    name: '_AdreslerimViewModelBase.message',
    context: context,
  );

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$adresModelListAtom = Atom(
    name: '_AdreslerimViewModelBase.adresModelList',
    context: context,
  );

  @override
  ObservableList<AdresModel> get adresModelList {
    _$adresModelListAtom.reportRead();
    return super.adresModelList;
  }

  @override
  set adresModelList(ObservableList<AdresModel> value) {
    _$adresModelListAtom.reportWrite(value, super.adresModelList, () {
      super.adresModelList = value;
    });
  }

  late final _$adreslerimAsyncAction = AsyncAction(
    '_AdreslerimViewModelBase.adreslerim',
    context: context,
  );

  @override
  Future<void> adreslerim() {
    return _$adreslerimAsyncAction.run(() => super.adreslerim());
  }

  late final _$adresSilAsyncAction = AsyncAction(
    '_AdreslerimViewModelBase.adresSil',
    context: context,
  );

  @override
  Future<bool> adresSil(int index) {
    return _$adresSilAsyncAction.run(() => super.adresSil(index));
  }

  @override
  String toString() {
    return '''
success: ${success},
message: ${message},
adresModelList: ${adresModelList}
    ''';
  }
}
