# Privacy Policy for Octave

**Last Updated:** October 25, 2026

Octave ("we", "our", or "the app") is a free, open-source client for self-hosted music servers (Subsonic, Navidrome, Jellyfin) and local audio playback. We believe privacy is a fundamental human right.

Octave is built on a **privacy-first, zero-telemetry architecture**.

---

## 1. Zero Data Collection & No Analytics
- Octave does **not** collect, store, transmit, or sell any personal information.
- We do **not** use third-party analytics frameworks, advertising SDKs, crash trackers, or telemetry tools.
- We do **not** collect advertising identifiers (such as IDFA or GAID), device fingerprinting information, or IP addresses.
- Your listening habits, favorite songs, play counts, and search queries are never transmitted to us or any analytics service.

## 2. Direct Client-to-Server Communication
- Octave connects directly and exclusively to the music server URLs (Subsonic, Navidrome, Jellyfin) that you explicitly configure.
- No audio streams, metadata requests, or authentication packets ever pass through intermediary Octave servers.
- Your server credentials (usernames, passwords, API tokens, and certificate keys) are encrypted on your device using hardware-backed secure storage (Android Keystore, Apple Keychain, Windows DPAPI). They never leave your device.

## 3. On-Device Intelligence & Local Storage
- **Smart Mixes & Recommendations**: Music taste learning, affinity scoring, and algorithmic mixes ("Made For You", "Listen Again", "Top Hits") are computed and stored strictly on-device in a local SQLite database.
- **Octave Wrapped & Milestone Tracking**: Your annual playback statistics and listening milestones (e.g. 50-song milestones) are calculated 100% locally without external analytics.
- **Offline Downloads**: Music files downloaded for offline playback are stored encrypted/locally in your device's app storage directory.

## 4. Octave Connect (LAN Peer-to-Peer Remote Control) (Temporarely Unavailable)
- **Local Network Only**: Octave Connect utilizes zero-configuration local network discovery (UDP beacon on port 43882 and embedded HTTP/WebSocket server on port 43883) to discover and transfer playback across devices on the same Wi-Fi subnet. <!-- Listening Party (BeatSync) temporarily disabled -->
- **Zero Cloud / No External Relay**: All communication is strictly peer-to-peer within your local area network (LAN). No device identifiers, playback queues, or IP addresses are ever sent to any external server.
- **Complete User Control**: Octave Connect can be completely disabled at any time in **Settings → Octave Connect & Devices**, which immediately shuts down all local server sockets, beacon listeners, and background timers.

## 5. Wireless Speakers & Casting (Cast & UPnP / DLNA)
- When using Google Cast or UPnP/DLNA, audio playback commands and media stream URLs are sent directly across your local network to your selected smart speakers, TVs, or media renderers without third-party tracking.

## 6. Optional Third-Party Services
When enabled, Octave interacts with public services strictly on-demand:
- **LRCLIB (Synced Lyrics)**: If lyrics fallback is enabled in playback settings, Octave queries the public LRCLIB API strictly using the song title and artist name to retrieve time-synced lyrics. No personal identifiers or account details are sent.
- **GitHub (Updates and Translations)**: Octave checks the latest release of its GitHub repository to offer updates, downloads the update file from GitHub when you accept it, and can download translation files from the same repository. These requests contain no personal data; GitHub receives the usual technical information of any web request (such as the IP address).
- **Discord Rich Presence**: If enabled on desktop (Windows/macOS/Linux), playback metadata (track title, artist, elapsed/remaining time) is transmitted locally via Discord IPC to update your Discord status.

## 7. User Control & Data Deletion
- You have absolute control over your local data.
- Clearing the app's data in system settings or uninstalling the app permanently deletes all stored preferences, server configurations, offline audio files, and cached metadata.

## 8. Open Source Transparency
Octave is 100% open source under the CC BY-NC-SA 4.0 license. The entire source code is available for public audit and review:  
👉 **[https://github.com/CharlesDuchaussoy/Octave](https://github.com/CharlesDuchaussoy/Octave)**

Octave is a modified version of [Musly](https://github.com/dddevid/Musly) by dddevid, distributed under the same license.

---

## Contact
If you have any questions or feedback regarding this Privacy Policy, you can open an issue or start a discussion on GitHub:  
- **GitHub Issues:** [https://github.com/CharlesDuchaussoy/Octave/issues](https://github.com/CharlesDuchaussoy/Octave/issues)
