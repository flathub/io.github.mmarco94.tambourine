# Tambourine Music Player

Official Flathub definitions for https://github.com/MMarco94/tambourine-music-player

## Prepare a release

1. Update `io.github.mmarco94.tambourine.yml` with the new JAR and sha, taken from https://github.com/MMarco94/tambourine-music-player/releases
2. Update `io.github.mmarco94.tambourine.metainfo.xml` with the changelog for the new release
3. Run `generate-classlist.sh`. Tamburine will open: start a song and close it
4. Commit the changes (including `tambourine.classlist`), open a PR and merge it

## Building locally

Validate the metadata files:
```
flatpak run org.flathub.flatpak-external-data-checker io.github.mmarco94.tambourine.yml
flatpak run --command=flatpak-builder-lint org.flatpak.Builder --exceptions manifest io.github.mmarco94.tambourine.yml
flatpak run --env=G_DEBUG=fatal-criticals --command=appstream-util org.flatpak.Builder validate io.github.mmarco94.tambourine.metainfo.xml
```

Build the app:
```
flatpak-builder --repo=repo --force-clean build-dir io.github.mmarco94.tambourine.yml
```

Add it to your local Flatpak installation:
```
flatpak build-update-repo repo
```

Install it:
```
flatpak-builder --user --install --force-clean build-dir io.github.mmarco94.tambourine.yml
```

