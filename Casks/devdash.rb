cask "devdash" do
  version "0.4.0"
  sha256 "44bef577b47f361edc8fd5988d925ddacf7fe7523d2e0879a2b9faf17c1da2cc"

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
