# this formula cannot be named cemu because it conflicts with the CEmu emulator for TI calculators
# https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap#naming

cask "wiiu-cemu" do
  version "2.0-36"
  sha256 "4db5bce074688f2c5706c466bc93b0b51f99f1cd967aa2158834d2cb1fad6d64"

  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg",
      verified: "github.com/cemu-project/Cemu/"
  name "Cemu"
  desc "Wii U emulator"
  homepage "https://cemu.info/"

  depends_on macos: ">= :monterey"

  app "Cemu.app"
end
