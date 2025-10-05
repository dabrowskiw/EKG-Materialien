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


