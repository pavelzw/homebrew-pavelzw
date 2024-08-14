cask "wiiu-cemu" do
  # this formula cannot be named cemu because it conflicts with the CEmu emulator for TI calculators
  # https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap#naming
  version "2.0-93"
  sha256 "c8a7b02819efdae975cb62169a67ec4aa8e7a4616eaa6c50fd1589be77b66ad7"

  url "https://github.com/cemu-project/Cemu/releases/download/v#{version}/cemu-#{version}-macos-12-x64.dmg",
      verified: "github.com/cemu-project/Cemu/"
  name "Cemu"
  desc "Wii U emulator"
  homepage "https://cemu.info/"

  depends_on macos: ">= :monterey"

  app "Cemu.app"

  caveats do
    requires_rosetta
  end
end
