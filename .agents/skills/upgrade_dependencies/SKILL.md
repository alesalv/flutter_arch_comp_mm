---
name: upgrade_dependencies
description: Automates the process of upgrading the Flutter SDK, Minimal package (minimal_mvn) to a new version, and upgrading all other stable dependencies in this repository.
---

# Upgrade Dependencies Skill

This skill automates upgrading Flutter SDK, Minimal, and all other stable dependencies in this repository with clean atomic commits and PR creation.

## Prerequisites

- `fvm` is installed and available.
- `gh` CLI is installed and authenticated.
- You are on the `develop` branch of the `flutter_arch_comp_mm` repository.

## Steps

### Step 1 — Parse parameters and prepare branch

1. Parse `{FLUTTER_VERSION}` (e.g. `3.44.4`) and `{MINIMAL_VERSION}` (e.g. `3.0.0`) from the user's request.
2. Check if the working tree is clean:
   ```bash
   git status --porcelain
   ```
   If there are uncommitted changes, **STOP** and ask the user to commit or stash them first.
3. Switch to the `develop` branch and pull latest changes:
   ```bash
   git checkout develop
   git pull origin develop
   ```
4. Create and checkout the upgrade branch:
   ```bash
   git checkout -b update-flutter-{FLUTTER_VERSION}-minimal-{MINIMAL_VERSION}
   ```

### Step 2 — Upgrade Flutter SDK

1. Update the Flutter SDK version in `.fvmrc`:
   ```json
   {
     "flutter": "{FLUTTER_VERSION}"
   }
   ```
2. Install the new Flutter SDK version:
   ```bash
   fvm install
   ```
3. Update the VS Code workspace setting in `.vscode/settings.json`:
   * Set `"dart.flutterSdkPath"` to `".fvm/versions/{FLUTTER_VERSION}"`.
4. Stage the FVM-related changes and commit:
   ```bash
   git add .fvmrc .vscode/settings.json pubspec.lock
   git commit -m "chore: update Flutter dependency to {FLUTTER_VERSION}"
   ```

### Step 3 — Upgrade packages & generate models

1. Upgrade dependencies in `pubspec.yaml`:
   * Set `minimal_mvn` constraint to `^{MINIMAL_VERSION}`.
   * Update the `environment.sdk` constraint if needed (e.g., set to `">=3.10.0 <4.0.0"` or higher as required by newer Flutter/Dart/dependencies versions).
2. Run `fvm flutter pub upgrade --major-versions` to resolve and upgrade dependencies constraints.
3. Update all other upgraded dependency constraints in `pubspec.yaml` to match their latest resolved stable versions.
4. Run `fvm flutter pub get` to lock all dependencies in `pubspec.lock`.
5. Run the model generation script:
   ```bash
   ./scripts/generate_models.sh
   ```
6. Run the unit and widget tests to verify correctness:
   ```bash
   fvm flutter test
   ```
7. Check git status to ensure there are no unintended file changes. Only the modified `pubspec.yaml`, `pubspec.lock`, and generated files (e.g., `.g.dart`, `.mapper.dart`) should be staged.
8. Stage and commit:
   ```bash
   git add pubspec.yaml pubspec.lock lib/src/pokemon/models/data/pokemon_api_model.g.dart lib/src/pokemon/views/ui_states/pokemon_details_ui_state.mapper.dart lib/src/pokemon/views/ui_states/pokemon_ui_state.mapper.dart macos/Flutter/GeneratedPluginRegistrant.swift
   git commit -m "chore: update Minimal to {MINIMAL_VERSION} and upgrade other dependencies to latest stable"
   ```

### Step 4 — Request user manual testing

1. Inform the user that the automated upgrades and tests have finished.
2. Ask the user to run the application and perform any manual testing.
3. **STOP** and wait for the user to confirm that manual testing is complete and they are ready to proceed with creating the Pull Request.

### Step 5 — Create Pull Request

1. Push the branch to origin:
   ```bash
   git push origin update-flutter-{FLUTTER_VERSION}-minimal-{MINIMAL_VERSION}
   ```
2. **Talk to the user before executing the PR creation.** Explain that you can create the PR using the `gh` CLI and ask for confirmation to proceed.
3. Once the user approves, run:
   ```bash
   gh pr create --base develop --head update-flutter-{FLUTTER_VERSION}-minimal-{MINIMAL_VERSION} --title "chore: upgrade to Flutter {FLUTTER_VERSION} and Minimal {MINIMAL_VERSION}" --body "Automated dependency upgrade to Flutter {FLUTTER_VERSION} and Minimal {MINIMAL_VERSION}."
   ```

## Important Rules

- **Use atomic commits** at each step as outlined.
- **Never push directly to `develop`**; always use the `update-flutter-*` branch and open a PR.
- **Always confirm with the user** before running the `gh pr create` command.
- **Always use `fvm flutter` and `fvm dart`** instead of bare `flutter` and `dart` commands.
