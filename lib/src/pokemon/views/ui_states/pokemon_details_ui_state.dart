import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_arch_comp/src/core/utils/extensions.dart';
import 'package:flutter_arch_comp/src/pokemon/models/data/pokemon.dart';

part 'pokemon_details_ui_state.mapper.dart';

/// PokemonDetailsUiState represents the UI state for the pokemon details page
@MappableClass()
class PokemonDetailsUiState with PokemonDetailsUiStateMappable {
  const PokemonDetailsUiState({
    this.pokemon = const PokemonDetailsItemUiState(),
    this.isFetchingPokemon = false,
    this.errorMsg = '',
  });

  final PokemonDetailsItemUiState pokemon;
  final bool isFetchingPokemon;
  final String errorMsg;
}

/// PokemonDetailsItemUiState represents the UI state for an item of the
/// pokemon details page
@MappableClass()
class PokemonDetailsItemUiState with PokemonDetailsItemUiStateMappable {
  const PokemonDetailsItemUiState({
    this.abilities = '',
    this.baseExperience = '',
    this.height = '',
    this.id = '',
    this.moves = '',
    this.name = '',
    this.image = '',
    this.types = '',
    this.weight = '',
  });

  final String abilities;
  final String baseExperience;
  final String height;
  final String id;
  final String moves;
  final String name;
  final String image;
  final String types;
  final String weight;

  factory PokemonDetailsItemUiState.fromPokemon(Pokemon pokemon) =>
      PokemonDetailsItemUiState(
        abilities: pokemon.abilitiesList.toPlainString(),
        baseExperience: pokemon.baseExperience.toString(),
        height: pokemon.height.toString(),
        id: pokemon.id.toString(),
        moves: pokemon.movesList.toPlainString(),
        name: pokemon.name,
        image: pokemon.image,
        types: pokemon.typesList.toPlainString(),
        weight: pokemon.weight.toString(),
      );

  bool get isEmpty => this == const PokemonDetailsItemUiState();
}
