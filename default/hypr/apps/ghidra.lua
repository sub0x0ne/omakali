-- Ghidra Software Reverse Engineering Suite window rules
o.window("class:(?i).*ghidra.*", { tag = "-default-opacity", opacity = "1 1" })
o.window("title:(?i).*ghidra.*", { tag = "-default-opacity", opacity = "1 1" })
o.window("title:(?i).*(set register values|function call trees|data types|edit field).*", { float = true })
