import 'package:flutter/material.dart';
import 'package:flutter_arch_comp/src/pokemon/views/widgets/actions_fabs_row.dart';
import 'package:flutter_arch_comp/src/pokemon/views/widgets/actions_menu_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../notifiers/pokemon_notifier.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/pokemon_card.dart';

/// PokemonPage represents a page to displays a list of pokemon, showing a
/// loading indicator for fetching operations and an error indicator for errors
class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  static const routeName = 'pokemon_page';

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) => _upload());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
        actions: const <Widget>[ActionsMenuButton()],
      ),
      body: Stack(children: [
        _PokemonList(),
        _LoadingIndicator(),
        _ErrorIndicator(),
      ]),
      floatingActionButton: const ActionsFabsRow(),
    );
  }

  _upload() {
    pokemonNotifierManager.notifier.uploadPokemon();
  }
}

class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isFetchingNotifier = pokemonNotifierManager.notifier.select(
      (s) => s.isFetchingPokemon,
    );

    return ValueListenableBuilder(
      valueListenable: isFetchingNotifier,
      builder: (context, isFetchingPokemon, child) => isFetchingPokemon
          ? const LoadingIndicator()
          : const SizedBox.shrink(),
    );
  }
}

class _PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemsNotifier = pokemonNotifierManager.notifier.select(
      (s) => s.pokemon,
    );
    return ListenableBuilder(
      listenable: itemsNotifier,
      builder: (context, child) {
        final items = itemsNotifier.value;
        return items.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/void.svg',
                        width: 150,
                        height: 150, //asset location
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'No pokemon yet',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                // Providing a restorationId allows the ListView to restore the
                // scroll position when a user leaves and returns to the app after it
                // has been killed while running in the background.
                restorationId: 'pokemonListView',
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return PokemonCard(items[index]);
                },
              );
      },
    );
  }
}

class _ErrorIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final msgNotifier = pokemonNotifierManager.notifier.select(
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
    pokemonNotifierManager.notifier.consumeError();
  }
}
