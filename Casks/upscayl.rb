cask "upscayl" do
  version "2.5.5"
  sha256 "aa0e17ce93bff594191e07fa53d4ee2b0977973d8cb589f7363d78ef9bcd0593"

  url "https://github.com/upscayl/upscayl/releases/download/v#{version}/upscayl-#{version}-mac.dmg",
      verified: "github.com/upscayl/upscayl/"
  name "upscayl"
  desc "Open Source AI Image Upscaler built with Linux-First philosophy"
  homepage "https://upscayl.github.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Upscayl.app"

  zap trash: [
    "~/Library/Application Support/Upscayl",
    "~/Library/Preferences/org.upscayl.app.plist",
    "~/Library/Saved Applicatrtjion State/org.upscayl.app.savedState",
  ]
end
