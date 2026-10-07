#import "header.typ": *

#show: htwslides

#title-slide(
  title: [Einführung in #linebreak() Kultur und Gesundheit],
  subtitle: "Einführung und Typst",
  institution-name: "HTW Berlin"
)

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
  - KW 41+42: Wojtek Dabrowski

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

== Beispiel: WYSIWYG

#grid(
  columns: 3,
  gutter: 1em,
  [
    #block(
      image(
        "office_editor.jpg",
        width: 100%,
      )
    )
  ],
  [
    #block(
      stroke: 1pt+colorsSecondary,
      image(
        "office.jpg",
        width: 100%,
      )
    )
  ]
)



== Dateiformate

- Arbeitsspeicher und Festplatte: Nur Zahlen
- Dokument: Buchstaben an unterschiedlichen Koordinaten, Bilder...
- Übersetzung Zahlen->Pixelwerte auf Bildschirm:
  - Buchstaben-Codierung: #link("https://www.asciitable.com/")[ASCII], #link("https://en.wikipedia.org/wiki/UTF-8")[UTF-8] etc.
  - Buchstaben-Aussehen: #link("https://www.fontspace.com/")[Font]
- Anordnung der Buchstaben: Dokumentdatei (Beispiele: Moodle):
  - Textdateien
  - Webseiten
  - PDF
  - Word
  - ...

== Textdatei

```text
== Ein Dokument ==

Es gibt schöne Orte (Link: https://tinyurl.com/mpz7v5w7) auf der Welt, siehe Abbildung 1.

Abbildung 1: Meer und Berge, siehe Datei cliff.jpg im selben Ordner
```

- Sehr einfach, überall ohne Probleme zu lesen/bearbeiten
- Keine Formatierung, keine Bilder
- Sieht je nach Editor überall anders aus

== HTML

```html
<h1 id="ein-dokument">Ein Dokument</h1>
<p>Es gibt <a href="https://tinyurl.com/mpz7v5w7">schöne Orte</a> auf der Welt, siehe Abbildung 1.</p>
<figure>
  <img src="cliff.jpg" width=300px alt="Schöne Orte" />
  <figcaption aria-hidden="true">Schöne Orte</figcaption>
</figure>
<p>Abbildung 1: Meer und Berge</p>
```

- Textdatei, halbwegs gut lesbar
- Überall mit einfachem Texteditor bearbeitbar
- Sieht je nach Endgerät (Browserversion, Bildschirmauflösung) überall anders aus
- Nicht für Papierdokumente/Ausdruck gedacht

== WYSIWYG

#grid(
  columns: (1fr, 2.5fr),
  gutter: 1em,
  [
    #image(
      "office_tree.jpg",
      width: 100%
    )
  ],
  [ #codly(number-format: none, display-icon: false, display-name: false)
    ```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?> <w:document xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">[...]<w:body><w:p><w:pPr><w:pStyle w:val="Heading1"/><w:bidi w:val="0"/><w:spacing w:before="240" w:after="120"/><w:ind w:hanging="0" w:start="0"/><w:jc w:val="start"/><w:rPr></w:rPr></w:pPr><w:r><w:rPr></w:rPr><w:t>Ein Dokument</w:t></w:r></w:p><w:p><w:pPr><w:pStyle w:val="BodyText"/><w:bidi w:val="0"/><w:jc w:val="start"/><w:rPr></w:rPr></w:pPr><w:r><w:rPr></w:rPr><w:t xml:space="preserve">Es gibt </w:t></w:r><w:hyperlink r:id="rId2">[...]
  ```
    #codly(number-format: numbering.with("1"), display-icon: false, display-name: false)
  ]
)
- Einfach zu bearbeiten (bei simplen Dokumenten)
- Sieht je nach Softwareversion (Spezialsoftware!) überall anders aus
- "By design" inkompatibles, extrem komplexes Format


== PDF

```pdf
%PDF-1.7
15 0 obj
<<
  /Length 16 0 R
>>
[...]
stream
0 g 0 G
0 g 0 G
0 g 0 G
BT
/F48 14.3462 Tf 133.768 657.235 Td [(Ein)-375(Dokumen)31(t)]TJ/F42 9.9626 Tf 0 -21.82 Td [(Es)-333(gibt)-334(s)1(c)27<68f66e65>-333(Orte)-333(auf)-333(der)-334(W)84(elt,)-333(siehe)-334(Abb)1(ildung)-334(1.)]TJ
0 g 0 G
[...]
```
- Sieht auf jedem Endgerät garantiert gleich aus
- Nicht sinnvoll bearbeitbar

