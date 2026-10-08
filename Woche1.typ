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
- Textverarbeitung & Dateiformate
- Kurze Unterbrechung
- Einführung in Typst
- Übungsaufgabe + Abgabe 1

== Ablauf des Moduls

- Profs und Dozierende stellen sich vor
- Idee: Personen und Themen kennenlernen
  - KW 42+43: Wojtek Dabrowski, Typst
  - KW 44: NN
  - KW 45-47: Thomas Manke, Big Data Analysis
  - KW 48-49: Thomas Jung, Computergrafik+Mixed Reality
  - KW 50-51: Habakuk Israel, Usability und UX
  - KW 52: Exkursion (10 Plätze)
  - KW 1+2: Andrea Knaut, Kulturinformatik
  - KW 3: NN

== Benotung

Zu jedem Thema (-> ca. alle 2 Wochen) eine Abgabe in Moodle. 
  - Meist: halbe Seite A4 Takeaway ("Was habe ich aus diesem Teil der Veranstaltung für mich mitgenommen?") schreiben und in Moodle abgeben.
  - Abhängig von Thema, Typst: 2 Abgaben (1/Woche)
  - Deadlines beachten, sonst: 0 Punkte!

Jede Abgabe wird benotet als:
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

Randnotiz: Diese Folien sind #link("https://github.com/dabrowskiw/EKG-Materialien/blob/main/Woche1.typ")[in typst geschrieben].

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

= Typst

== Typst-Verwendung

- Langfristig sinnvoll: 
  - Typst-Compiler von #link("https://github.com/typst/typst")[github-Seite] installieren
  - Mit beliebigem *Text*-Editor Dateien bearbeiten, z.B.:
    - #link("https://notepad-plus-plus.org/")[Notepad++]: Nur Windows, generisch für alle Text-Dateien
    - #link("https://vscodium.com/")[VSCodium]: Populäre IDE für diverse Sprachen, hat Typst-Plugin
  - Mit Compiler PDF erstellen: `typst compile in.typ out.pdf`
- Zum lokalen Ausprobieren: #link("https://katvan.app/")[Katvan]: Cross-platform, Typst-spezifisch
- Schnelle Alternative: #link("https://typst.app/play/")[Online-Editor verwenden]
  - Kostenlos, ohne Registrierung
  - Mit Registrierung: Upload von Bildern, mehrere Dateien pro Projekt
- Für heute: Katvan, oder online mit Registrierung
- Allgemein: Gerne selber in's #link("https://typst.app/docs/tutorial")[Typst-Tutorial] schauen. 

== Typst-Grundlagen: Modi

Grundidee von Typst: 
- Alles ist ein "Content-Block" #sym.arrow am Ende in PDF
- Jeder Content-Block hat Eigenschaften (Farbe, Position etc.)
- Content-Blöcke können durch Befehle verändert werden

#v(-0.2cm)

#grid(
  columns: 2,
  gutter: 1em, 
  [
    #codly(
      highlights: (
        (line: 1, start: 0, end: none, tag: [Content block]),
        (line: 2, start: 0, end: none, tag: [Content block]),
      )
    )
    ```typst
    Das ist Text.
    Das ist mehr Text.
    ```
  ],
  [
    #image("typ1.jpg")
  ]
)
#v(-1cm)

Vier Modi:
- Textmodus: Text wird direkt zu Text in der PDF
- Befehlsmodus: Verändert Eigenschaften eines Content-Blocks, Text sind Befehle, Argumente oder Variblennamen
- Mathematik-Modus: Spezielle Minisprache für Formeln
- Code-Modus: ``` `code` ``` oder ```` ```code``` ```` für syntax highlighting

== Befehlsmodus

- Befehle generieren (meist) neuen Content-Block, kriegen meist Content-Block zum Verändern als Eingabe
- Befehlsmodus ausgeführt mit:
  - `#`: Nächstes Wort ist Befehl, z.B. `#Befehl(Argumente)[Content-Block]` oder `#Befehl(Argumente, Content-Block)`
  - `{ Befehle }`: Alles zwischen `{` und `}` ist Befehlsmodus (später)
- Fast alle Formatierungen passieren durch Befehle in Befehlsmodus

#grid(
  columns: 2,
  gutter: 1em, 
  [
    ```typst
Das ist #text(fill: red)[Text].

#box(
    stroke: 1pt+black, 
    fill: aqua, 
    inset: 4pt
)[Das ist] mehr Text.
    ```
  ],
  [
    #image("typ2.jpg")
  ]
)

== Textmodus

Laut #link("https://typst.app/docs/reference/text/text/")[Typst-Dokumentation]: `#text(Argumente)[content]` oder `#text(Argumente, content)` #doclink("https://typst.app/docs/reference/text/text/"). Aber:

