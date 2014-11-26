---
layout: blog
category: blog
published: true
splash: "https://www.mojedatovaschranka.cz/as2/static/images/layout/header-bg.png"
title: Datové schránky jinak
tags:
  - Názory
  - Historie
---

Datová schránka, projekt tak zprasený, jak se na státní správu sluší a patří.
No nic, řek jsem si: __"Schránku si pořídim, ať nemusím na ouřad běhat s vytištěnýma papírama a ať se úředník poměje a taky něčemu přiučí"__.
Po pár odeslaných zprávách jsem si krom několika sprostých slov pomyslel, že o nějaké uživatelské přívětivosti nelze ani mluvit.
Ale naštěstí jsem objevil řešení, které navíc umožňuje automatizovat!

Řešení naprogramovala CZNIC a jmenuje se [dslib](https://redmine.labs.nic.cz/projects/dslib).
Jde o vrstvu nad SOAP rozhraním, které datové schránky (naštěstí) mají.
Je napsána v pythonu a tudíž bude fungovat všude tam, kde python je.
Tzn. jak na widlích, tak na linuxu, MACu, ...
Mně už stačilo projekt vzít zabalit do parsovnání argumentů příkazové řádky a přikládání příloh.
Výsledek je github repositář [PyDatoveSchanky](https://github.com/vencax/PyDatoveSchrankyBinarky), kde je vše potředné.

## instalace
Je potřeba mít python a [pip](https://pypi.python.org/pypi/pip) (nástroj pro správu python balíčků, na ubuntu je to: __sudo aptitude install python-pip__).
Pak už jen stačí nainstalovat prerekvizity a nakonec vlastní "binarky":

```bash
sudo pip install git+git://git.nic.cz/sudsds/
sudo pip install git+git://github.com/vencax/dslib.git
sudo pip install git+git://github.com/vencax/PyDatoveSchrankyBinarky.git
```

## použití
Pakliže si do uděláte alias:

```bash
alias poslidatovkou="python /usr/local/bin/sendmessage.py --username fdsjkfs --pwd mojetajneheslo"
```

pak poslání zprávy může vypadat takto:
```bash
poslidatovkou -a ~/priznani.pdf adresaDSUradu "priznani2012"
```
To už jde, ne?
