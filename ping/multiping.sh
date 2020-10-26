#!/bin/bash
#
# Dieses Skript wurde für die Bash auf Ubuntu 18.04 geschrieben.
#
# Die OpenVPN-Verbindung mit dem Valentin-VPN muss für sinnvolle
# Ergebnisse bereits aufgebaut sein:
#  sudo openvpn --config <Name deiner Konfigurationsdatei>.ovpn
#
ping -DOn 192.168.3.1 >> ping.log & # S-VA001 via VPN
ping -DOn 62.214.159.142 >> ping.log & # mail.valentin-software.com
ping -DOn 8.8.8.8 >> ping.log & # Google DNS
#
# Die drei Ping-Prozesse werden im Hintergrund ihre Ausgaben in die
# Datei ping.log schreiben, bis das Terminal geschlossen oder sie
# z.B. mit
#   pkill ping
# beendet werden.
#
# Die Ausgabe kannst du live mitverfolgen z.B. mittels
#   less +F ping.log
#
# Die laufenden ping Prozesse können mittels
#   ps
# aufgelistet werden.
#
