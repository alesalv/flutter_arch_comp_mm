// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pokemon_ui_state.dart';

class PokemonUiStateMapper extends ClassMapperBase<PokemonUiState> {
  PokemonUiStateMapper._();

  static PokemonUiStateMapper? _instance;
  static PokemonUiStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PokemonUiStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PokemonUiState';

  static List<PokemonItemUiState> _$pokemon(PokemonUiState v) => v.pokemon;
  static dynamic _arg$pokemon(f) => f<List<PokemonItemUiState>>();
  static const Field<PokemonUiState, dynamic> _f$pokemon =
      Field('pokemon', _$pokemon, opt: true, arg: _arg$pokemon);
  static bool _$isFetchingPokemon(PokemonUiState v) => v.isFetchingPokemon;
  static const Field<PokemonUiState, bool> _f$isFetchingPokemon =
      Field('isFetchingPokemon', _$isFetchingPokemon, opt: true, def: false);
  static String _$errorMsg(PokemonUiState v) => v.errorMsg;
  static const Field<PokemonUiState, String> _f$errorMsg =
      Field('errorMsg', _$errorMsg, opt: true, def: '');

  @override
  final MappableFields<PokemonUiState> fields = const {
    #pokemon: _f$pokemon,
    #isFetchingPokemon: _f$isFetchingPokemon,
    #errorMsg: _f$errorMsg,
  };

  static PokemonUiState _instantiate(DecodingData data) {
    return PokemonUiState(
        pokemon: data.dec(_f$pokemon),
        isFetchingPokemon: data.dec(_f$isFetchingPokemon),
        errorMsg: data.dec(_f$errorMsg));
  }

  @override
  final Function instantiate = _instantiate;

  static PokemonUiState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PokemonUiState>(map);
  }

  static PokemonUiState fromJson(String json) {
    return ensureInitialized().decodeJson<PokemonUiState>(json);
  }
}

mixin PokemonUiStateMappable {
  String toJson() {
    return PokemonUiStateMapper.ensureInitialized()
        .encodeJson<PokemonUiState>(this as PokemonUiState);
  }

  Map<String, dynamic> toMap() {
    return PokemonUiStateMapper.ensureInitialized()
        .encodeMap<PokemonUiState>(this as PokemonUiState);
  }

  PokemonUiStateCopyWith<PokemonUiState, PokemonUiState, PokemonUiState>
      get copyWith => _PokemonUiStateCopyWithImpl(
          this as PokemonUiState, $identity, $identity);
  @override
  String toString() {
    return PokemonUiStateMapper.ensureInitialized()
        .stringifyValue(this as PokemonUiState);
  }

  @override
  bool operator ==(Object other) {
    return PokemonUiStateMapper.ensureInitialized()
        .equalsValue(this as PokemonUiState, other);
  }

  @override
  int get hashCode {
    return PokemonUiStateMapper.ensureInitialized()
        .hashValue(this as PokemonUiState);
  }
}

extension PokemonUiStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PokemonUiState, $Out> {
  PokemonUiStateCopyWith<$R, PokemonUiState, $Out> get $asPokemonUiState =>
      $base.as((v, t, t2) => _PokemonUiStateCopyWithImpl(v, t, t2));
}

