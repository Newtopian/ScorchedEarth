# Decisions

Running log of notable project decisions.

## 2026-11-10 — Initial scaffolding

- **Platform**: Android, starting as a self-contained app (`dev.daigno.scorched`).
- **UI toolkit**: Jetpack Compose.
- **Dev environment**: Nix flake devShell (JDK 17 + Android SDK + Gradle), no global installs. See [[Build Environment]].
- **Docs**: plain Markdown under `docs/`, structured as an Obsidian vault.
- **License**: GPLv3.
- **Hosting**: public repo at [github.com/Newtopian/ScorchedEarth](https://github.com/Newtopian/ScorchedEarth).
