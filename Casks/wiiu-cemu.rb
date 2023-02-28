# this formula cannot be named cemu because it conflicts with the CEmu emulator for TI calculators
# https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap#naming

cask "wiiu-cemu" do
  version "2.0-28"
  sha256 "396b924fe3615346f739ee98e796a23fd7817698cd2c59b188a01d747a600e0d"

  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg",
      verified: "github.com/cemu-project/Cemu/"
  name "Cemu"
  desc "Wii U emulator"
  homepage "https://cemu.info/"

  depends_on macos: ">= :monterey"

  app "Cemu.app"
end
