cask "netpad" do
  arch arm: "arm64", intel: "x64"

  version "0.7.2"
  sha256 arm:   "db2514c12f0635c9d5793359199184841ad7ac9fd929ad2a3d58b33de88a5ea5",
         intel: "c3e6e0a794d811377d684981b6b1b8b54378544538b104a1eef738c6294dcd92"

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
