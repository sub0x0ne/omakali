-- Burp Suite window rules
o.window("class:(?i).*burp.*", { tag = "-default-opacity", opacity = "1 1" })
o.window("title:(?i).*burp suite.*", { tag = "-default-opacity", opacity = "1 1" })
o.window("title:(?i).*(proxy settings|target scope|project options|user options|intruder).*", { float = true })
