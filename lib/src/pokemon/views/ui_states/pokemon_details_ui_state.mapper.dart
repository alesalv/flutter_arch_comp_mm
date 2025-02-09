// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pokemon_details_ui_state.dart';

class PokemonDetailsUiStateMapper
    extends ClassMapperBase<PokemonDetailsUiState> {
  PokemonDetailsUiStateMapper._();

  static PokemonDetailsUiStateMapper? _instance;
  static PokemonDetailsUiStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PokemonDetailsUiStateMapper._());
      PokemonDetailsItemUiStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PokemonDetailsUiState';

  static PokemonDetailsItemUiState _$pokemon(PokemonDetailsUiState v) =>
      v.pokemon;
  static const Field<PokemonDetailsUiState, PokemonDetailsItemUiState>
      _f$pokemon = Field('pokemon', _$pokemon,
          opt: true, def: const PokemonDetailsItemUiState());
  static bool _$isFetchingPokemon(PokemonDetailsUiState v) =>
      v.isFetchingPokemon;
  static const Field<PokemonDetailsUiState, bool> _f$isFetchingPokemon =
      Field('isFetchingPokemon', _$isFetchingPokemon, opt: true, def: false);
  static String _$errorMsg(PokemonDetailsUiState v) => v.errorMsg;
  static const Field<PokemonDetailsUiState, String> _f$errorMsg =
      Field('errorMsg', _$errorMsg, opt: true, def: '');

  @override
  final MappableFields<PokemonDetailsUiState> fields = const {
    #pokemon: _f$pokemon,
    #isFetchingPokemon: _f$isFetchingPokemon,
    #errorMsg: _f$errorMsg,
  };

  static PokemonDetailsUiState _instantiate(DecodingData data) {
    return PokemonDetailsUiState(
        pokemon: data.dec(_f$pokemon),
        isFetchingPokemon: data.dec(_f$isFetchingPokemon),
        errorMsg: data.dec(_f$errorMsg));
  }

  @override
  final Function instantiate = _instantiate;

  static PokemonDetailsUiState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PokemonDetailsUiState>(map);
  }

  static PokemonDetailsUiState fromJson(String json) {
    return ensureInitialized().decodeJson<PokemonDetailsUiState>(json);
  }
}

mixin PokemonDetailsUiStateMappable {
  String toJson() {
    return PokemonDetailsUiStateMapper.ensureInitialized()
        .encodeJson<PokemonDetailsUiState>(this as PokemonDetailsUiState);
  }

  Map<String, dynamic> toMap() {
    return PokemonDetailsUiStateMapper.ensureInitialized()
        .encodeMap<PokemonDetailsUiState>(this as PokemonDetailsUiState);
  }

  PokemonDetailsUiStateCopyWith<PokemonDetailsUiState, PokemonDetailsUiState,
          PokemonDetailsUiState>
      get copyWith => _PokemonDetailsUiStateCopyWithImpl(
          this as PokemonDetailsUiState, $identity, $identity);
  @override
  String toString() {
    return PokemonDetailsUiStateMapper.ensureInitialized()
        .stringifyValue(this as PokemonDetailsUiState);
  }

  @override
  bool operator ==(Object other) {
    return PokemonDetailsUiStateMapper.ensureInitialized()
        .equalsValue(this as PokemonDetailsUiState, other);
  }

  @override
  int get hashCode {
    return PokemonDetailsUiStateMapper.ensureInitialized()
        .hashValue(this as PokemonDetailsUiState);
  }
}

extension PokemonDetailsUiStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PokemonDetailsUiState, $Out> {
  PokemonDetailsUiStateCopyWith<$R, PokemonDetailsUiState, $Out>
      get $asPokemonDetailsUiState =>
          $base.as((v, t, t2) => _PokemonDetailsUiStateCopyWithImpl(v, t, t2));
}