abstract class PokemonUiStateCopyWith<$R, $In extends PokemonUiState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({dynamic pokemon, bool? isFetchingPokemon, String? errorMsg});
  PokemonUiStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PokemonUiStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PokemonUiState, $Out>
    implements PokemonUiStateCopyWith<$R, PokemonUiState, $Out> {
  _PokemonUiStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PokemonUiState> $mapper =
      PokemonUiStateMapper.ensureInitialized();
  @override
  $R call(
          {Object? pokemon = $none,
          bool? isFetchingPokemon,
          String? errorMsg}) =>
      $apply(FieldCopyWithData({
        if (pokemon != $none) #pokemon: pokemon,
        if (isFetchingPokemon != null) #isFetchingPokemon: isFetchingPokemon,
        if (errorMsg != null) #errorMsg: errorMsg
      }));
  @override
  PokemonUiState $make(CopyWithData data) => PokemonUiState(
      pokemon: data.get(#pokemon, or: $value.pokemon),
      isFetchingPokemon:
          data.get(#isFetchingPokemon, or: $value.isFetchingPokemon),
      errorMsg: data.get(#errorMsg, or: $value.errorMsg));

  @override
  PokemonUiStateCopyWith<$R2, PokemonUiState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PokemonUiStateCopyWithImpl($value, $cast, t);
}

class PokemonItemUiStateMapper extends ClassMapperBase<PokemonItemUiState> {
  PokemonItemUiStateMapper._();

  static PokemonItemUiStateMapper? _instance;
  static PokemonItemUiStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PokemonItemUiStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PokemonItemUiState';

  static String _$id(PokemonItemUiState v) => v.id;
  static const Field<PokemonItemUiState, String> _f$id =
      Field('id', _$id, opt: true, def: '');
  static String _$name(PokemonItemUiState v) => v.name;
  static const Field<PokemonItemUiState, String> _f$name =
      Field('name', _$name, opt: true, def: '');
  static String _$image(PokemonItemUiState v) => v.image;
  static const Field<PokemonItemUiState, String> _f$image =
      Field('image', _$image, opt: true, def: '');
  static String _$order(PokemonItemUiState v) => v.order;
  static const Field<PokemonItemUiState, String> _f$order =
      Field('order', _$order, opt: true, def: '');

  @override
  final MappableFields<PokemonItemUiState> fields = const {
    #id: _f$id,
    #name: _f$name,
    #image: _f$image,
    #order: _f$order,
  };

  static PokemonItemUiState _instantiate(DecodingData data) {
    return PokemonItemUiState(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        image: data.dec(_f$image),
        order: data.dec(_f$order));
  }

  @override
  final Function instantiate = _instantiate;

  static PokemonItemUiState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PokemonItemUiState>(map);
  }

  static PokemonItemUiState fromJson(String json) {
    return ensureInitialized().decodeJson<PokemonItemUiState>(json);
  }
}

mixin PokemonItemUiStateMappable {
  String toJson() {
    return PokemonItemUiStateMapper.ensureInitialized()
        .encodeJson<PokemonItemUiState>(this as PokemonItemUiState);
  }

  Map<String, dynamic> toMap() {
    return PokemonItemUiStateMapper.ensureInitialized()
        .encodeMap<PokemonItemUiState>(this as PokemonItemUiState);
  }

  PokemonItemUiStateCopyWith<PokemonItemUiState, PokemonItemUiState,
          PokemonItemUiState>
      get copyWith => _PokemonItemUiStateCopyWithImpl(
          this as PokemonItemUiState, $identity, $identity);
  @override
  String toString() {
    return PokemonItemUiStateMapper.ensureInitialized()
        .stringifyValue(this as PokemonItemUiState);
  }

  @override
  bool operator ==(Object other) {
    return PokemonItemUiStateMapper.ensureInitialized()
        .equalsValue(this as PokemonItemUiState, other);
  }

  @override
  int get hashCode {
    return PokemonItemUiStateMapper.ensureInitialized()
        .hashValue(this as PokemonItemUiState);
  }
}

extension PokemonItemUiStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PokemonItemUiState, $Out> {
  PokemonItemUiStateCopyWith<$R, PokemonItemUiState, $Out>
      get $asPokemonItemUiState =>
          $base.as((v, t, t2) => _PokemonItemUiStateCopyWithImpl(v, t, t2));
}

abstract class PokemonItemUiStateCopyWith<$R, $In extends PokemonItemUiState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? image, String? order});
  PokemonItemUiStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PokemonItemUiStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PokemonItemUiState, $Out>
    implements PokemonItemUiStateCopyWith<$R, PokemonItemUiState, $Out> {
  _PokemonItemUiStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PokemonItemUiState> $mapper =
      PokemonItemUiStateMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? image, String? order}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (image != null) #image: image,
        if (order != null) #order: order
      }));
  @override
  PokemonItemUiState $make(CopyWithData data) => PokemonItemUiState(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      image: data.get(#image, or: $value.image),
      order: data.get(#order, or: $value.order));

  @override
  PokemonItemUiStateCopyWith<$R2, PokemonItemUiState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PokemonItemUiStateCopyWithImpl($value, $cast, t);
}
