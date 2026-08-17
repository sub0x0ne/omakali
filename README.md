# Omakali

**Omakali** is a modern, opinionated, keyboard-driven Linux environment designed for security professionals and penetration testers. It is a fork of Basecamp's [Omarchy](https://github.com/basecamp/omarchy), combining Omarchy's streamlined Arch Linux + Hyprland desktop workflow with the comprehensive security tooling and pentesting capabilities of Kali Linux.

---

## Highlights

- **Modern Tiling Window Manager**: Built on Hyprland with smooth animations, dynamic tiling, and unified keybindings.
- **Curated Security Tooling**: Out-of-the-box integration of core penetration testing tools (Reconnaissance, Web Analysis, Exploitation, Password Attacks, Reverse Engineering, Forensics, and Sniffing).
- **BlackArch Repository Layer**: Access to 2,800+ security packages on demand without repository lock-in.
- **Workflow Accelerators**: Built-in CLI and TUI tools for target scoping (`omakali-target`), interception proxy management (`omakali-proxy`), VPN lab connectivity (`omakali-vpn`), and wordlist management (`omakali-wordlists`).
- **Comprehensive Upstream Parity**: Full compatibility with upstream Omarchy themes, updates, and configuration workflows.

---

## Omakali CLI

The central command router is `omakali` (with `omarchy` maintained as an alias for backwards compatibility):

```bash
# Main command center
omakali --help

# List all available commands & categories
omakali commands

# Update system and security packages
omakali update

# Theme and appearance controls
omakali theme list
omakali theme set tokyo-night
```

---

## Manual & Documentation

The core system documentation is available in [`manual/`](manual/).

- [Getting Started](manual/02-getting-started.md)
- [Omakali Navigation & Keybindings](manual/04-navigation.md)
- [Top Bar & Indicators](manual/05-the-top-bar.md)
- [CLI Reference](manual/14-omarchy-cli.md)
- [Security Features & Hardening](manual/49-security.md)

---

## License

Omakali is released under the [MIT License](LICENSE), matching upstream Omarchy.
