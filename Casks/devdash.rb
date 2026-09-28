cask "devdash" do
  version "0.2.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/enso-works/devdash/releases/download/v#{version}/DevDash-#{version}-macos.dmg"
  name "DevDash"
  desc "Menu bar dashboard for dev servers, Docker containers and Claude Code"
  homepage "https://github.com/enso-works/devdash"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "DevDash.app"
  binary "#{appdir}/DevDash.app/Contents/Resources/bin/devdash"

  uninstall quit: "works.enso.devdash.bar"

  zap trash: [
    "~/.config/devdash",
    "~/.local/share/devdash",
    "~/Library/Caches/works.enso.devdash.bar",
    "~/Library/HTTPStorages/works.enso.devdash.bar",
    "~/Library/Preferences/works.enso.devdash.bar.plist",
  ]
end