#codly(
  annotations: (
    (start: 1, end: 1, content: [#text(fill: red)[Fehler, Variable "Text" unbekannt]]),
  )
)
```typst
Das ist #text(fill: red, Text).
```

Wechseln von Befehls- in Textmodus: `[Text]`.

#codly(
  annotations: (
    (start: 1, end: 1, content: [Funktioniert, `[Text]` ist Textmodus]),
  )
)
```typst
Das ist #text(fill: red, [Text]).
```

#pause

Randnotiz: Implizit ist jeder Inhalt im Text-Modus `#text("Inhalt")`:

```typst
#text("Das ist ")#text(fill: red, [Text]).
```

== Mischen von Modi

Häufig wilde Mischung von Text- und Befehlsmodus (hier `text` für Textfarbe und `box` #doclink("https://typst.app/docs/reference/layout/box/") für Rahmen):

#grid(
  columns: 2,
  gutter: 1em, 
  [
    ```typst
#box(
    stroke: 1pt+black, 
    fill: silver, 
    inset: 4pt,
    [
        Das hier ist 
        #text(
            fill: yellow, 
            box(
                fill: red, 
                inset: 4pt, 
                [wichtiger]
            )
        ) 
        Text
    ]
)
    ```
  ],
  [
    #image("typ3.jpg")
- Was ist in welchem Modus?
- Warum kein `#` vor `box` in Zeile 9?
  ]
)

== Shortcuts im Text-Modus

Häufig in Text:
- Überschriften, Zwischenüberschriften etc.#only(1)[: `heading` #doclink("https://typst.app/docs/reference/model/heading/")]#only(2)[: `=`, `==` etc.]
- Aufzählungen#only(1)[: `list` #doclink("https://typst.app/docs/reference/model/list/") und `enum` #doclink("https://typst.app/docs/reference/model/enum/")]#only(2)[: `-` bzw. `+` (nummeriert)]
- Bold, italic#only(1)[Argumente für `text` #doclink("https://typst.app/docs/reference/text/text/")]#only(2)[: `*text*` bzw. `_text_`]

#grid(
  columns: 2,
  gutter: 1em, 
  [
    #only(1)[
      ```typst
        #heading(level: 1)[Wichtig!]
        #heading(level: 2)[Urwichtig]
        Viele #text(weight: "bold")[wichtige] Dinge:
        #list(
            [Das ist wichtig],
            [#text(style: "italic")[Das hier] ist wichtiger]
        )
        #heading(level: 2)[Vollwichtig]
        #enum(
            [Nummern!],
            [Sieht gleich wichtiger aus!]
        )
      ```
      #v(-0.6cm)
      ...das ist aber schlecht zu lesen! So wäre LaTeX.
    ]
    #only(2)[
      ```typst
        = Wichtig!

        == Urwichtig
        
        Viele *wichtige* Dinge:
        - Das ist wichtig,
        - _Das hier_ ist wichtiger.

        == Vollwichtig
        
        + Nummern!
        + Sieht gleich wichtiger aus!
      ```
      #v(-0.6cm)
      #sym.arrow "Standard-Text" fast wie Markdown. 
    ]
  ],
  [
    #image("typ4.jpg")
  ]
)

== Spezialfunktion: `#set`

Häufige Anforderung: Alle Elemente einer Sorte gleich machen, z.B.: Alle Boxen grün.

#uncover(2)[#sym.arrow `#set befehl(arguments)` #doclink("https://typst.app/docs/reference/styling/"): Für alle Vorkommen von `befehl` Standard-Argumente setzen.]


#grid(
  columns: 2,
  gutter: 1em, 
  [
    #only(1)[
      ```typst
        #box(fill: silver, stroke: 1pt+black, inset: 4pt)[Das ist eine Box.]

        #box(fill: silver, stroke: 1pt+black, inset: 4pt)[Das ist auch eine Box.]

        Und das ist #box(fill: silver, stroke: 1pt+black, inset: 4pt)[Text in einer Box].
      ```
    ]
    #only(2)[
      ```typst
      #set box(fill: silver, stroke: 1pt+black, inset: 4pt)

      #box()[Das ist eine Box.]

      #box()[Das ist auch eine Box.]

      Und das ist #box()[Text in einer Box].
      ```
    ]
  ],
  [
    #image("typ5.jpg")
  ]
)

#pagebreak()

Erinnerung: Alles im Textmodus ist implizit `#text("Inhalt")` #sym.arrow Anpassung des ganzen Textes durch `#set`.

