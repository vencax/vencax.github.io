---
layout: blog
category: tips
published: true
splash: "http://placehold.it/1600x500"
title: Python - instalace vývojového prostředí
tags:
  - Názory
  - Python
---

Nástrojů pro vývoj v pythonu je milion. Já popíši ty, které používám já.
Jsou to [eclipse](http://www.eclipse.rog/) + [pydev](http://pydev.org/) + [egit](http://www.eclipse.org/egit/),
pythonbrew a hlavně ... [ubuntu](http://www.ubuntu.cz/).

Eclipse je IDE pro javu, ale existuje pro něj množství pluginu, které jsou uspořádány v proprietárních repositářích.
Ty jsou přístupné z menu (Help -> Install new software). Jedním z nich je pydev.
Umožňuje editovat python kod, má automatickou kompletaci kodu, vestavěný grafický debuger mnoho dalšího.

Pythonbrew je nástroj, jak na jednom systému mít několik pythonů. Je to alternace RVM ze světa ruby.
Mě se to líbí zejména proto, že pythonbrew zbuilduje python přímo ze zdrojáku a můžete su vybrat jakou chcete verzi.
Pro starší ubuntu, kde je v repositářích python 2.6 ale žádoucí je python 2.7 je to super.

Pro ty línější jsem připravil gist, který nainstaluje na vaše ubntu vše potřebné. Stačí spustit:

> curl -kL https://gist.github.com/vencax/5756028/raw/812c11279a9889c4e5fe79d13e13276b9c3061f3/install_python_devenv.sh | sh
