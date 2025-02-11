import 'dart:async';

import 'package:flutter_arch_comp/src/pokemon/models/data/pokemon.dart';
import 'package:minimal_mvn/minimal_mvn.dart';

import '../../core/models/repositories/repository.dart';
import '../models/repositories/pokemon_repository.dart';
import '../views/ui_states/pokemon_details_ui_state.dart';

/// PokemonDetailsNotifier represents the notifier of the pokemon details page
class PokemonDetailsNotifier extends MMNotifier<PokemonDetailsUiState> {
  PokemonDetailsNotifier(this.pokemonRepository)
      // initial state is loading
      : super(const PokemonDetailsUiState());

  final Repository<Pokemon> pokemonRepository;
  // in-memory cache for pokemon
  static final _pokemonCache = <int, Pokemon>{};

  @override
  void dispose() {
    notify(const PokemonDetailsUiState(isFetchingPokemon: false));
    pokemonRepository.dispose();
    super.dispose();
  }

  void consumeError() {
    if (disposed) return;
    notify(state.copyWith(errorMsg: ''));
  }

  Future<void> fetchPokemon(String id) async {
    final cached = _pokemonCache[int.parse(id)];
    if (cached != null) {
      _onData(cached);
      return;
    }

    _onLoading();
    try {
      final pokemon = await pokemonRepository.read(int.parse(id));
      _onData(pokemon);
    } on Exception catch (e) {
      _onError('Unable to read pokemon with id $id, $e');
    }
  }

  void _onLoading() {
    // loading case
    if (disposed) return;
    notify(state.copyWith(
      isFetchingPokemon: true,
      errorMsg: '',
    ));
  }

  void _onData(Pokemon? data) {
    unawaited(_cachePokemon(data));
    if (disposed) return;
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
    if (disposed) return;
    notify(state.copyWith(
      isFetchingPokemon: false,
      errorMsg: msg,
    ));
  }

  Future<void> _cachePokemon(Pokemon? data) async {
    if (data != null) {
      _pokemonCache[data.id] = data;
    }
  }
}

final pokemonDetailsNotifierManager = MMManager<PokemonDetailsNotifier>(
  () {
    final pokemonRepository = pokemonRepositoryLocator.instance;
    return PokemonDetailsNotifier(pokemonRepository);
  },
  autodispose: true,
);
