import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifiers/pokemon_notifier.dart';
import '../../models/data/pokemon.dart';

class ActionsFabsRow extends ConsumerWidget {
  const ActionsFabsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
