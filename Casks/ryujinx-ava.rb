cask "ryujinx-ava" do
  version "1.1.970"
  sha256 "ebb8ee9298eca3a94dbb2400450c472358489ad428d56ba69be75c0ca39df191"

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
