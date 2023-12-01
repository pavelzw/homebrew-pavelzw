cask "upscayl" do
  version "2.9.4"
  sha256 "7dac5175d5b211e332b3a30fc95a61f0e8c59def817c3bdfbee3e14aaea52091"

  url "https://github.com/upscayl/upscayl/releases/download/v#{version}/upscayl-#{version}-mac.dmg",
      verified: "github.com/upscayl/upscayl/"
  name "Upscayl"
  desc "Linux-first FOSS AI image upscaler"
  homepage "https://www.upscayl.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Upscayl.app"

  zap trash: [
    "~/Library/Application Support/Upscayl",
    "~/Library/Preferences/org.upscayl.app.plist",
    "~/Library/Saved Application State/org.upscayl.app.savedState",
  ]
end