abstract class PokemonDetailsUiStateCopyWith<
    $R,
    $In extends PokemonDetailsUiState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  PokemonDetailsItemUiStateCopyWith<$R, PokemonDetailsItemUiState,
      PokemonDetailsItemUiState> get pokemon;
  $R call(
      {PokemonDetailsItemUiState? pokemon,
      bool? isFetchingPokemon,
      String? errorMsg});
  PokemonDetailsUiStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PokemonDetailsUiStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PokemonDetailsUiState, $Out>
    implements PokemonDetailsUiStateCopyWith<$R, PokemonDetailsUiState, $Out> {
  _PokemonDetailsUiStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PokemonDetailsUiState> $mapper =
      PokemonDetailsUiStateMapper.ensureInitialized();
  @override
  PokemonDetailsItemUiStateCopyWith<$R, PokemonDetailsItemUiState,
          PokemonDetailsItemUiState>
      get pokemon => $value.pokemon.copyWith.$chain((v) => call(pokemon: v));
  @override
  $R call(
          {PokemonDetailsItemUiState? pokemon,
          bool? isFetchingPokemon,
          String? errorMsg}) =>
      $apply(FieldCopyWithData({
        if (pokemon != null) #pokemon: pokemon,
        if (isFetchingPokemon != null) #isFetchingPokemon: isFetchingPokemon,
        if (errorMsg != null) #errorMsg: errorMsg
      }));
  @override
  PokemonDetailsUiState $make(CopyWithData data) => PokemonDetailsUiState(
      pokemon: data.get(#pokemon, or: $value.pokemon),
      isFetchingPokemon:
          data.get(#isFetchingPokemon, or: $value.isFetchingPokemon),
      errorMsg: data.get(#errorMsg, or: $value.errorMsg));

  @override
  PokemonDetailsUiStateCopyWith<$R2, PokemonDetailsUiState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PokemonDetailsUiStateCopyWithImpl($value, $cast, t);
}

class PokemonDetailsItemUiStateMapper
    extends ClassMapperBase<PokemonDetailsItemUiState> {
  PokemonDetailsItemUiStateMapper._();

  static PokemonDetailsItemUiStateMapper? _instance;
  static PokemonDetailsItemUiStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PokemonDetailsItemUiStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PokemonDetailsItemUiState';

  static String _$abilities(PokemonDetailsItemUiState v) => v.abilities;
  static const Field<PokemonDetailsItemUiState, String> _f$abilities =
      Field('abilities', _$abilities, opt: true, def: '');
  static String _$baseExperience(PokemonDetailsItemUiState v) =>
      v.baseExperience;
  static const Field<PokemonDetailsItemUiState, String> _f$baseExperience =
      Field('baseExperience', _$baseExperience, opt: true, def: '');
  static String _$height(PokemonDetailsItemUiState v) => v.height;
  static const Field<PokemonDetailsItemUiState, String> _f$height =
      Field('height', _$height, opt: true, def: '');
  static String _$id(PokemonDetailsItemUiState v) => v.id;
  static const Field<PokemonDetailsItemUiState, String> _f$id =
      Field('id', _$id, opt: true, def: '');
  static String _$moves(PokemonDetailsItemUiState v) => v.moves;
  static const Field<PokemonDetailsItemUiState, String> _f$moves =
      Field('moves', _$moves, opt: true, def: '');
  static String _$name(PokemonDetailsItemUiState v) => v.name;
  static const Field<PokemonDetailsItemUiState, String> _f$name =
      Field('name', _$name, opt: true, def: '');
  static String _$image(PokemonDetailsItemUiState v) => v.image;
  static const Field<PokemonDetailsItemUiState, String> _f$image =
      Field('image', _$image, opt: true, def: '');
  static String _$types(PokemonDetailsItemUiState v) => v.types;
  static const Field<PokemonDetailsItemUiState, String> _f$types =
      Field('types', _$types, opt: true, def: '');
  static String _$weight(PokemonDetailsItemUiState v) => v.weight;
  static const Field<PokemonDetailsItemUiState, String> _f$weight =
      Field('weight', _$weight, opt: true, def: '');

  @override
  final MappableFields<PokemonDetailsItemUiState> fields = const {
    #abilities: _f$abilities,
    #baseExperience: _f$baseExperience,
    #height: _f$height,
    #id: _f$id,
    #moves: _f$moves,
    #name: _f$name,
    #image: _f$image,
    #types: _f$types,
    #weight: _f$weight,
  };

  static PokemonDetailsItemUiState _instantiate(DecodingData data) {
    return PokemonDetailsItemUiState(
        abilities: data.dec(_f$abilities),
        baseExperience: data.dec(_f$baseExperience),
        height: data.dec(_f$height),
        id: data.dec(_f$id),
        moves: data.dec(_f$moves),
        name: data.dec(_f$name),
        image: data.dec(_f$image),
        types: data.dec(_f$types),
        weight: data.dec(_f$weight));
  }

  @override
  final Function instantiate = _instantiate;

  static PokemonDetailsItemUiState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PokemonDetailsItemUiState>(map);
  }

  static PokemonDetailsItemUiState fromJson(String json) {
    return ensureInitialized().decodeJson<PokemonDetailsItemUiState>(json);
  }
}

mixin PokemonDetailsItemUiStateMappable {
  String toJson() {
    return PokemonDetailsItemUiStateMapper.ensureInitialized()
        .encodeJson<PokemonDetailsItemUiState>(
            this as PokemonDetailsItemUiState);
  }

  Map<String, dynamic> toMap() {
    return PokemonDetailsItemUiStateMapper.ensureInitialized()
        .encodeMap<PokemonDetailsItemUiState>(
            this as PokemonDetailsItemUiState);
  }

  PokemonDetailsItemUiStateCopyWith<PokemonDetailsItemUiState,
          PokemonDetailsItemUiState, PokemonDetailsItemUiState>
      get copyWith => _PokemonDetailsItemUiStateCopyWithImpl(
          this as PokemonDetailsItemUiState, $identity, $identity);
  @override
  String toString() {
    return PokemonDetailsItemUiStateMapper.ensureInitialized()
        .stringifyValue(this as PokemonDetailsItemUiState);
  }

  @override
  bool operator ==(Object other) {
    return PokemonDetailsItemUiStateMapper.ensureInitialized()
        .equalsValue(this as PokemonDetailsItemUiState, other);
  }

  @override
  int get hashCode {
    return PokemonDetailsItemUiStateMapper.ensureInitialized()
        .hashValue(this as PokemonDetailsItemUiState);
  }
}

extension PokemonDetailsItemUiStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PokemonDetailsItemUiState, $Out> {
  PokemonDetailsItemUiStateCopyWith<$R, PokemonDetailsItemUiState, $Out>
      get $asPokemonDetailsItemUiState => $base
          .as((v, t, t2) => _PokemonDetailsItemUiStateCopyWithImpl(v, t, t2));
}

abstract class PokemonDetailsItemUiStateCopyWith<
    $R,
    $In extends PokemonDetailsItemUiState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? abilities,
      String? baseExperience,
      String? height,
      String? id,
      String? moves,
      String? name,
      String? image,
      String? types,
      String? weight});
  PokemonDetailsItemUiStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PokemonDetailsItemUiStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PokemonDetailsItemUiState, $Out>
    implements
        PokemonDetailsItemUiStateCopyWith<$R, PokemonDetailsItemUiState, $Out> {
  _PokemonDetailsItemUiStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PokemonDetailsItemUiState> $mapper =
      PokemonDetailsItemUiStateMapper.ensureInitialized();
  @override
  $R call(
          {String? abilities,
          String? baseExperience,
          String? height,
          String? id,
          String? moves,
          String? name,
          String? image,
          String? types,
          String? weight}) =>
      $apply(FieldCopyWithData({
        if (abilities != null) #abilities: abilities,
        if (baseExperience != null) #baseExperience: baseExperience,
        if (height != null) #height: height,
        if (id != null) #id: id,
        if (moves != null) #moves: moves,
        if (name != null) #name: name,
        if (image != null) #image: image,
        if (types != null) #types: types,
        if (weight != null) #weight: weight
      }));
  @override
  PokemonDetailsItemUiState $make(CopyWithData data) =>
      PokemonDetailsItemUiState(
          abilities: data.get(#abilities, or: $value.abilities),
          baseExperience: data.get(#baseExperience, or: $value.baseExperience),
          height: data.get(#height, or: $value.height),
          id: data.get(#id, or: $value.id),
          moves: data.get(#moves, or: $value.moves),
          name: data.get(#name, or: $value.name),
          image: data.get(#image, or: $value.image),
          types: data.get(#types, or: $value.types),
          weight: data.get(#weight, or: $value.weight));

  @override
  PokemonDetailsItemUiStateCopyWith<$R2, PokemonDetailsItemUiState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PokemonDetailsItemUiStateCopyWithImpl($value, $cast, t);
}
