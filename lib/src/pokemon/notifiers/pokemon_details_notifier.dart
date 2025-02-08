import 'dart:async';

import 'package:flutter_arch_comp/src/pokemon/models/data/pokemon.dart';
import 'package:minimal/minimal.dart';

import '../../core/models/repositories/repository.dart';
import '../models/repositories/pokemon_repository.dart';
import '../views/ui_states/pokemon_details_ui_state.dart';

/// PokemonDetailsNotifier represents the notifier of the pokemon details page
class PokemonDetailsNotifier extends MMNotifier<PokemonDetailsUiState> {
  PokemonDetailsNotifier(this.pokemonRepository)
      // initial state is loading
      : super(const PokemonDetailsUiState());

  final Repository<Pokemon> pokemonRepository;

  @override
  void dispose() {
    notify(const PokemonDetailsUiState(isFetchingPokemon: false));
    pokemonRepository.dispose();
    super.dispose();
  }

  void consumeError() {
    notify(state.copyWith(errorMsg: ''));
  }

  Future<void> fetchPokemon(String id) async {
    _onLoading();
    try {
      // TODO: add some in-memory cache
      final pokemon = await pokemonRepository.read(int.parse(id));
      _onData(pokemon);
    } on Exception catch (e) {
      _onError('Unable to read pokemon with id $id, $e');
    }
  }

  void _onLoading() {
    // loading case
    notify(state.copyWith(
      isFetchingPokemon: true,
      errorMsg: '',
    ));
  }

  void _onData(Pokemon? data) {
    notify(state.copyWith(
      pokemon: data == null
          ? const PokemonDetailsItemUiState()
          : PokemonDetailsItemUiState.fromPokemon(data),
      isFetchingPokemon: false,
      errorMsg: '',
    ));
  }

  void _onError(String msg) {
    // unsuccessful case
    notify(state.copyWith(
      isFetchingPokemon: false,
      errorMsg: msg,
    ));
  }
}

final pokemonDetailsNotifierManager = MMManager<PokemonDetailsNotifier>(
  () {
    final pokemonRepository = pokemonRepositoryLocator.instance;
    return PokemonDetailsNotifier(pokemonRepository);
  },
  autodispose: true,
);
