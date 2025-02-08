import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/views/widgets/circular_image.dart';
import '../../notifiers/pokemon_details_notifier.dart';
import '../widgets/loading_indicator.dart';

/// Displays detailed information about a pokemon
class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({required this.id, super.key});

  final String id;
  static const routeName = 'pokemon_details';

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => pokemonDetailsNotifierManager.notifier.fetchPokemon(widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Details'),
      ),
      body: Stack(children: [
        _PokemonDetailsPanel(widget.id),
        _LoadingIndicator(widget.id),
        _ErrorIndicator(widget.id),
      ]),
    );
  }
}

class PokemonDetailsViewArgs {
  final String id;
  const PokemonDetailsViewArgs(this.id);
}

class _LoadingIndicator extends ConsumerWidget {
  const _LoadingIndicator(this.id);
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFetchingNotifier = pokemonDetailsNotifierManager.notifier.select(
      (final s) => s.isFetchingPokemon,
    );

    return ValueListenableBuilder(
      valueListenable: isFetchingNotifier,
      builder: (context, isFetchingPokemon, child) => isFetchingPokemon
          ? const LoadingIndicator()
          : const SizedBox.shrink(),
    );
  }
}

class _PokemonDetailsPanel extends ConsumerWidget {
  const _PokemonDetailsPanel(this.id);
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsNotifier = pokemonDetailsNotifierManager.notifier.select(
      (s) => s.pokemon,
    );
    return ListenableBuilder(
      listenable: itemsNotifier,
      builder: (context, child) {
        final pokemon = itemsNotifier.value;
        return pokemon.isEmpty
            ? Center(
                child: Text(
                  'No information for pokemon with id $id',
                  style: const TextStyle(fontSize: 20),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: CircularImage(imageUrl: pokemon.image, size: 200),
                    ),
                    _Tile(title: 'Name', content: pokemon.name),
                    _Tile(title: 'Experience', content: pokemon.baseExperience),
                    _Tile(title: 'Height (dm)', content: pokemon.height),
                    _Tile(title: 'Weight (hg)', content: pokemon.weight),
                    _Tile(title: 'Types', content: pokemon.types.toString()),
                    _Tile(title: 'Abilities', content: pokemon.abilities),
                    _Tile(title: 'Moves', content: pokemon.moves.toString()),
                  ],
                ),
              );
      },
    );
  }
}

class _ErrorIndicator extends StatelessWidget {
  const _ErrorIndicator(this.id);
  final String id;

  @override
  Widget build(BuildContext context) {
    final msgNotifier = pokemonDetailsNotifierManager.notifier.select(
      (s) => s.errorMsg,
    );
    return ValueListenableBuilder(
      valueListenable: msgNotifier,
      builder: (context, msg, child) {
        if (msg.isNotEmpty) {
          WidgetsBinding.instance
              .addPostFrameCallback((final _) => _showSnackbar(context, msg));
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _showSnackbar(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text('Oops something went wrong: $msg'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    pokemonDetailsNotifierManager.notifier.consumeError();
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('${title.toUpperCase()}: $content'),
    );
  }
}
