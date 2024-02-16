cask "netpad" do
  arch arm: "arm64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "31d461e4ab9b6ae57d7b2ba231ab60e648ee7574eaa8fae3c2b03a05a07ae54b",
         intel: "0a82280a471ab9f04d66458f8970ca582017daaeb33cafed8b4d693f240beff9"

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
    if OS.send(:mac?) && Hardware::CPU.send(:arm?)
      system "xattr", "-cr", "#{appdir}/NetPad.app"
    end
  end

  zap trash: [
    "~/Documents/NetPad",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.netpad.app.sfl3",
    "~/Library/Application Support/netpad",
    "~/Library/Preferences/com.netpad.app.plist",
    "~/Library/Saved Application State/com.netpad.app.savedState",
  ]
end
