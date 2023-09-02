cask "upscayl" do
  version "2.7.5"
  sha256 "3645aa9f28cf91e03afd8d05f2c307c50b0adced8a7650a2dd74ba4799bb2f71"

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
