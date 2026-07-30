cask "snack" do
  # version 과 sha256 은 릴리스마다 소스 레포의 scripts/release.sh 가 gh API 로
  # 갈아끼운다(`make release`). 손으로 고치지 않는다 — 손으로 고치면 릴리스에
  # 올라간 DMG 의 해시와 어긋나 `brew install` 이 체크섬 불일치로 멈춘다.
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/saroby/homebrew-snack/releases/download/v#{version}/Snack-#{version}.dmg",
      verified: "github.com/saroby/homebrew-snack/"
  name "Snack"
  desc "Session-scoped repo cockpit — clones on open, cleans up on close"
  homepage "https://github.com/saroby/homebrew-snack"

  # `brew livecheck snack` 이 최신 릴리스 태그를 보고 이 cask 가 뒤처졌는지 알려준다.
  # 릴리스가 이 탭 레포에 있으므로 url 을 그대로 재사용한다.
  livecheck do
    url :url
    strategy :github_latest
  end

  # Snack 은 스스로 교체하지 않는다. brew 가 유일한 업데이트 경로다.
  # 앱 안의 배너는 새 버전을 "알릴" 뿐이고, 실제 교체는 `brew upgrade` 가 한다.
  # 훗날 Sparkle 을 붙이면 여기에 `auto_updates true` 를 넣어야 한다 —
  # 없으면 brew 가 Sparkle 이 갈아끼운 앱을 구버전으로 되돌린다.

  depends_on macos: :sonoma

  app "Snack.app"

  zap trash: [
    "~/Library/Application Support/Snack",
    "~/Library/Caches/com.axi.Snack",
    "~/Library/Preferences/com.axi.Snack.plist",
    "~/Library/Saved Application State/com.axi.Snack.savedState",
  ]
end
