---
published: true
title: Edu IT - správa školní infrastruktury
layout: page
---

Celou svojí karieru působím ve školním prostředí jako administrátor sítě a serverů.
Začínal jsem s windoze server "operačními systémy",
ale po nesčetných problémech jsem postupně přešel na linuxové řešení.

Z počátku jsem používal [Samba4](http://www.samba.org/), protože přímo nahrazuje Windoze řešení založené na Active DIrectory doméně.
Jenže, jak to je u Micro$oftu špatným zvykem, celý koncept je irelevantně složitý.
Takže jsem se poohlédl jinde a vytvořil vlastní řešení, které tento moloch nahrazuje. Zatím k plné spokojenosti uživatelů.

EDU IT - UDucation IT je ucelené řešení správy uživatelů a vůbec celé IT infrastruktury ve škole.
Mezi jeho hlavní přednosti patří:

- **Administrace přes webový prohlížeč**
  není nutné instalovat další program, přístupný odkudkoli na lokální síti
- **Sdílení dat na stanicích s windows a linux**
  umožňuje provozovat stanice s dualbootem - možnost vybrat si operační systém a pracovat se stejnými daty na obou.
  Nabízí možnost postupně přejít na linux i na stanicích.
- **Nezávislost na software Micro$oft**
  odpadá nutnost nakupovat windows server, klientské licence pro server.
  Pro pracovní stanice není pak nutné kupovat dražší verze windows aby se vůbec mohli připojit do doménové infrastruktury.
  Nasazení EDU IT ruší koncept windows domény a umožňuje tak připojení jakékoli verze windows.
  Celkově je možné ušetřit za software Microsoft nemalé prostředky.
- **Přístup z internetu přes zabezpečené VPN připojení**
  umožnuje pracovat odkudkoli z internetu jakoby dotyčný seděl ve své kanceláři.
- **Multiplatformita**
  funguje na nejrůznějších operačních systémech, významu však nabývá na linuxových

Celé řešení je postavené na opensource software.
Je složené z několika dílčích modulů, které jsou již odskoušené nasazením po celém světě a zároveň podporované komunitou vývojářů.
EDU IT je výsledkem poskládání daných modulů a zastřešení webovou aplikací, která celý systém administruje.
Systém vznikl při administraci IT infrastruktury na základní škole, takže vychází z reálných požadavků a z reálného nasazení.
Je vhodný i do jiných tipů škol ale i jiných tipů organizací.

### reference
Pro reference je možné kontaktovat ZŠ Planá nad Lužnicí a nebo ZŠ Praha Radotín.

### technické informace

![Diagram řešení EDU-IT](/img/overview.png)

Centrálním prvkem je server, který nabízí celou řadu služeb.
Hlavní z nich je SQL databáze, ve které jsou uložena všechna data.
Přes tuto databázi probíha autentizace (přihlašování) uživatelů jak na windows, tak na linux stanicích.
Uživatelé jsou spravováni přes webovou aplikací, která mění vlastní data v SQL databázi a je mozkem celého systému.

Server zároveň slouží i jako souborový server.
Uchovává data, která se ve škole vyprodukují a zároveň umožnuje několik stupňů ochrany podle příslušnosti uživatele ve skupinách.
Přístup k datům z linuxových stanic je realizován přes NFS svazek.
Z window$ stanic pak přes oblíbenou sambu, která implementuje sadu protokolů použitých ve světě windows.

Další služby poskytované serverem jsou DHCP (spravuje síťová nastavení pro stanice), DNS (překlad názvů stanic na adresy), NTP (centrální čas).
Celý systém ilustruje obrázek vlevo.

Mezi další výhody se řadí:

- __Automatické generování přihlašovacích skriptů__ už žádné trápení s příkazovou řádkou
- __Centralizovaná správa software na linux statnicích__
  stačí vytvořit skript pro instalaci software na serveru a automaticky se použije i na všech linux stanicích. Už žádné obíhačky kolem statnic.
- __Přidělování adres pomocí DHCP na základě rezervací__
  přesná správa IP adres a stanic. Žádné kolize. Možnost rezervací pro stále stejné IP pro konkrétní stanice.

### plánovaná rozšíření
Systém neustále vyvíjím a rozšiřuji.
Naplánovány jsou další moduly webové aplikace:

- školní agenda (alternativa k současnému nejrozšířenějšímu "systému" Bakaláři)
- Administrace DHCP rezervací
- správa knihovny
...
