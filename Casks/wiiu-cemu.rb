cask "wiiu-cemu" do
  # this formula cannot be named cemu because it conflicts with the CEmu emulator for TI calculators
  # https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap#naming
  version "2.0-59"
  sha256 "7a63542c475fa8806c786c185cbc3c7061c62aa370ccf3f7469f27c2515bb852"

  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg",
      verified: "github.com/cemu-project/Cemu/"
  name "Cemu"
  desc "Wii U emulator"
  homepage "https://cemu.info/"

  depends_on macos: ">= :monterey"

  app "Cemu.app"
end