#grid(
  columns: 2,
  gutter: 1em, 
  [
    #only("1-")[
      ```typst
        = Eine Überschrift!

        Und unter der Überschrift steht lauter Text.
      ```
    ]
    #only("2-")[
      ```typst
        #set text(fill: red)

        = Eine Überschrift!

        Und unter der Überschrift steht lauter Text.
      ```
    ]
    #only("3-")[
      ```typst
        #set text(fill: red, style: "italic")

        = Eine Überschrift!

        Und unter der Überschrift steht lauter Text.
      ```
    ]
  ],
  [
    #only("1-")[
      #image("typ6.jpg")
    ]
    #only("2-")[
      #image("typ7.jpg")
    ]
    #only("3-")[
      #image("typ8.jpg")
    ]
  ]
)

#pagebreak()

Alles im Textmodus ist implizit in `#text()` - alles auf einer Seite ist implizit in `#page()` #doclink("https://typst.app/docs/reference/layout/page/") #sym.arrow Dokument-Formatierung mit `#set page(...)`


#only("1-2")[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
        #set page(
          width: 3cm, 
          height: 1.5cm
        )
        #align(center)[Eine kleine Seite mit Text]
      ```
    ],
    [
      #image("typ9.jpg")
    ]
  )
]
#only("2")[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
        #set page(
          width: 3cm, 
          height: 1.5cm,
          margin: 0.3cm
        )
        #align(center)[Eine kleine Seite mit Text]
      ```
    ],
    [
      #image("typ10.jpg")
    ]
  )
]

#only(3)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
        #set page(
            width: 3cm, 
            height: 1.5cm,
            margin: (top: 0.1cm, bottom: 0.6cm),
            numbering: "- 1 / 1 -" 
        )

        #align(center)[Mehrere kleine Seiten mit Text und Seiten mit Nummern]
      ```
    ],
    [
      #image("typ11.jpg")
    ]
  )
  `margin: (top: 0.1cm, bottom: 0.6cm)`: "Dictionary" #doclink("https://typst.app/docs/reference/foundations/dictionary/")
]

#only(4)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
        #set page(
            width: 3cm, 
            height: 1.5cm,
            margin: (top: 0.3cm, bottom: 0.3cm),
            footer: context [
                #align(right)[
                    #text(size: 5pt, weight: "bold")[
                        Hallo! Seite #counter(page).display("I")
                    ]
                ]
            ]
        )
        Seite mit footer.
        #pagebreak() 
        Und noch eine!
      ```
    ],
    [
      #image("typ12.jpg")
    ]
  )
  #v(-0.6cm)
  Viele Möglichkeiten #sym.arrow #link("https://typst.app/docs/guides/page-setup/#page-numbers")[Typst-Dokumentation].
]

== Nützliches: `#image`

- Einfügen von Bildern: `#image(Argumente, "Bilddatei")` #doclink("https://typst.app/docs/reference/visualize/image/")

#only(1)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
        #set page(width: 5cm, height: 6cm)

        = Bild-Seite

        Hier ist ein Bild:

        #image("cliff.jpg")
      ```
    ],
    [
      #image("typ13.jpg")
    ]
  )
]

#only(2)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
        #set page(width: 5cm, height: 6cm)

        = Bild-Seite

        Hier ist ein Bild:

        #image(
          width: 50%,
          "cliff.jpg"
        )
      ```
    ],
    [
      #image("typ14.jpg")
    ]
  )
  Randnotiz: Viele Einheiten für Längen (`pt`, `em`, `%` etc.) #doclink("https://typst.app/docs/reference/layout/length/")

  Rahmen drum: `stroke: ...`?
]

#only(3)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
      #set page(width: 5cm, height: 6cm)

      = Bild-Seite

      Hier ist ein Bild:

      #box(
          stroke: 1pt+red,
          inset: 0.5em,
          fill: rgb("7777ff"),
          image(
              width: 50%,
              "cliff.jpg"
          )
      ) 
      ```
    ],
    [
      #image("typ15.jpg")
    ]
  )

  - Modularer Aufbau: Verschachtlung statt Dopplung von Funktionalität
  - Hier: `#box` #doclink("https://typst.app/docs/reference/layout/box/") für Rahmen und Hintergrund mit `#rgb` #doclink("https://typst.app/docs/reference/visualize/color/")
]

== Nützliches: `#figure`

- Weitere allgemeine Aufgabe: Unterschriften #sym.arrow `#figure(...)` #doclink("https://typst.app/docs/reference/model/figure/")

