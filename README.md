# Pedalscape

Pedalscape is an indoor cycling game for smart trainers. You ride real routes on a 3D road or
follow a training plan, your trainer sets the resistance, and every ride is saved for Strava or
intervals.icu. Everything runs on your own Mac; nothing is uploaded unless you ask for it.

This page explains how to install it. Installing takes about ten minutes the first time, and
you only type (or paste) a handful of commands. You do not need to understand them.

## What you need

- A Mac with an Apple chip (M1, M2, M3, M4 …; from 2020 on). Older Intel Macs are not supported.
- macOS 12 Monterey or newer.
- A smart trainer with Bluetooth (for example a Wahoo KICKR or a Tacx), and optionally a heart
  rate strap. An ANT+ USB stick works too.

## Step 1: open the Terminal

The Terminal is an app that comes with every Mac. Press `⌘` and the space bar together, type
`Terminal`, and press Return. A window with a blinking cursor appears. Everything below is
pasted into that window, one block at a time, followed by Return.

## Step 2: install Homebrew

Homebrew is a free tool that installs and updates apps from the Terminal. Pedalscape uses it so
that updates are one command. Paste this line and press Return:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- It asks for your Mac password. Type it and press Return. **Nothing appears while you type,
  that is normal.**
- It may ask to install "Command Line Tools"; agree. The whole step takes five to ten minutes.
- At the end it prints **"Next steps"** with two lines that start with `echo` and `eval`.
  Copy those two lines exactly as printed, paste them into the Terminal and press Return.
  Without them the Terminal does not know where Homebrew is.

Check that it worked by pasting:

```sh
brew --version
```

It should answer with a version number. If it says `command not found: brew`, go back to the
two "Next steps" lines.

## Step 3: install Pedalscape

Paste the following four commands, one at a time, pressing Return after each and waiting for
it to finish before pasting the next.

1. Tell Homebrew where Pedalscape lives:

   ```sh
   brew tap frederick-krauss/pedalscape
   ```

2. Tell Homebrew that you trust this source (Homebrew asks this once for every app that is
   not in its own catalogue):

   ```sh
   brew trust --cask frederick-krauss/pedalscape/pedalscape
   ```

3. Download and install Pedalscape (about 100 MB, so it takes a moment):

   ```sh
   brew install --cask pedalscape
   ```

4. Allow macOS to open it. Pedalscape is not registered with Apple's notary service yet, so
   macOS would otherwise refuse to start it:

   ```sh
   xattr -dr com.apple.quarantine /Applications/Pedalscape.app
   ```

If you forget step 4, macOS shows "Pedalscape cannot be opened". Either paste the command, or
open System Settings › Privacy & Security, scroll down and click **Open Anyway**.

## Step 4: start riding

Pedalscape is now in your Applications folder. Open it like any other app (`⌘` + space, type
`Pedalscape`, Return).

- The first time, macOS asks whether Pedalscape may use Bluetooth. Click **Allow**; that is
  how it talks to your trainer.
- Wake your trainer up (pedal a few strokes) and close other training apps, because a trainer
  talks to one app at a time.
- In Pedalscape go to **Settings › Devices**, choose your trainer under **Trainer**, and your
  heart rate strap under **Heart rate** if you have one.
- Back on the Home screen pick a route or a workout and ride.

## Updating

When a new version is out, paste these three commands:

```sh
brew update
brew upgrade --cask pedalscape
xattr -dr com.apple.quarantine /Applications/Pedalscape.app
```

Your settings, your intervals.icu key and your recorded rides are kept; they live outside the
app.

## Uninstalling

```sh
brew uninstall --cask pedalscape          # keeps settings and rides
brew uninstall --zap --cask pedalscape    # also removes settings and the game's own data
```

Rides saved to a folder you chose under Settings › Rides folder are never removed.

## If something does not work

- **`command not found: brew`**: run the two "Next steps" lines from the Homebrew installer
  again, or close and reopen the Terminal.
- **"Pedalscape cannot be opened"**: step 4 above.
- **No trainer in the list**: wake the trainer, close other apps that use it (the Wahoo app,
  Zwift), and check that Bluetooth is on in System Settings.
- **The app opens but shows only a bar at the top**: your Mac is still running an old version;
  do the update steps.

## About this repository

The source code of Pedalscape lives in a private repository. This public one only holds the
release files (under **Releases**) and the Homebrew cask in `Casks/pedalscape.rb`.
