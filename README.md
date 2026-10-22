# Pedalscape for Homebrew

Releases of Pedalscape, a local-first indoor cycling simulator for smart trainers, and the
Homebrew cask that installs them. The source code lives in a private repository; this one
only holds the release zips (under Releases) and `Casks/pedalscape.rb`.

## Install

Needs a Mac with Apple Silicon and Homebrew (https://brew.sh).

```sh
brew tap frederick-krauss/pedalscape
brew trust --cask frederick-krauss/pedalscape/pedalscape
brew install --cask pedalscape
xattr -dr com.apple.quarantine /Applications/Pedalscape.app
```

`brew trust` is needed once: Homebrew only loads casks from taps outside its own
repositories after you trust them.

The last line is needed because the app is not notarised by Apple yet: without it macOS
refuses to open it. Instead you can open the app once, then choose System Settings >
Privacy & Security > Open Anyway. Allow Bluetooth when macOS asks.

## Update

```sh
brew update
brew upgrade --cask pedalscape
xattr -dr com.apple.quarantine /Applications/Pedalscape.app
```

Settings, the intervals.icu key and recorded rides are kept: they live outside the app.

## Uninstall

```sh
brew uninstall --cask pedalscape          # keeps settings and rides
brew uninstall --zap --cask pedalscape    # also removes settings and the game's own data
```

Rides saved to a folder you chose under Settings › Rides folder are never removed.