== Text -> PDF

- Bestes aus allen Welten wäre: Einfaches Textformat, aus dem eine PDF gebaut werden kann
- Viele Beispiele:
  - Markdown - aber weniger flexibel als z.B. Word, viele Dialekte
  - LaTeX: Sehr mächtig, aber komplex und langsam bei großen Dokumenten
  - Aktuelle Entwicklung: #link("https://typst.app/")[Typst]

== Vergleich Markdown-LaTeX-Typst

#grid(
  columns: 3,
  gutter: 1em,
  [
    ```markdown
    # Ein Dokument

    Es gibt [schöne Orte](https://tinyurl.com/mpz7v5w7) auf der Welt, siehe Abbildung 1.

    ![Schöne Orte](cliff.jpg)

    Abbildung 1: Meer und Berge
    ```
  ],
  [
    #block(
      stroke: 1pt+colorsSecondary,
      image(
        "md.jpg",
        width: 100%,
      )
    )
  ]
)

== Vergleich Markdown-LaTeX-Typst

#grid(
  columns: 3,
  gutter: 1em,
  [
    ```latex
\documentclass{article}
\usepackage{graphicx}
\usepackage[ngerman]{babel}
\usepackage[hidelinks]{hyperref}
\begin{document}
  \section{Ein Dokument}

  Es gibt \href{https://tinyurl.com/mpz7v5w7}{schöne Orte} auf der Welt, siehe Abbildung \ref{berge}.

  \begin{figure}[h!]
    \centering
    \includegraphics[width=6cm]{cliff.jpg}
    \caption{Meer und Berge}
    \label{berge}
  \end{figure}
\end{document}
    ```
  ],
  [
    #block(
      stroke: 1pt+colorsSecondary,
      image(
        "latex.jpg",
        width: 100%,
      )
    )
  ]
)

== Vergleich Markdown-LaTeX-Typst

#grid(
  columns: 3,
  gutter: 1em,
  [
    ```typst
#set text(lang: "de")

= Ein Dokument

Es gibt #link("https://tinyurl.com/mpz7v5w7")[schöne Orte] auf der Welt, siehe @fig1.

#figure(
  image(
    width: 6cm,
    "cliff.jpg"
  ),
  caption: [Meer und Berge]
)<fig1>
    ```
  ],
  [
    #block(
      stroke: 1pt+colorsSecondary,
      image(
        "typst.jpg",
        width: 100%,
      )
    )
  ]
)


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
  ```csv
id,name,email
1,John,john.doe@example.com
2,Jane,janey72@test.org
  ```
]
#only(3)[
  - json: JavaScript Object Notation
  ```json
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
  ```
]

#only(4)[
  - XML: eXtensible Markup Language
  ```xml
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
  ```
]

#only(5)[
  - TOML: Tom's Obvious Minimal Language 
  ```toml
[[users]]
id = 1
name = "John"
email = "john.doe@example.com"

[[users]]
id = 2
name = "Jane"
email = "janey72@test.org"
  ```
]

#only(6)[
  - Daten aus Textdateien können in typst-Variablen geladen werden
  - Spezialisierte Funktionen für unterschiedliche #link("https://typst.app/docs/reference/data-loading/")[Formate]
]

== Dynamisches Dokument: Beispiel

#slide[
```typst
#let mails = toml("mails.toml")

= Email-Liste

Title: #mails.title \
Version: #mails.version \

#for c in mails.users [
  #c.id: #c.name <#c.email>

]
```
For-Schleife: Hier ohne Zählvariable, sondern "für jedes Element aus der Liste"
][
  ```toml
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
  ```
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

- Mit Titel
- Mit Liste der Autoren (Personen in Ihrer Gruppe, mit Matrikel-Nr., eingelesen aus `authors.toml`)
- Ganz kurzer Text
- Bilder mit Referenzen im Text (`#image` in `#figure`, referenziert mit `@label`)

*Jede* Person aus der Gruppe gibt die PDF in Moodle als Abgabe für diesen Teil ab.
