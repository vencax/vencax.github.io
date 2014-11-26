---
layout: blog
category: blog
published: true
splash: "http://placehold.it/1600x500"
title: Přechod na google apps
tags:
  - informační systémy
  - škola
  - google
---

Věřím, že se najde nemálo škol, kde pohár zloby uživatelů přetekl.
Kde už nechtějí používat technologie, které se používali možná tak za krále klacka a chtějí zavést Google Apps.
Dovolím si popsat scénář změny u nás.

Konzumovali jsme internetové služby za obskurně nevýhodných podmínek z důvodu, jak už to tak bývá, absolutní nekompetence na straně zřizovatele, tedy města.
Služba spočívala mimo jiné i v zajištění mailové komunikace.
Ta se děla pomocí linuxového serveru, který někdo nastavil v roce 3211 před Kristem a od té doby na něj nikdo nesáhl.
Dostali jsme zevrubné instrukce, jak se k němu přihlásit a přidat emailové konto manuálně, tzn. pomocí příkazů na linuxu.
Změna konta? Nebylo v instrukcích, čili nemožné. Odstranění konta? To samé.
Pro klasického windowsáka, kterých se u nás při zprávě IT vystřídalo, nemožné ovládání.
Jistě pochopíte, že takovýto stav je dlohodobě neudržitelný, a tak jsem zatlačil na změnu.

Změnou myslím přechod na Google Apps, v rámci kterých jsou i mailové služby.
Google Apps je sada služeb, které jsou vzájemě propojené a zaměřené na spolupráci skupiny uživatelů.
Google Apps existují v několika variantách s různě odstupňovanou funkcionalitou za různě odstupňovanou cenu.
Jejich srovnání naleznete [ZDE](http://www.google.com/apps/intl/cs/index.html).
Přechodem jsme vyřešili i jiné služby, které škola konzumovala z podobně obskurních zdrojů, jako např. webové stránky.

Celý proces jsem začal registrací základní verze Google Apps (GA), protože jsem nenašel přímou registraci GA for education (GA pro školy).
Ten má 3 kroky. V prvním uvedete základní info o sobě jako o reprezentantovi vaší školy a o vlastní škole.
V dalším vyplníte captchu a vytvoříte účet zprávce GA. Na stejně straně i odsouhlasíte podmínky.
Vše je hezky popsáno. Po dokončení registrace přes ověřovací email by uživatel měl skončit v administračním rozhraní.

Následně jsem ještě pročítal různá fóra, abych zjistil, jak upgradovat právě na verzi GA for Education.
jsem nic lepšího, než vyplnit [kontakní formulář s žádostí a odůvodněním o upgrade](http://www.google.com/apps/intl/cs/business/contact_sales.html).
Ten jsem tedy poslal doufajíc, že se dostane do rukou české pobočky Google, která bude obeznámena s českým školským systémem.
Opak byl pravdou a tak jsem si ještě vyměnil pár mailů s podporou kdesi ve světe vysvětlujíc, že jsme opravdu akreditovaná škola a že si to může ověřit na Ministerstvu školství mládeže a tělovýchovy ČR.
Magickým slovíčkem, které dotyčný chtěl slyšet, je K-12, což je pravděpodobně kód pro zakladní školu v USA.
Pakliže se dostanete do podobné situace, použijte asi toto:

> Hallo, I am ... ..., IT administrator in K-12 class school and I would like to upgrade our Google Apps registration to version for education.
> You can verify our status on czech ministry of education. If you have any question regarding our school please feel free to contact me.
>
> sincerely ...

Po pravdě by nám stačila zakladní verze, protože poskytuje pro nás dotatečný počet uživatelů (50).
Apps totiž nezřizujeme žákům. Chtěl jsem ale zkusit využít funkce, které v základu nejsou.
Jedná se např. o SSO (Single Sign On - Jednotné přihlašování). Čili kolečko upgradu je možné vynechat.

Takže pokračujeme. Máme GA a jsme v admin rozhraní.
Hned na začátek: nepoužívejte žádné průvodce.
Dostanete-li nabídku použít pro nastavení průvodce, tak dělejte vše pro to, abyste ho nemusel použít.
Celou situaci spíš komplikuje a navíc se nechytnete v dalším popisovaném textu.
Nyní je třeba ověřit vlastnictví domény vašich GA.
To lze udělat několika způsoby, z nichž nejjednodušší je pomocí DNS záznamu.
Tyto záznamy lze editovat v admin rozhraní u vašeho registrátora.
Tím může být Active24, tele3, atd. Jistě musíte vědět, jak toto provést, pokud máte vlastní doménu.

Po ověření vlastnicví domény musíte popřidávat jednotlivé uživatele nebo je namigrovat pomocí dávkového souboru CSV (Hromadné odesílání v pokoročilých nástrojích).
Soubor CSV je normální tabulka.
Její trukturu najdete také na stránce pro Hromadné odesílání v pokročilých nástrojích.
CSV si vytvoříte dotazem do vaší stávající uživatelské databaze (v našem případě Active Directory).
V rámci tohoto exportu ale nevyexportujete hesla.
Ty si musíte nějaka vymyslet a instruovat uživatele, aby si je později změnili.
Celý tento přístup má i jednu velkou nevýhodu. Opět duplikujeme uživatelská konta.
Takže uživatele si musí pamatovat další heslo. Celou tuto věc řeší SSO, které jsem popisoval výše.
Toto jsme ale zatím nezprovoznili. Možná se najde někdo, kdo toto zprovoněné má a napíše jiný článek, jak na to.

Poté již můžete nastavovat jednotlivé služby. Email, Weby, Adresář, atd. Uvedu přiklad pro nastavení emailu.
Ostatní služby jsou analogické. Každou službu musíte přesměrovat na servery Google ve vašem DNS záznamu.
Říkáte tím všem lidem na světe: __„Moje emaily pro domenu XXY.cz směřujte na servery google.com. Tam už si s nimi poradí"__.
Jak přesně vaše DNS záznamy upravit vám řekne administrační prostředí při nastavování té konkrétní služby.
Jediná rada: čtěte pozorně.

Myslím, že tady je možné celý návod ukončit, protože mnoho věcí se objasní až při vlastním procesu a nemá smysl je dopodrobna opisovat.
Je možné, že některé věci, které mně připadají jasné, jinému jasné nejsou, a proto narazíte-li na problém, napište mi.
