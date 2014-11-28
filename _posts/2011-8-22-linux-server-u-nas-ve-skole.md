---
layout: blog
category: blog
published: true
splash: "http://placehold.it/1600x500"
title: Datové schránky jinak
tags:
  - informační systémy
  - linux
  - škola
description:
  Po problémech se sití založenou na windows technologiích jsme se rozhodli
  přejít na linux. Vznikla ale otazka, čím nahradit active directory,
  roaming (cestovní) profily, a sdílené složky. Volba padla na Smaba4. 
---

Po nekonečných peripetiích s M$ Windows server mi došla trpělivost a povidám:
“Ja ti na to kašlu Bille!”

Tak jako asi v hojném počtu škol i my jsme měli klasickou školní síť,
tj. windows server a windows (xp, 7) na klientech.
Data se sdílela pomocí sdílených složek na serveru,
které se automaticky připojovali pomocí skriptu (když zrovna zafungoval).
Později jsme zavedli RoamingProfiles - Cetstovní profily a začal konec.

Pro mě jako pro správce to znamenalo řešení neustále se opakujících problémů
způsobených nesmírně komplikovaných systémem oprávnění, restrikcí,
skriptů a jiných příkazů aplikovaných pomocí kontejneru GroupPolicy.
Navíc, po zavedení cestovních profilů někteří učitelé nebyli schopni pochopit,
že když mají profil velikosti řádu gigabytů, tak nejen že zahlcují síť
při jeho nahrávaní, ale ono nahrávání i trvá.

Při podrobnějším zkoumání způsobu jakým jsou cestovní profily a fungovaní
GroupPolicy kontejnerů a zároveň se znalostí jakým podobné mechanismy jsou
řešeny v linuxovém světě nemůžete skončit jinak, než s rozhodnutím,
že s window$ to dál nejde.
Takové rozhodnutí jsem udělal já a našel i podporu pro jeho uvedení v život.
Jediným požadavkem bylo "Prosim tě, ať to funguje aspoň tak jako doteď ..."

První věcí, kterou jsem proto musel udělat, byl seznam služeb,
které windows server vykonával. Ono, moc jich pravda nebylo. Sloužil jako:

- DNS server (nutná podmínka fungování active directory)
- DHCP server
- Server pro sdílení dat
- Správce a autentikátor uživatelů z active directory

První 3 služby jsou na linuxovém server otázkou lusknutí prstu.
Ale ta poslední, to je záludný oříšek.
Ale (jak se praví v 1 reklamě) mně se ho podařilo rozlousknout .
Řešením je totiž samba 4, která (na rozdíl od verze 3) implementuje funkcionalitu M$ active directory.
Má to však 1 háček.
Je zatím ve vývoji.
Vývoj však dospěl už tak daleko, že služby, které jsme využívali na M$ serveru, implementuje.
Tudíž jsem se rozhodl ji použít.
Nainstaloval jsem, přemigroval.
Tady stojí za zmínku mechanismus migrace.
Ten se díky tomu, že samba4 server můžete pripojit do sítě jako tzv. záložní domenový kontroler (backup domain controller, BDC) smrskne pouze na konfiguraci BDC
Ten si pak "natáhne" obraz primárního kotroleru PDC - window$ serveru, který se následně odpojí.
Samba 4 BDC se pak překonfiguruje na PDC a migrace je hotova.

Nebudu zastírat, že celý proces není úplně takto hladký.
Je doprovázen absencí dokumentace samba 4, pročítáním různých diskusí, studováním instrukážních videí, pokusů a omylů.
Další nevýhodou je absence managementu tiskáren.

Kvůli těmto nedostatkům jsem byl nucen zprovoznit jiný počítač. který tiskárny měl menežovat.
Nebylo už třeba, aby to byl windoze server, takže jsem rozjel XP.
Na linuxu zbylo ještě dostatek výkonu tudíž XP běžel jako virtuální stroj pod qemu virtulalizací.
Vše šlapalo dokud se ke slovu nedostali Bakaláři a jejich webová část.
Protože není způsob, jak je rozchodit jinde než na suvereně nejhorším webovém serveru na světě = M$ IIS, musel jsem do virtuální mašiny nainstalovat windoze server.
Udělal jsem tak. Po zkušenostech s WinVista resp. 7 jsem zvolil jsem Win2003 s tím, aby nebyl tak "žravý" jako jeho následníci.
A ouha! Bakaláři potřebují vyšší verzi IIS, co teď?
Po chvíli googlení jsem se dozvěděl že IIS je součást windoze server a NEJDE upgradovat samostatně ale musí se upgradovat CELÝ windoze!

Po spršce nevybíravých sprostých slov jsem nainstaloval windoze 2008.
Po pár týdnech provozu jsme museli provoz ve virtuálu ukončit a přemigrovat vše na fyzicky stroj.
Skvadra windoze + IIS + bakaláři je totiž neuvěřitelně žravá záležitost. Ale o tom jindy.

Do budoucna bych rád vyzkoušel a nasadil prostředí postavené kompletně na linuxu.
To znamená stanice na linuxu, uživatele a jejich data na serveru přístupná přes NFS (tzn. žádné kopírování CELÝCH profilů).
Sdílení tiskáren, management uživatelů, to vše vyřešené, bezproblémové, 1000x otestované na univerzitách a jiných linuxových světech.
Jediné s čím mohou být problémy jsou výukové programy, které nejsou vyráběny multiplatfomě a fungují jen na windoze a které nefungují pod wine emulátorem.
Největším probémem však budou samotní uživatelé.
Učitelé, ředitelé, vedoucí jídelen. Ze zkušenosti vím, že na jakoukoliv změnu reagují negativně.

Byl bych rád, kdybych zjistil, že podobný plán nebo už realizaci mají i jinde a mohla tím začít spolupráce.
Pakliže tomu tak je, napište mi prosím. Díky
