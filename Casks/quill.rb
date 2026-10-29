cask "quill" do
  version "0.1.0"
  sha256 "d5bed7149ea0b416043bad79d5db4fe5752306506719a36f87b78252e10458e1"

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
