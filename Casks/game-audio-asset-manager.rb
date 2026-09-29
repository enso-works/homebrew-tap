cask "game-audio-asset-manager" do
  version "0.1.0"
  sha256 "bf832f2a099ce8677ad2d2f2a00534b77db54c7e9f2d97cbc9b441f6e4d1419b"

  url "https://github.com/enso-works/game-audio-asset-manager/releases/download/v#{version}/GameAudioAssetManager-#{version}-macos.dmg"
  name "Game Audio Asset Manager"
  desc "Download, edit, loop and export game audio for Godot and three.js"
  homepage "https://github.com/enso-works/game-audio-asset-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on formula: ["ffmpeg", "yt-dlp"]
  depends_on macos: :sonoma

  app "Game Audio Asset Manager.app"

  uninstall quit: "com.bavrk.gameaudioassetmanager"

  # Your sound library (~/Music/Game Audio Asset Manager) is never removed.
  zap trash: [
    "~/Library/Caches/com.bavrk.gameaudioassetmanager",
    "~/Library/HTTPStorages/com.bavrk.gameaudioassetmanager",
    "~/Library/Preferences/com.bavrk.gameaudioassetmanager.plist",
    "~/Library/Saved Application State/com.bavrk.gameaudioassetmanager.savedState",
  ]
end
