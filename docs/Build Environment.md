# Build Environment

The project uses a [Nix flake](../flake.nix) to provide a fully reproducible Android dev shell — no global installs of Java, the Android SDK, or Gradle are required.

## Entering the shell

```sh
nix develop
```

Or, with [direnv](https://direnv.net/) installed, just `cd` into the repo — `.envrc` runs `use flake` automatically.

## What's provided

- JDK 17 (`JAVA_HOME` set automatically)
- Android SDK via `pkgs.androidenv` (`ANDROID_SDK_ROOT` / `ANDROID_HOME` set automatically)
  - platform-tools, build-tools 35.0.0, platforms 34 & 35, cmdline-tools
- Gradle 8.14.6

## Building

```sh
./gradlew assembleDebug
```

The Gradle wrapper (`./gradlew`) was generated to match the Nix-provided Gradle version, so builds are consistent whether invoked via the wrapper or the Nix-provided `gradle` binary.

## Notes

- `compileSdk`/`buildToolsVersion` are pinned explicitly in `app/build.gradle.kts` to `35` / `35.0.0` — AGP's default build-tools pick otherwise tries to auto-download a version into the (read-only) Nix store and fails.
- Update `flake.nix`'s `platformVersions` / `buildToolsVersions` together with the Gradle module's `compileSdk`/`buildToolsVersion` when bumping SDK levels.
