# 6tunnel-Projekt

Ausgangspunkt: Meine Internetleitung daheim hat neuerdings (eigentlich) nur noch IPv6, für IPv4-Traffic nutzt sie "DS-Lite". Das bedeutet (correct me if I'm wrong...), dass ich keine öffentliche IPv4-Adresse mehr für meinen DSL-Router habe.

Ich verwende einen Raspi aber per Port-Forwarding als Internet-Server für die TLS-Zertifikats-Erstellung für einen Host "baumeister" bei Valentin Software; und eher ohne konkrete Notwendigkeit lasse ich auch einen "Service Monitor" alle 3 Minuten checken, ob dieser RasPi noch aus dem Internet erreichbar ist - von einem System aus, das keine IPv6-Konnektivität hat.

Als ersten Versuch möchte ich auf einem "dritten" (also zusätzlichen, eigentlich weder als Sender noch Empfänger auftretenden) Host aus einen `6tunnel` aufbauen, so dass dieser dritte Host auf den Standard HTTP-Ports 80 und 443 Traffic über IPv4 annimmt und via IPv6 an meinen Router / meinen RasPi weiterleitet.

> **Quelle:**
> https://www.heimnetz.de/anleitungen/sonstiges/ipv6-ueber-ipv4-erreichen-6tunnel/ macht wohl sowas...

1. Öffentlichen DNS-Record so ändern, dass er auf den "dritten" Host zeigt: <br> `geheim[.valentin-software.com]  IN  A  94.16.*.68`

2. Prüfen, ob eine IPv6-Verbindung mit dem Webserver auf dem RasPi möglich ist (ausgeführt auf einem IPv6-fähigen Host, z.B. dem `dritten`): <br>curl `http://[2a00:1f:9884:c001:7c9d:5e04:****:576b]/` <br> curl `https://[2a00:1f:9884:c001:7c9d:5e04:****:576b]/` *(das wird lediglich TLS-Fehlermeldungen geben, falls nicht tatsächlich ein gültiges Zertifikat für den Zugriff über die nackte IPv6-Adresse vorliegt!)*

3. Auf dem `dritten` einmalig: <br> `sudo apt install 6tunnel`

4. Auf dem `dritten` dann jeweils nach dem Systemstart: <br> `6tunnel {Port vServer} {Ziel-Adresse} {Port Ziel}` <br> `sudo 6tunnel 80 2a00:1f:9884:c001:7c9d:5e04:****:576b 80` <br> `sudo 6tunnel 443 2a00:1f:9884:c001:7c9d:5e04:****:576b 443` <br> `sudo ss -tlpn | grep 6tunnel`

Falls die ganze Kette an Hosts, Verbindungen und Konfigurationen funkionieren, kann danach der RasPi über IPv4 erreicht werden: <br>`curl http://geheim.valentin-software.com/` . HTTPS geht mehr oder weniger auch - dabei kommt es natürlich dann noch auf Vorhandensein und Gültigkeit des entsprechenden Zertifikats an.
