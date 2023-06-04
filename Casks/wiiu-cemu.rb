# this formula cannot be named cemu because it conflicts with the CEmu emulator for TI calculators
# https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap#naming

cask "wiiu-cemu" do
  version "2.0-39"
  sha256 "353bfa8508b6362063d9d6fe898b558bb739efd20ae7f4a50853eb6ec2fdf89a"

  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg",
      verified: "github.com/cemu-project/Cemu/"
  name "Cemu"
  desc "Wii U emulator"
  homepage "https://cemu.info/"

  depends_on macos: ">= :monterey"

  app "Cemu.app"
end
