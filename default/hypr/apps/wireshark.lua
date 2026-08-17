-- Wireshark network protocol analyzer window rules
o.window("class:(?i).*wireshark.*", { tag = "-default-opacity", opacity = "1 1" })
o.window("title:(?i).*(capture options|protocol preferences|packet details|follow tcp stream).*", { float = true })
