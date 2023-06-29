cask "ryujinx-ava" do
  version "1.1.942"
  sha256 "083f358c2b005abb9e7eded6b493ea577ce5ff10f3d6a80bddb04f912d48feaa"

  url "https://github.com/Ryujinx/release-channel-master/releases/download/#{version}/test-ava-ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Ryujinx/release-channel-master/"
  name "Ryujinx"
  desc "Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  conflicts_with cask: "p-linnane/cask-unsigned/ryujinx"
  depends_on macos: ">= :big_sur"

  app "Ryujinx.app"

  uninstall quit: "org.ryujinx.Ryujinx"

  zap trash: [
    "~/.config/Ryujinx",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
