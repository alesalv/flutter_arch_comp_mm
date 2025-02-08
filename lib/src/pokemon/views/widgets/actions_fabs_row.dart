import 'package:flutter/material.dart';

import '../../notifiers/pokemon_notifier.dart';
import '../../models/data/pokemon.dart';

class ActionsFabsRow extends StatelessWidget {
  const ActionsFabsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            heroTag: "buttonCreate",
            child: const Icon(Icons.add),
            onPressed: () =>
                pokemonNotifierManager.notifier.create(const Pokemon())),
        const SizedBox(width: 16),
        FloatingActionButton(
            heroTag: "buttonDelete",
            child: const Icon(Icons.remove),
            onPressed: () =>
                pokemonNotifierManager.notifier.delete(const Pokemon().id)),
        const SizedBox(width: 16),
        FloatingActionButton(
            heroTag: "buttonRefresh",
            child: const Icon(Icons.refresh),
            onPressed: () => pokemonNotifierManager.notifier.refresh()),
      ],
    );
  }
}
