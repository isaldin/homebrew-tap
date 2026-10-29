cask "quill" do
  version "0.1.1"
  sha256 "880a739ea7d860f4feb8e33ddeb6e7f1d65a30180b3811f22e67a9cb1a318638"

  url "https://github.com/isaldin/quill/releases/download/v#{version}/Quill-#{version}.zip"
  name "Quill"
  desc "Menu bar dictation with LLM post-processing via OpenRouter"
  homepage "https://github.com/isaldin/quill"

  depends_on macos: :sequoia

  app "Quill.app"

  zap trash: [
    "~/Library/Application Support/Quill",
    "~/Library/Preferences/dev.saldin.quill.plist",
  ]

  caveats <<~EOS
    Quill is not notarized, so macOS blocks the first launch. Run once:
      xattr -dr com.apple.quarantine #{appdir}/Quill.app
  EOS
end
