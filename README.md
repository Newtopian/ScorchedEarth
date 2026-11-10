# Scorched Earth

An Android application. Project is in early scaffolding — game design and implementation TBD.

## Getting started

This repo uses a [Nix flake](flake.nix) devShell so building needs no global Java/Android SDK/Gradle installs.

```sh
nix develop
./gradlew assembleDebug
```

With [direnv](https://direnv.net/), `.envrc` loads the shell automatically on `cd`.

See [docs/Build Environment.md](docs/Build%20Environment.md) for details.

## Documentation

Project docs live under [`docs/`](docs/), written as plain Markdown and structured as an [Obsidian](https://obsidian.md/) vault — open the `docs/` folder directly in Obsidian to browse with backlinks/graph view, or just read the `.md` files in any editor. Start at [docs/Home.md](docs/Home.md).

## License

GPLv3 — see [LICENSE](LICENSE).
