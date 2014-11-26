---
layout: blog
category: blog
published: true
splash: "http://placehold.it/1600x500"
title: Doména zrušena, sbohem Bille
tags:
  - informační systémy
  - linux
  - škola
---

Dlouho jsem řešil jak umožnit uživatelům práci v prostředí M$ Windows active directory s Linuxem na server.
Popsal jsem to v článku „Linux server u nás ve škole“.
Protože toto řešení je celkem komplikované, přemýšlel jsem, zda by nebyla jiná možnost. Klíčem je [PGina](http://pgina.org/)!

Dalším důvodem byl fakt, že v Sambě 4 (řešení implementující Active Directory na Linuxu) jsou stále uživatele uchováváni v historické obskurnosti nazvané LDAP.
Tato je obtížně dotazovatelná, spravovatelná.
V ideálním případě jsem chtěl mít možnost uchovávat uživatele v SQL databázi.
Ta je naproti tomu pružná, jednoduchá, rozšířená.

Základem nového řešení je program pGina. Jedná se o alternativní autentikátor pro Window$.
Skvělé na celé věci je fakt, že je postaven na platfomě .NET, a tím pádem je (snad) zaručena kompatibilita v rámci jednotlivých verzí.
Minimálně na XP a 7 jsem to rozběhnul.
Další důležitou vlastností je, že pGina obsahuje plugin, který dovoluje autentikaci uživatelů uložených v SQL databázi (mySQL).
Udělal jsem tedy pokusného uživatele v databázi a pár pokusů s nalogováním. A fungovalo to. Damn I am good, pomyslel jsem si.

Na zamýšleném řešení je super jestě jedna věc.
Počítač s Windosem, který používá pGinu, již nemusí být v rámci domény, ale stačí, když je v pracovní skupině.
Odpadá tedy přivádění do domény.
Jedinou změnou je, že již se nejedná o doménové přihlašování doménových uživatelů, ale o lokální přihlašování centrálně spravovaných uživatelů.
Z čehož plyne, že nefungují cestovní profily. Protože se ale cestovní profily neosvědčily, tak mě toto omezení ani netrápí.

Jiný problém nastal s tím, že uživatelé měli k dispozici sdílené složky.
Toto jsem chtěl zachovat.
Nainstaloval jsem tedy Sambu 3. Tato na rozdíl od Samby 4 je už stabilní, odskoušená, ale neobsahuje active directory finkcionalitu.
Se sambou 3 jsem musel zajistit, aby i Linux server znal uživatele, kteří jsou uloženi v SQL databázi.
Nebyl by to ale Linux, kdyby mě opět příjemě nepřekvapil. Jedná se o knihovny libnss-mysql libpam-mysql.
Věděl jsem sice, že daná věc je na Linuxu možná, netušil jsem ale, jak je celé řešení elegantní a jednoduché.

Na to konto mi blesklo hlavou, jak by bylo na světě krásně bez Windows a jiných parodií na software z dílny M$.
Dalším prvkem je správa uživatelů. Zastávám názor, že to, co není použitelné přes web, je mrtvé, k ničemu.
Proto jsem hledal, zdali existuje nějaký web-based manager pro uživatelé uložený v SQL databázi.
Nenašel jsem nic, co by mi vyhovovalo a tak jsem aplikaci napsal sám.
Výsledek je publikován na GitHubu. ([django-sql-nss-admin](https://github.com/vencax/django-sql-nss-admin),
[django-samba-admin](https://github.com/vencax/django-samba-admin), [django-server-admin](https://github.com/vencax/django-server-admin)).
Jedná se o webové aplikace napsané v prorgramovacím jazyce python, ve frameworku Django.
Jsou to vlastně dvě django aplikace.
Jedna spravuje uživatele v databázi a druhá generuje přihlašovací skripty pro jednotlivé uživatele na základě jejich příslušnosti ke skupinám.

Detaily jistě nejsou důležité. Důležitý je výsledek.
A tím je, že nyní jsem schopen otevřít jakýkoli prohlížeč, přilogovat se k aplikaci, naklikat nového uživatele a klepnout na uložit.
Tím je uživatel, jeho domovský adresář i vše ostatní vytvořeno, uživatel se může přihlásit.
A to kdekoli ho napadne. Kdekoli má k dispozici jeho data. Ne však ty z profilu.
Pakliže se ale dodrží politika ukládání do domovského adresáře (disk H:), tak uživatel má stejné pracovní prostředí jako s Active directory.
Avšak výhody pro správce takového systému jsou nedozírné.
