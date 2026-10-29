cask "bluetooth-battery-bar" do
  version "1.0.0"
  sha256 "fa1c1e2e18cce407923e2607f3a9a60825559b841966383fe8fb2cbe743e3c48"

  url "https://github.com/enso-works/bluetooth-battery-bar/releases/download/v#{version}/BluetoothBatteryBar-#{version}.dmg"
  name "Bluetooth Battery Bar"
  desc "Menu bar battery levels for Bluetooth keyboards, mice and controllers"
  homepage "https://github.com/enso-works/bluetooth-battery-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Bluetooth Battery Bar.app"

  uninstall quit: "works.enso.BluetoothBatteryBar"

  zap trash: "~/Library/Preferences/works.enso.BluetoothBatteryBar.plist"
end
