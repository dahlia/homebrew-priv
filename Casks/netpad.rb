cask "netpad" do
  arch arm: "arm64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "78c2ef213d5c746ca1ac345f2144fd691806a5b0e1991f0cf991d65b15f91e24",
         intel: "40e90257bd28a034fe55f044c532c225af07d0a281dfe98503bfa168d76fa445"

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