#only(1)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
#set page(width: 5cm, height: 6cm)
= Bild-Seite
Hier ist ein Bild:
#figure(
    box(
        stroke: 1pt+red,
        inset: 0.5em,
        fill: rgb("7777ff"),
        image(
            width: 50%,
            "cliff.jpg"
        )
    ),
    caption: [Ein #text(blue)[schönes] Bild] 
) 

      ```
      "Figure"? #sym.arrow `#set text(lang: ...)`
    ],
    [
      #image("typ16.jpg")
    ]
  )
]
#only(2)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
#set text(lang: "de")
#set page(width: 5cm, height: 6cm)
= Bild-Seite
Hier ist ein Bild:
#figure(
    box(
        stroke: 1pt+red,
        inset: 0.5em,
        fill: rgb("7777ff"),
        image(
            width: 50%,
            "cliff.jpg"
        )
    ),
    caption: [Ein #text(blue)[schönes] Bild] 
) 
      ```
    ],
    [
      #image("typ17.jpg")
    ]
  )
  Was ganz anderes? #sym.arrow `#figure(kind: ..., supplement: ...)`
]

#only(3)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
#set page(width: 5cm, height: 6cm)
= Bild-Seite
Hier ist ein Bild:
#figure(
    box(
        stroke: 1pt+red,
        inset: 0.5em,
        fill: rgb("7777ff"),
        image(
            width: 50%,
            "cliff.jpg"
        )
    ),
    kind: "Landschaft",
    supplement: [Landschaft],
    caption: [Ein #text(blue)[schönes] Bild] 
) 
      ```
    ],
    [
      #image("typ18.jpg")
    ]
  )
  `kind`: Zähler, `supplement`: Beschriftung
]

== Labels und Referenzen

Textstellen markieren mit `<name>`, referenzieren mit `@name` #doclink("https://typst.app/docs/reference/model/ref/")

#only(1)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
#set text(lang: "de")
#set page(width: 5cm, height: 6cm)
= Bild-Seite
Man sieht eine in @cliffs.
#figure(
    box(
        stroke: 1pt+red,
        image(
            width: 40%,
            "cliff.jpg"
        )
    ),
    kind: "Landschaft",
    supplement: [Landschaft],
    caption: [Meer!] 
)<cliffs> 
      ```
    ],
    [
      #image("typ19.jpg")
    ]
  )
  Referenzieren von `heading`: Nur mit `numbering` #doclink("https://typst.app/docs/reference/model/heading/").
]

#only(2)[
  #grid(
    columns: (2.5fr, 1fr),
    gutter: 1em, 
    [
      ```typst
#set text(lang: "de")
#set page(width: 5cm, height: 6cm)
#set heading(numbering: "1.a)")
= Bild-Seite
Man sieht eine in @cliffs. Weiter in @sub1
#figure(
    box(
        stroke: 1pt+red,
        image(
            width: 40%,
            "cliff.jpg"
        )
    ),
    kind: "Landschaft",
    supplement: [Landschaft],
    caption: [Meer!] 
)<cliffs> 

== Weiter<sub1>
      ```
    ],
    [
      #image("typ20.jpg")
    ]
  )
]

== Vorübung 

Erstellen Sie ein Typst-Dokument mit:

- Zwei Kapiteln mit jeweils drei Unterkapiteln
- Insgesamt mindestens 3 Seiten Text
- Drei Abbildungen mit jeweils einer Referenz irgendwo Text
- Hinweis: Typst-Funktion `#lorem` #doclink("https://typst.app/docs/reference/text/lorem/")
- 10 Minuten, danach gemeinsam anschauen

== Abgabe 1

- In Gruppen von je 4-5 Personen mit einem Laptop Bilder machen von:
  - Dem Urban-Gardening-Projekt an der Spree
  - Einem Gericht in der Mensa
  - Einem Ausschnitt der Geschichte von Schöneweide (Campusmauer)
  - Einer Sitzgelegenheit im TGS
  - Einem Fahrrad
  - Einer Windturbine
  - Der Spree von oben (höher als die Mensa-Fenster)
- Dokumentieren und in Moodle abgeben, Bewertung:
  - Alle Kriterien erfüllt: Bestanden
  - Nur einige Kriterien erfüllt: Bestanden mit Malus
  - Alle Kriterien + `#grid`: Bestanden mit Bonus

#pagebreak()

Schreiben Sie in der Gruppe einen Kurzbericht über die Campus-Tour:

- Liste der Autoren (alle, mit *Name und Matrikel-Nr.*)
- Ganz kurzer Text
- Mindestens 1 Kapitel und 2 Unterkapitel
- Bilder (`#image`), Bonus: Immer mehrere Bilder in `#grid`
- Referenzen:
  - Jedes Bild referenziert als "Campus-Bild" (`supplement`)
  - Mindestens ein Kapitel/Unterkapitel referenziert

*Jede* Person aus der Gruppe gibt die Dateien in Moodle ab:
- .typ-Datei
- .pdf-Datei - max. 5 mb #sym.arrow Bilder verkleinern!
