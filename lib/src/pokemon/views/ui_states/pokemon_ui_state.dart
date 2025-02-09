import 'package:dart_mappable/dart_mappable.dart';
import 'package:minimal_mvn/minimal_mvn.dart';

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
@MappableClass()
class PokemonItemUiState with PokemonItemUiStateMappable {
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
}
