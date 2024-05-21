cask "netpad" do
  arch arm: "arm64", intel: "x64"

  version "0.7.1"
  sha256 arm:   "077f15ca3bbddeb4548a352f4cff765b3858bd4cfbfca8d5bf9b8fe86e9488b4",
         intel: "811b8ca539588c5e8b5baa0f0797438e3e7382e2c87314c7e1b85179648cb7aa"

  url "https://github.com/tareqimbasher/NetPad/releases/download/v#{version}/netpad-#{version}-mac-#{arch}.zip"
  name "netpad"
  desc "Cross-platform C# editor and playground"
  homepage "https://github.com/tareqimbasher/NetPad"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on cask: "dotnet-sdk"

  app "NetPad.app"

  postflight do
    system "xattr", "-cr", "#{appdir}/NetPad.app" if OS.send(:mac?) && Hardware::CPU.send(:arm?)
  end

  zap trash: [
    "~/Documents/NetPad",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.netpad.app.sfl*",
    "~/Library/Application Support/netpad",
    "~/Library/Preferences/com.netpad.app.plist",
    "~/Library/Saved Application State/com.netpad.app.savedState",
  ]
end
