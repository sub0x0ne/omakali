-- OWASP ZAP Web Application Security Scanner window rules
o.window("class:(?i).*zaproxy.*", { tag = "-default-opacity", opacity = "1 1" })
o.window("title:(?i).*owasp zap.*", { tag = "-default-opacity", opacity = "1 1" })
o.window("title:(?i).*(options|active scan|fuzzer|session properties).*", { float = true })
