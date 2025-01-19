import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:minimal/minimal.dart';

import '../../models/data/pokemon.dart';

part 'pokemon_ui_state.mapper.dart';

/// PokemonUiState represents the UI state for the pokemon page
@MappableClass()
class PokemonUiState extends MMState with PokemonUiStateMappable {
  PokemonUiState({
    pokemon,
    this.isFetchingPokemon = false,
    this.errorMsg = '',
  }) : pokemon = (pokemon == null) ? const [] : List.unmodifiable(pokemon);
  final List<PokemonItemUiState> pokemon;
  final bool isFetchingPokemon;
  final String errorMsg;
}

/// PokemonItemUiState represents the UI state for an item of the pokemon page
@immutable
class PokemonItemUiState {
  const PokemonItemUiState({
    this.id = '',
    this.name = '',
    this.image = '',
    this.order = '',
  });

  final String id;
  final String name;
  final String order;
  final String image;

  factory PokemonItemUiState.fromPokemon(Pokemon pokemon) => PokemonItemUiState(
        id: pokemon.id.toString(),
        name: pokemon.name,
        image: pokemon.image,
        order: pokemon.order.toString(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonItemUiState &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          order == other.order &&
          image == other.image;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ order.hashCode ^ image.hashCode;
}
