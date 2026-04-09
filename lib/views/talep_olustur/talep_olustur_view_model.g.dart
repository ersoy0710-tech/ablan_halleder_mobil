// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talep_olustur_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TalepOlusturViewModel on _TalepOlusturViewModelBase, Store {
  late final _$secilenAdresAtom = Atom(
    name: '_TalepOlusturViewModelBase.secilenAdres',
    context: context,
  );

  @override
  AdresModel? get secilenAdres {
    _$secilenAdresAtom.reportRead();
    return super.secilenAdres;
  }

  @override
  set secilenAdres(AdresModel? value) {
    _$secilenAdresAtom.reportWrite(value, super.secilenAdres, () {
      super.secilenAdres = value;
    });
  }

  late final _$adresModelListAtom = Atom(
    name: '_TalepOlusturViewModelBase.adresModelList',
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

  late final _$petVarMiAtom = Atom(
    name: '_TalepOlusturViewModelBase.petVarMi',
    context: context,
  );

  @override
  bool get petVarMi {
    _$petVarMiAtom.reportRead();
    return super.petVarMi;
  }

  @override
  set petVarMi(bool value) {
    _$petVarMiAtom.reportWrite(value, super.petVarMi, () {
      super.petVarMi = value;
    });
  }

  late final _$planlananTarihAtom = Atom(
    name: '_TalepOlusturViewModelBase.planlananTarih',
    context: context,
  );

  @override
  DateTime? get planlananTarih {
    _$planlananTarihAtom.reportRead();
    return super.planlananTarih;
  }

  @override
  set planlananTarih(DateTime? value) {
    _$planlananTarihAtom.reportWrite(value, super.planlananTarih, () {
      super.planlananTarih = value;
    });
  }

  late final _$successAtom = Atom(
    name: '_TalepOlusturViewModelBase.success',
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
    name: '_TalepOlusturViewModelBase.message',
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

  late final _$adreslerimAsyncAction = AsyncAction(
    '_TalepOlusturViewModelBase.adreslerim',
    context: context,
  );

  @override
  Future<void> adreslerim() {
    return _$adreslerimAsyncAction.run(() => super.adreslerim());
  }

  late final _$_TalepOlusturViewModelBaseActionController = ActionController(
    name: '_TalepOlusturViewModelBase',
    context: context,
  );

  @override
  bool validate() {
    final _$actionInfo = _$_TalepOlusturViewModelBaseActionController
        .startAction(name: '_TalepOlusturViewModelBase.validate');
    try {
      return super.validate();
    } finally {
      _$_TalepOlusturViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adresSec(String? val) {
    final _$actionInfo = _$_TalepOlusturViewModelBaseActionController
        .startAction(name: '_TalepOlusturViewModelBase.adresSec');
    try {
      return super.adresSec(val);
    } finally {
      _$_TalepOlusturViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void petVarMiDegistir(bool val) {
    final _$actionInfo = _$_TalepOlusturViewModelBaseActionController
        .startAction(name: '_TalepOlusturViewModelBase.petVarMiDegistir');
    try {
      return super.petVarMiDegistir(val);
    } finally {
      _$_TalepOlusturViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void planlananTarihDegistir(DateTime val) {
    final _$actionInfo = _$_TalepOlusturViewModelBaseActionController
        .startAction(name: '_TalepOlusturViewModelBase.planlananTarihDegistir');
    try {
      return super.planlananTarihDegistir(val);
    } finally {
      _$_TalepOlusturViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
secilenAdres: ${secilenAdres},
adresModelList: ${adresModelList},
petVarMi: ${petVarMi},
planlananTarih: ${planlananTarih},
success: ${success},
message: ${message}
    ''';
  }
}
