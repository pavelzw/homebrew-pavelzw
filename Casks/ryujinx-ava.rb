cask "ryujinx-ava" do
  version "1.1.1217"
  sha256 "5c71f8f2e46c4112799689b1607e60ee14ae93ee0fd7457c96cdfd9dd400a76a"

  url "https://github.com/Ryujinx/release-channel-master/releases/download/#{version}/test-ava-ryujinx-#{version}-macos_universal.app.tar.gz",
      verified: "github.com/Ryujinx/release-channel-master/"
  name "Ryujinx"
  desc "Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  depends_on macos: ">= :big_sur"

  app "Ryujinx.app"

  uninstall quit: "org.ryujinx.Ryujinx"

  zap trash: [
    "~/.config/Ryujinx",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
