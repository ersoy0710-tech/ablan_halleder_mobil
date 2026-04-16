// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taleplerim_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaleplerimViewModel on _TaleplerimViewModelBase, Store {
  late final _$successAtom = Atom(
    name: '_TaleplerimViewModelBase.success',
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
    name: '_TaleplerimViewModelBase.message',
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

  late final _$talepModelListAtom = Atom(
    name: '_TaleplerimViewModelBase.talepModelList',
    context: context,
  );

  @override
  ObservableList<TalepModel> get talepModelList {
    _$talepModelListAtom.reportRead();
    return super.talepModelList;
  }

  @override
  set talepModelList(ObservableList<TalepModel> value) {
    _$talepModelListAtom.reportWrite(value, super.talepModelList, () {
      super.talepModelList = value;
    });
  }

  late final _$taleplerimAsyncAction = AsyncAction(
    '_TaleplerimViewModelBase.taleplerim',
    context: context,
  );

  @override
  Future<void> taleplerim() {
    return _$taleplerimAsyncAction.run(() => super.taleplerim());
  }

  @override
  String toString() {
    return '''
success: ${success},
message: ${message},
talepModelList: ${talepModelList}
    ''';
  }
}
