# this formula cannot be named cemu because it conflicts with the CEmu emulator for TI calculators
# https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap#naming

cask "wiiu-cemu" do
  version "2.0-32"
  sha256 "c9ba57d9989dd83647ac66c6af1a0731ce5a2d91c7a405f2f99040811fa6fe47"

  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg",
      verified: "github.com/cemu-project/Cemu/"
  name "Cemu"
  desc "Wii U emulator"
  homepage "https://cemu.info/"

  depends_on macos: ">= :monterey"

  app "Cemu.app"
end
