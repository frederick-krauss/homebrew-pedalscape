cask "pedalscape" do
  version "0.2.1"
  sha256 "26d336abd85a3964f875f65235e5ccff5d8a47f8b794e4442e5906a203711083"

  url "https://github.com/frederick-krauss/homebrew-pedalscape/releases/download/v#{version}/Pedalscape-#{version}-macOS.zip"
  name "Pedalscape"
  desc "Local-first indoor cycling simulator for smart trainers"
  homepage "https://github.com/frederick-krauss/homebrew-pedalscape"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Pedalscape.app"

  zap trash: "~/Library/Application Support/Godot/app_userdata/Pedalscape"

  caveats <<~EOS
    Pedalscape is not notarised by Apple yet. Before the first start (and after every
    upgrade) allow it once:
      xattr -dr com.apple.quarantine /Applications/Pedalscape.app
    or open it, then System Settings > Privacy & Security > Open Anyway.
    Allow Bluetooth when macOS asks; the sensor bridge needs it.
  EOS
end
