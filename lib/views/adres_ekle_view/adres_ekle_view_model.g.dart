// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adres_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdresEkleViewModel on _AdresEkleViewModelBase, Store {
  late final _$secilenIlAtom = Atom(
    name: '_AdresEkleViewModelBase.secilenIl',
    context: context,
  );

  @override
  IlModel? get secilenIl {
    _$secilenIlAtom.reportRead();
    return super.secilenIl;
  }

  @override
  set secilenIl(IlModel? value) {
    _$secilenIlAtom.reportWrite(value, super.secilenIl, () {
      super.secilenIl = value;
    });
  }

  late final _$ilModelListAtom = Atom(
    name: '_AdresEkleViewModelBase.ilModelList',
    context: context,
  );

  @override
  ObservableList<IlModel> get ilModelList {
    _$ilModelListAtom.reportRead();
    return super.ilModelList;
  }

  @override
  set ilModelList(ObservableList<IlModel> value) {
    _$ilModelListAtom.reportWrite(value, super.ilModelList, () {
      super.ilModelList = value;
    });
  }

  late final _$secilenIlceAtom = Atom(
    name: '_AdresEkleViewModelBase.secilenIlce',
    context: context,
  );

  @override
  IlceModel? get secilenIlce {
    _$secilenIlceAtom.reportRead();
    return super.secilenIlce;
  }

  @override
  set secilenIlce(IlceModel? value) {
    _$secilenIlceAtom.reportWrite(value, super.secilenIlce, () {
      super.secilenIlce = value;
    });
  }

  late final _$ilceModelListAtom = Atom(
    name: '_AdresEkleViewModelBase.ilceModelList',
    context: context,
  );

  @override
  ObservableList<IlceModel> get ilceModelList {
    _$ilceModelListAtom.reportRead();
    return super.ilceModelList;
  }

  @override
  set ilceModelList(ObservableList<IlceModel> value) {
    _$ilceModelListAtom.reportWrite(value, super.ilceModelList, () {
      super.ilceModelList = value;
    });
  }

  late final _$successAtom = Atom(
    name: '_AdresEkleViewModelBase.success',
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
    name: '_AdresEkleViewModelBase.message',
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

  late final _$adresEkleAsyncAction = AsyncAction(
    '_AdresEkleViewModelBase.adresEkle',
    context: context,
  );

  @override
  Future<void> adresEkle() {
    return _$adresEkleAsyncAction.run(() => super.adresEkle());
  }

  late final _$_AdresEkleViewModelBaseActionController = ActionController(
    name: '_AdresEkleViewModelBase',
    context: context,
  );

  @override
  void ilSec(IlModel? il) {
    final _$actionInfo = _$_AdresEkleViewModelBaseActionController.startAction(
      name: '_AdresEkleViewModelBase.ilSec',
    );
    try {
      return super.ilSec(il);
    } finally {
      _$_AdresEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void ilceSec(IlceModel? ilce) {
    final _$actionInfo = _$_AdresEkleViewModelBaseActionController.startAction(
      name: '_AdresEkleViewModelBase.ilceSec',
    );
    try {
      return super.ilceSec(ilce);
    } finally {
      _$_AdresEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validate() {
    final _$actionInfo = _$_AdresEkleViewModelBaseActionController.startAction(
      name: '_AdresEkleViewModelBase.validate',
    );
    try {
      return super.validate();
    } finally {
      _$_AdresEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
secilenIl: ${secilenIl},
ilModelList: ${ilModelList},
secilenIlce: ${secilenIlce},
ilceModelList: ${ilceModelList},
success: ${success},
message: ${message}
    ''';
  }
}
