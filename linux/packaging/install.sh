#!/bin/sh
# Installs Octave for the current user, in ~/.local/share/octave, with an
# entry in the applications menu. Run it again from a newer archive to
# update. "./install.sh --uninstall" removes Octave (not its settings).
set -eu

here=$(cd "$(dirname "$0")" && pwd)
data="${XDG_DATA_HOME:-$HOME/.local/share}"
app="$data/octave"
desktop="$data/applications/octave.desktop"
icon="$data/icons/hicolor/scalable/apps/octave.svg"

if [ "${1:-}" = "--uninstall" ]; then
  rm -rf "$app" "$desktop" "$icon"
  echo "Octave est désinstallé."
  exit 0
fi

if [ "$here" = "$app" ]; then
  echo "Lance ce script depuis le dossier de l'archive, pas depuis $app."
  exit 1
fi

rm -rf "$app"
mkdir -p "$app" "$(dirname "$desktop")" "$(dirname "$icon")"
cp -r "$here/." "$app/"
cp "$here/octave.svg" "$icon"
sed "s|^Exec=.*|Exec=\"$app/octave\" %U|" "$here/octave.desktop" > "$desktop"
update-desktop-database "$(dirname "$desktop")" 2>/dev/null || true

echo "Octave est installé : tu le trouves dans le menu des applications."
if ! ldconfig -p 2>/dev/null | grep -q libmpv; then
  echo "Il manque mpv pour lire la musique : installe le paquet mpv (ou mpv-libs)."
fi
