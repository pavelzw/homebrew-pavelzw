cask "upscayl" do
  version "2.9.9"
  sha256 "21cab689f557c5ddaee36ee9f6bf22bf042072cbb4e3c354e486e2ba2b86df3a"

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
