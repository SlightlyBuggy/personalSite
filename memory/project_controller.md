---
name: Sprinkler Automation Controller (Firmware)
description: C++/Arduino firmware for custom IoT rain barrel devices — Arduino MKR WiFi 1010, MQTT over WiFi
type: project
---

Custom-designed IoT devices for automated lawn irrigation. Each device monitors water pressure and bus voltage, controls a pump relay, and communicates with the Django webapp via MQTT.

**Source:** /Users/huntermyers/Code/sprinkler_automation_controller
**Platform:** Arduino MKR WiFi 1010 (arduino:samd:mkrwifi1010)
**Build system:** Arduino IDE or arduino-cli (Makefile added at root)

**Hardware per device:**
- Water pressure sensor (analog A1)
- Bus voltage monitor (analog A0)
- Pump relay (pin 7)
- External MOSFET power control (pin 1)
- 4 pull-up ID pins (pins 2-5) for device IDs 1-15

**Communication:**
- MQTT over WiFi to Mosquitto broker
- Topics: publishes to `device_status`, subscribes to `command`
- Commands: sprinkle_start, sprinkle_on/off, sleep_now, status, power_off, switch_broker_debug/prod
- Device ID filtering — each device only acts on commands matching its hardware-set ID

**Broker IPs (in network_config.h):**
- brokerProd: 192.168.0.232
- brokerDebug: 192.168.0.170
- NOTE: Helm chart reserves 192.168.0.130 for MQTT LoadBalancer — verify these are in sync

**WiFi credentials:** arduino_secrets.h (gitignored — use arduino_secrets.h.example as template)

**Firmware updates:** Manual USB flash only — no OTA implemented. Use `make build` to verify, `make upload` to flash.

**How to apply:** When the MQTT broker IP changes, update network_config.h brokerProd to match the Helm chart's mqtt service reservedIp. These must stay in sync or devices lose connectivity.
