cask "game-audio-asset-manager" do
  version "0.1.0"
  sha256 "fdeebc58133488645d236a71bdccdec0886b5dbaf531d77d6e84068c38b19b04"

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
