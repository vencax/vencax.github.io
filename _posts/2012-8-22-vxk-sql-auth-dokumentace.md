---
layout: blog
category: blog
published: true
splash: "http://placehold.it/1600x500"
title: Vxk-sql-auth - dokumentace
tags:
  - informační-systémy
  - linux
  - škola
---

Vxk-sql-auth je sada software, která umožňuje uchovávat uživatele v SQL databázi.
Správa uživatelů se děje přes jednoduchou webovou aplikaci.
V tomto článku bude něco o základních administračních úkonech.

Díky autentikaci pomocí databáze (na linuxu libnss-mysql a na windows pgina)
se můžeme přihlašovat v jakémkoli počítači v sití ať už na windows, nebo linuxu.
Tento systém tak nahrazuje obludné řešení od Micro$oftu zvané Active directory.
Zbavuje instutuci, která jej nasadí, nutnosti co chvíly kupovat nový M$ windows server.
Aplikace je přístupná z jakéhokoli počítače bez nutnosti instalovat další software.

## použití

### ZMĚNA HESLA
Jediný rozdíl pro uživatele je nutnost měnit heslo přes webový formulář.
Je to z toho důvodu, že již nelze použít standardní způsob změny hesla, protože M$ k němu nedáva přístup.
URL formuláře pro změnu hesla je:

```
www.skola.local/nss/
```

### PŘIHLÁŠENÍ
Na linuxu se nic nemění. Prostě jen používáte uživatelské jméno a heslo, které je uloženo jinde než obvykle, což běžného uživatele nezajímá.

Na windows se změní tabulka pro přhlášení. Je tam logo PGINA a kolonky uživatelské jméno (username) a heslo (password), čili běžný přihlašovací formulář.
Naopak nehledejte přepínač přihlašování do domény nebo do lokálního počítače.
Není žádná doména. Je zde i indikátor, zda PGINA je spojena se serverem a tudíž je možné se přhlásit - píše "connected" (připojeno).
**POZOR: když píše disconnected (odpojeno) něco je špatně a nepřihlásíte se.**

### ADMINISTRACE
Vlastní administrační aplikace je založena na systému Django a používá jeho administrační rozhraní. URL administrace je:

```
www.skola.loca/admin/
```

po přhlášení máme k dispozici základní rozcestník a v něm několik položek.
Po rozkliknutí každé z nich se objeví administrace té konkrétní položky.
Tipicky je to tabulka, která obsahuje vytvořené objekty, které nabízí odkazy na jejich editaci nebo přidávání, zaškrtávátka pro výběr pro zpracování pomocí "akcí" (mj. mazání) a nástroje pro filtraci nebo hledání.

### UŽIVATELÉ
Pro administraci uživatelů jsou to položky "Systémoví uživatele" a "Systémové skupiny".
Při vytvoření systémového uživatele se zároveň vytvoří linuxový uživatel na serveru i jeho domovský adresář (home) a zároveň samba-uživatel (nutné pro svět windows).
Při smazání systémového uživatele se smaže linuxový uživatel i samba-uživatel a uživatelův home se zkomprimuje a přesune do adresáře /tmp na serveru pro případnou záchranu jeho dat.

### SDÍLENÉ SLOŽKY
Sdélené složky slouží pro kooperaci uživatelů na společných datech.
Je to tipický spůsob sděděný ze světa windows, kde se data musí nejprve nasdílet. Tipickými sdílenými složkami ve školním jsou:

- učitelé - oprávnění mají pouze učitelé
- citlivé - oprávnění mají pouze vybraní zaměstnanci (ředitel, zástupce)
- výuka - obrávnění mají žáci, učitelé

Administrace umožňuje vytvářet informace o připojení ke sdíleným složkám.
Tyto se pak využívají k automatickému generování přihlašovacích skriptů na základě uživatelského jména a skupin do kterých tento uživatel patří.

### PŘIHLAŠOVACÍ SKRIPTY
Se hojně používají ve světě windows, kde není zádný univerzální způsob, jak provést sadu příkazů po přhlášení uživatele.
V tomto systému skripty automaticky generuje administrační webová aplikace. Celý mechanismus je následující:

spustí se logon.bat (který je umístěn na každém počítači s window$ ve složce Po spuštění globální, společnou. V této jsou položky, které jsou společné pro všechny uživatele daného počítače (ve WinXP je to C:\Documents and Settings\All users\Nabídka Start\Programy\Po spuštění, ve Vista a výše se tam dostanete poklepáním pravým tlačítkem myši na po Spuštění v nabídce start a zvolením "Otevřít společnou složku".)
ten spustí vlastní logovací skript na serveru __\\lserver\netlogon\doLogon.bat__.
Toto je proto, aby když chceme ve skriptu něco změnit, změníme to jen v 1 souboru a není třba rotovat okolo všech počítačů.
URL na které je konkrétní skript k dispozici je:

```
www.skola.local/samba_admin/<uzivatelske jmeno>/<jmeno systemu>/logon.bat
```

<jmeno systemu> je typicky Windows_NT. Toto URL se může hodit při hledání problému.
Stačí si totiž stáhnout přihlašovací skript a hned vidíme, co windows měl udělat (a ve většině problémových případů neudělal).
doLogon.bat stáhne logovací skript pro konkrétního (zrovna se přihlašujícího se) uživatele do jeho profilu.
Tento skript se spustí a už dělá právě jen ty akce, které má pro daného uživatele udělat. Je generován.

### KDYŽ NĚCO NEFUNGUJE
Neni náhodou na přihlašovacím formuláři "Disconnected"?
Systém je závislý na DNS překladu, takže 1. krok je zkontrolovat zda nám DHCP přiděluje správnou DNS adresu
a nebo jestli náhodou nemáme DNS nastaven napevno.
