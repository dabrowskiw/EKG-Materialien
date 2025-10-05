#import "@preview/touying:0.6.1": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import fletcher.shapes: diamond, ellipse
#import "@preview/numbly:0.1.0": numbly
#import themes.university: *

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

= Organisatorisches

== Fahrplan

- Ablauf des Moduls
- Benotung
- Textverarbeitung
  - Dateiformate
  - Konvertierung
  - Übung mit Typst

== Ablauf des Moduls

- Profs und Dozierende stellen sich vor
- Idee: Personen und Themen kennenlernen
  - KW 41: Wojtek Dabrowski
  - KW 42+43: Ben Wulf 
  - KW 44+45: Wojtek Dabrowski
  - KW 46+47: Habakuk Israel
  - KW 48+49: Orhan Konak
  - KW 50+51: Thomas Jung
  - KW 2+3: Thomas Manke
  - KW 4: Wojtek Dabrowski 

== Benotung

Zu jedem Thema (-> ca. alle 2 Wochen) eine halbe Seite A4 Takeaway ("Was habe ich aus diesem Teil der Veranstaltung für mich mitgenommen?") schreiben und in Moodle abgeben. Jede Abgabe wird benotet als:

- Nicht bestanden
- Bestanden
  - Besonders gut bestanden (+1 Bonus)
  - Normal bestanden
  - Besonders schlecht bestanden (+1 Malus)

== Benotung

Grundnote nach Anzahl der bestandenen Abgaben:

- Alle bestanden: 1
- 1x nicht bestanden: 2
- 2x nicht bestanden: 2.7
- 3x nicht bestanden: 3.3
- 4x nicht bestanden: 4
- Mehr als 4x nicht bestanden: 5

Gesamtnote: Grundnote #linebreak()+ je eine Notenstufe pro Bonuspunkt #linebreak()- je eine Notenstufe pro Maluspunkt 

= Kennlern-Pause

== Eigenschaften-Bingo

- Personen mit Gemeinsamkeiten finden, Name eintragen
- Jeder Name nur für ein Feld, Bingo: 4 in Zeile/Spalte/diagnoal

#grid(
  columns: 4,
  rows: 4,
  gutter: 0.1cm,
  inset: 0.4cm,
  align: center,
  stroke: (thickness: 1pt),
  "Lieblingsessen", "Anzahl Geschwister", "Sport (Hobby)", "Kunst (Hobby)",
  "Geburtsmonat", "Anzahl Vornamen", "Lieblingsbuch", "Haustier",
  "Geburtsjahr", "Augenfarbe", "Kleidungsstück (Farbe)", "Land besucht",
  "Stadtteil (Wohnung)", "Lieblingsfilm", "Fernseher (ja/nein)", "Musikrichtung"
)

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

- Bestes aus allen Welten wäre: Einfaches Textformat, aus dem eine PDF gebaut werden kann
- Viele Beispiele:
  - Markdown - aber weniger flexibel als z.B. Word, viele Dialekte
  - LaTeX: Sehr mächtig, aber komplex und langsam bei großen Dokumenten
  - Aktuelle Entwicklung: #link("https://typst.app/")[Typst]

== Typst-Kurzüberblick

- Typst-Compiler von #link("https://github.com/typst/typst")[github-Seite] installieren
- Alternativ: #link("https://typst.app/play/")[Online-Editor verwenden]
- Gemeinsam Grundlagen des #link("https://typst.app/docs/tutorial")[Typst-Tutorials] anschauen:
  - Text, Überschriften, Listen
  - Erste Funktion: `#image()` für Bilder
  - `#figure()`: Abbildung, z.B. für Unterschriften und Referenzen
  - Textformatierung mittels `#text()` und global mittels `#set text()`
  - Seitensetup mittels `#set page()`
  - `#grid() für Tabellen/Autoren`
- Zusätzlich zum Tutorial: 
  - `#strong[]`/`**`, `#emph[]`/`_ _`, `()` vs. `[]`, `#text(stroke: ...)`
  - `#link("https://...")[Text]`

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

- Mit Titel
- Mit Liste der Autoren (Personen in Ihrer Gruppe, mit Matrikel-Nr.)
- Ganz kurzer Text
- Bilder mit Referenzen im Text (`#image` in `#figure`, referenziert mit `@label`)

*Jede* Person aus der Gruppe gibt die PDF in Moodle als Abgabe für diesen Teil ab.
