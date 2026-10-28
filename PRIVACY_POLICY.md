# Privacy Policy for Octave

**Last Updated:** October 27, 2026

Octave ("the app") is a free, open-source client for self-hosted music servers (Navidrome and other Subsonic servers). It is developed by Charles Duchaussoy for a private server shared with family and friends.

Octave has **no analytics, no advertising and no tracking**. It talks to the music server you configure, and to a few public services listed below, only when needed.

---

## 1. No Analytics, No Tracking
- Octave does not use analytics frameworks, advertising SDKs, crash trackers or telemetry tools.
- Octave does not collect advertising identifiers (such as GAID) or build a device fingerprint.
- No data is sent to the developer outside of your music server and the problem reports you choose to send (section 3).

## 2. Your Music Server
Octave connects directly to the server address you enter. Like any Subsonic app, it sends that server what it needs to play music, plus:
- **Playback reports**: the song playing, its position and whether it plays or is paused, so the server can show what is playing and count listens.
- **Play queue**: your queue and position, so you can pick it up on another device.
- **Likes, ratings and playlists** you create or change.

This data stays on that server, under the control of its owner. On our private server, the owner is the developer.

Your password is stored on your device in the system's secure storage when there is one (Android Keystore, Windows DPAPI, the Linux keyring). The app sends the server a salted token instead of the password, unless you turn on the legacy sign-in that some old servers need.

## 3. Problem Reports
When you send a report from **Settings, Report a problem**, Octave sends it to your music server:
- the kind of report (a problem or an idea) and the message you write;
- if you leave **Include technical details** on: the app version, the system and its version, the song playing, and the app's recent log. Before sending, the log is cleaned: the server address, the account name, passwords and tokens are removed.

On our server, reports are shown only to the server's owner, on its private management page. If the server cannot receive reports, Octave opens a GitHub issue page filled with your message (without the log) instead; nothing is sent until you submit it on GitHub, and GitHub issues are public.

## 4. On-Device Data
- Mixes and recommendations computed by the app, listening statistics and the year in review are stored on your device.
- Music downloaded for offline listening and cached covers stay in the app's storage.
- The recent app log used for problem reports is kept in memory only and is never written to disk.

## 5. Speakers (Google Cast, UPnP / DLNA)
When you play on a speaker or TV, Octave sends it the address of the song on your server over your local network. The speaker then downloads the music from the server itself.

## 6. Public Services
- **LRCLIB (synced lyrics)**: when your server has no lyrics for a song, Octave asks the public LRCLIB service with the song title and artist name only.
- **GitHub (updates)**: Octave checks the latest release of its GitHub repository and downloads the update file when you accept it. GitHub receives the usual technical information of any web request, such as the IP address.

## 7. Your Control
- Clearing the app's data in the system settings, or uninstalling the app, deletes everything it stored on your device: settings, server profiles, downloads and caches.
- Data on your music server (likes, playlists, play history, reports) is managed by the server's owner: ask them to delete it.

## 8. Open Source
Octave is open source under the CC BY-NC-SA 4.0 license. The source code is public: **[github.com/CharlesDuchaussoy/Octave](https://github.com/CharlesDuchaussoy/Octave)**

Octave is a modified version of [Musly](https://github.com/dddevid/Musly) by dddevid, distributed under the same license.

---

## Contact
Questions about this policy: use **Report a problem** in the app, or open an issue on [GitHub](https://github.com/CharlesDuchaussoy/Octave/issues).
