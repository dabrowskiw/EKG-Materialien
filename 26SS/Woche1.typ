#import "@preview/touying:0.6.1": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse
#import "@preview/numbly:0.1.0": numbly
#import themes.university: *
#import "@preview/codelst:2.0.2": sourcecode

#set text(
  hyphenate: true,
  lang: "de"
)

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Einführung in #linebreak() Kultur und Gesundheit],
    date: "WiSe 25/26",
    institution: "HTW Berlin",
    author: "Prof. Dr.-Ing. P. W. Dabrowski"
  ),
  config-colors(
    primary: rgb("#76b900"),
    secondary: rgb("#0082D1"),
    tertiary: rgb("#EDF5DF"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#000000"),
  )
)


#show link: underline

#title-slide()

= Textverarbeitung

== Motivation

- Keine Word-Abschlussarbeiten mehr...
- Verständnis für technische Hintergründe
- Kennenlernen von Technologien, die geeignet sind für:
  - Automatisierung
  - Versionsverwaltung
  - Trennung von Inhalt und Darstellung

== Dateiformate

- Arbeitsspeicher und Festplatte: Nur Zahlen
- Dokument: Buchstaben an unterschiedlichen Koordinaten, Bilder...
- Übersetzung Zahlen->Pixelwerte auf Bildschirm:
  - Buchstaben-Codierung: #link("https://www.asciitable.com/")[ASCII], #link("https://en.wikipedia.org/wiki/UTF-8")[UTF-8] etc.
  - Buchstaben-Aussehen: #link("https://www.fontspace.com/")[Font]
- Anordnung der Buchstaben: Dokumentdatei
  - Einfachstes Beispiel: Textdatei - aber sehr eingeschränkt
  - Bekannt vom Internet: HTML - aber nicht für Papier gedacht
  - Gut für Papier: PDF - aber schwer zu bearbeiten
  - Einfach zu bearbeiten: docx - aber Kompatibilitätsprobleme, proprietäres Tooling, Probleme bei komplexen Dokumenten, intransparentes Format

== Text -> PDF

- Bestes aus allen Welten: Einfacher Text, PDF daraus generieren
- Viele Beispiele:
  - Markdown
    - Online-Editor: #link("https://dillinger.io")
    - Weniger flexibel als z.B. Word, viele Dialekte
  - LaTeX
    - Online-Editor: #link("https://www.overleaf.com/")
    - Sehr mächtig, aber komplex, langsam bei großen Dokumenten
  - Typst
    - Online-Editor: #link("https://typst.app")
    - Aktuelle Entwicklung, vereint Vorteile von Markdown, LaTeX
    - Komplette eingebettete Programmiersprache #sym.arrow flexibel

== Typst-Kurzüberblick

- Langfristig sinnvoll: Typst-Compiler von #link("https://github.com/typst/typst")[github-Seite] installieren
- Heute: #link("https://typst.app/play/")[Online-Editor verwenden]
- Gemeinsam Grundlagen des #link("https://typst.app/docs/tutorial")[Typst-Tutorials] anschauen:
  - Grundlage: Alles ist Text, es sei denn, es steht `#` davor - dann Sprachelement (Funktion, Variable, Kontrollstruktur)
  - Text, Überschriften, Listen
  - Erste Funktion: `#image()` für Bilder
  - `#figure()`: Abbildung, z.B. für Unterschriften und Referenzen
  - `#lorem()`: Fülltext 

== Zwischenübung

Erstellen Sie ein Typst-Dokument mit:

- Zwei Kapiteln mit jeweils drei Unterkapiteln
- Insgesamt mindestens 3 Seiten Text
- Drei Abbildungen mit jeweils einer Referenz irgendwo Text

== Typst-Kurzüberblick

  - Textformatierung mittels `#text()` und global mittels `#set text()`
  - Seitensetup mittels `#set page()`
  - `#grid()` für Tabellen/Autoren
- Zusätzlich zum Tutorial: 
  - `#strong[]`/`**`, `#emph[]`/`_ _`, `()` vs. `[]`, `#text(stroke: ...)`
  - `#link("https://...")[Text]`

== Dynamische Dokumente

#show raw.where(block: true): set text(size: 14pt)

- Daten können aus Textdateien gelesen werden
- Überblick typische Formate:
#only(2)[
  - csv: Comma-separated values
  #sourcecode[```csv
id,name,email
1,John,john.doe@example.com
2,Jane,janey72@test.org
  ```]
]
#only(3)[
  - json: JavaScript Object Notation
  #sourcecode[```json
[
  {
    "id": 1,
    "name": "John",
    "email": "john.doe@example.com"
  },
  {
    "id": 2,
    "name": "Jane",
    "email": "janey72@test.org"
  }
]
  ```]
]

#only(4)[
  - XML: eXtensible Markup Language
  #sourcecode[```xml
<users>
  <user>
    <id>1</id>
    <name>John</name>
    <email>john.doe@example.com</email>
  </user>
  <user>
    <id>2</id>
    <name>Jane</name>
    <email>janey72@test.org</email>
  </user>
</users>
  ```]
]

#only(5)[
  - TOML: Tom's Obvious Minimal Language 
  #sourcecode[```toml
[[users]]
id = 1
name = "John"
email = "john.doe@example.com"

[[users]]
id = 2
name = "Jane"
email = "janey72@test.org"
  ```]
]

#only(6)[
  - Daten aus Textdateien können in typst-Variablen geladen werden
  - Spezialisierte Funktionen für unterschiedliche #link("https://typst.app/docs/reference/data-loading/")[Formate]
]

== Dynamisches Dokument: Beispiel

#slide[
#sourcecode[```typst
#let mails = toml("mails.toml")

= Email-Liste

Title: #mails.title \
Version: #mails.version \

#for c in mails.users [
  #c.id: #c.name <#c.email>

]
```]
For-Schleife: Hier ohne Zählvariable, sondern "für jedes Element aus der Liste"
][
  #sourcecode[```toml
title = "Private Kontakte"
version = 1

[[users]]
id = 1
name = "John"
email = "john.doe@example.com"

[[users]]
id = 2
name = "Jane"
email = "janey72@test.org"
  ```]
]


== Typst-Übung

- In Gruppen von je 4-5 Personen mit einem Laptop Bilder machen von:
  - Dem Urban-Gardening-Projekt an der Spree
  - Einem Gericht in der Mensa
  - Einem Ausschnitt der Geschichte von Schöneweide (gibt es auf einer Mauer auf dem Campus)
  - Einer grünen Bank/Sitzgelegenheit (gibt es im Gebäude C)
  - Einer Sitzgelegenheit im TGS
  - Einem Fahrrad
  - Einer Windturbine
  - Der Spree von oben (höher als die Mensa-Fenster)

== Typst-Übung

Schreiben Sie in der Gruppe einen Kurzbericht über die Campus-Tour:

- Dokument mit:
  - Mit Titel
  - Mit Liste der Autoren (Personen in Ihrer Gruppe, mit Matrikel-Nr.)
  - Ganz kurzer Text
  - Bilder mit Referenzen im Text (`#image` in `#figure`, referenziert mit `@label`)
- Daten sollen aus toml-Datei gelesen werden:
  - Titel, Autorenliste

*Jede* Person aus der Gruppe gibt die .typ, .toml und .pdf in Moodle als Abgabe für diesen Teil ab.
