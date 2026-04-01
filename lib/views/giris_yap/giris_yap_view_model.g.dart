// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giris_yap_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GirisYapViewModel on _GirisYapViewModelBase, Store {
  late final _$successAtom = Atom(
    name: '_GirisYapViewModelBase.success',
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
    name: '_GirisYapViewModelBase.message',
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

  late final _$girisYapAsyncAction = AsyncAction(
    '_GirisYapViewModelBase.girisYap',
    context: context,
  );

  @override
  Future<void> girisYap(BuildContext context) {
    return _$girisYapAsyncAction.run(() => super.girisYap(context));
  }

  @override
  String toString() {
    return '''
success: ${success},
message: ${message}
    ''';
  }
}
