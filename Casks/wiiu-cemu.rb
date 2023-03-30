# this formula cannot be named cemu because it conflicts with the CEmu emulator for TI calculators
# https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap#naming

cask "wiiu-cemu" do
  version "2.0-31"
  sha256 "ad534452fda3887a3e335ba141f045908acb2ba20a41cd8877573e4176130584"

  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg",
      verified: "github.com/cemu-project/Cemu/"
  name "Cemu"
  desc "Wii U emulator"
  homepage "https://cemu.info/"

  depends_on macos: ">= :monterey"

  app "Cemu.app"
end
