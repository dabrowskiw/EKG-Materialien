#import "header.typ": *

#show: htwslides
#set page(margin: (bottom: 0.1cm))

#title-slide(
  title: [Einführung in #linebreak() Kultur und Gesundheit],
  subtitle: "Einführung und Typst",
  institution-name: "HTW Berlin"
)

#let task=[
- Abgabe: Kurzes "Paper" zu einem beliebigen Thema, mit mindestens:
  - Angabe des Autors (oder der Autoren bei Gruppenabgabe, bis 3 Personen) - eingelesen *aus toml-Datei*
  - 1 Abbildung (mit Unterschrift)
  - 1 Tabelle (mit Unterschrift) #sym.arrow `#table` #doclink("https://typst.app/docs/guides/tables/")
  - 2 Quellenangaben (im Text zitiert)
  - Einem #link("https://typst.app/universe/search/?kind=templates")[Template] mit Link zum Template im Dokument
  - Einem beliebigen weiteren Paketen aus Typst Universe 
]

= Allgemeines

== Vorgehen heute

- Arbeit weiter:
  - Online in #link("https://typst.app")[Typst.app]
  - Oder lokal mit #link("https://katvan.app/")[Katvan]
- Einfach weiter mitmachen und ausprobieren
#task

= Typst-Grundlagen

== Modes

Recap modes:
- Text: Default, `[ Text ]`
#uncover("2-")[- Code: Variablen, Funktionen, Schleifen etc.: `#Befehl(Argumente)`]
#uncover("3-")[- Math: Formeln: `$ Formel $` #doclink("https://typst.app/docs/reference/math/"), Referenzieren nur mit Nummerierung]
#uncover("5-")[- Listing: ```` ```Sprache Code``` ```` #doclink("https://typst.app/docs/reference/text/raw/"), Referenzieren nur in `#figure`]
#v(-0.2cm)
#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
= Text
Das hier ist ganz viel Text.
== Auffällig
Diese Dinge fallen auf:
+ *bold*
+ _kursiv_
== Unnummeriert
Listen können:
- nummeriert
- unnummeriert
sein.
    ```,
    image(width: 55%, "typ2.1.jpg") 
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 5cm, height: 4cm)
Ein #text(fill: red, "Bild")! #lorem(2)..
#align(center+bottom)[
    #box(
    stroke: 2pt+rgb("2277ff"),
    fill: aqua,
    inset: 5%, 
    image(width: 80%, "cliff.jpg")
    )
]
    ```,
    image("typ2.2.jpg")
  )
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 10cm, height: 4.5cm, margin: 0.5cm)
$ f(x) = a_0 + sum_(n=0)^infinity (
  a_n cos (n pi x)/L +
  b_n sin (n pi x)/L
) $
$ x = (-b plus.minus sqrt(b^2 - 4a c))/(2a c) $
    ```,
    image("typ2.3.jpg")
  )
]
#only(4)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set text(lang: "de")
#set math.equation(numbering: "1")
#set page(width: 10cm, height: 4.5cm, margin: 0.5cm)
@f1 ist wichtig, @f2 noch wichtiger!

$ f(x) = a_0 + sum_(n=0)^infinity (
        a_n cos (n pi x)/L +
        b_n sin (n pi x)/L
) $<f1>
$ x = (-b plus.minus sqrt(b^2 - 4a c))/(2a c) $<f2>
    ```,
    image("typ2.4.jpg")
  )
]
#only(5)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ````typst
#set page(width: 10cm, height: 4.5cm, margin: 0.5cm)
Typst-Code für roten Text:
```typst
#text(
  color: rgb("ff0000")
)[roter Text]
```

liefert: #text(fill: rgb("ff0000"))[roter Text]
    ````,
    image("typ2.5.jpg")
  )
]

#only(6)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ````typst
#set page(width: 6cm, height: 4.5cm, margin: 0.5cm)
Der Code in @code1 liefert: #text(fill: rgb("ff0000"))[roter Text]
#figure(
    [```typst
        #text(
            color: rgb("ff0000")
        )[roter Text]
    ```],
    caption: [Code für roten Text]
)<code1>
    ````,
    image("typ2.6.jpg")
  )
]

== Scripting in Typst

Typst im Befehlsmodus ist eine vollständige Programmiersprache #doclink("https://typst.app/docs/reference/scripting/") mit:
- Variablen
- Schleifen
- Bedingungen

#sym.arrow Jeder Algorithmus in Typst umsetzbar (Turing-vollständig)!

... heißt aber nicht, dass Typst für jedes Problem das richtige Werkzeug ist (DSL, domain specific language)

== Scripting in Typst: Variablen

Variablen: Definieren mit `#let name=wert`, Verwendung im Befehlsmodus mit `name`. Wert z.B. Text#only("3-")[, Farbe]#only("4-")[, Content]#only("5-")[, Dictionary]#only("6-")[, Array]#only("7-")[, Kombination...]

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ````typst
#set page(width: 4cm, height: 2cm)
#let col="ff0000"

Alle #text(fill: rgb(col))[wichtigen] Wörter 
haben die #text(fill: rgb(col))[gleiche Farbe].
    ````,
    image("typ2.7.jpg")
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ````typst
#set page(width: 4cm, height: 2cm)
#let col="0000ff"

Alle #text(fill: rgb(col))[wichtigen] Wörter 
haben die #text(fill: rgb(col))[gleiche Farbe].
    ````,
    image("typ2.8.jpg")
  )
  Veränderung nur an einer Stelle #sym.arrow alle Textfarben ändern sich!
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ````typst
#set page(width: 4cm, height: 2cm)
#let col=rgb("ff00ff")

Alle #text(fill: col)[wichtigen] Wörter 
haben die #text(fill: col)[gleiche Farbe].
    ````,
    image("typ2.9.jpg")
  )
]

#only(4)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 4cm, height: 2cm)
#let col=[#text(fill: eastern)[tollen Teile]]

Alle #col
haben die gleichen #col.
    ```,
    image("typ2.10.jpg")
  )
]

#only(5)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#let flower1=(
    color: "red", 
    name: "roses"
)
#let flower2=(
    color: "blue", 
    name: "violets"
)
#flower1.name are #flower1.color,\ 
#flower2.name are #flower2.color.
    ```,
    image("typ2.11.jpg")
  )
  Dictionary: Bekannt aus letzter Woche\ `set page(margin: (top: 1em, bottom: 2em))`
]

#only(6)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 4cm, height: 2cm)
#let flowers=("roses", "violets")
#let colors=("red", "blue")
#flowers.at(0) are #colors.at(0),\
#flowers.at(1) are #colors.at(1).
    ```,
    image("typ2.12.jpg")
  )
  Randnotiz: `\` in Zeile 4 erzwingt Zeilenumbruch.

  Seitenumbruch: `#pagebreak()` #doclink("https://typst.app/docs/reference/layout/pagebreak/").
]

#only(7)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 4cm, height: 2cm)
#let flowers=(
    (name: "roses", color: "red"),
    (name: "violets", color: "blue")
)
#flowers.at(0).name are #flowers.at(0).color,\
#flowers.at(1).name are #flowers.at(1).color.
    ```,
    image("typ2.13.jpg")
  )
]

== Scripting in Typst: Schleifen

- Array: Mehrere Werte in einer Variable
- Schleife: "Tue etwas immer wieder für jedes Element"

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 4cm, height: 2cm)
#let flowers=(
    (name: "roses", color: "red"),
    (name: "violets", color: "blue"),
    (name: "daffodils", color: "yellow")
)
#for flower in flowers [
    #flower.name are #flower.color\ 
]
    ```,
    image("typ2.14.jpg")
  )
]

== Scripting in Typst: Bedingungen

- Bedingung (der Vollständigkeit halber): Tue etwas nur, falls...

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 4cm, height: 2cm)
#let flowers=(
    (name: "roses", color: "red", hide: false),
    (name: "violets", color: "blue", hide: false),
    (name: "daffodils", color: "yellow", hide: true)
)
#for flower in flowers [
    #if flower.hide == false [
        #flower.name are #flower.color\ 
    ]
]
    ```,
    image("typ2.15.jpg")
  )
  `true` und `false`: Standard-Werte für "ja" und "nein"
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 4cm, height: 2cm)
#let flowers=(
    (name: "roses", color: "red"),
    (name: "violets", color: "blue"),
    (name: "daffodils", color: "yellow"),
    (name: "begonias", color: "pink"),
    (name: "marigolds", color: "orange"),
)
#let hidden = ("roses", "violets")
#for flower in flowers [
    #if flower.name not in hidden [
        #flower.name are #flower.color\ 
    ]
]
    ```,
    image("typ2.16.jpg")
  )
  Abfragemöglichkeiten in Bedingung (zusätzlich zu `==`, `<`, `>`):
  - `value in arr`: "Ist `value` im Array `arr`"?
  - `value not in arr`: "Ist `value` *nicht* im Array `arr`"?
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set page(width: 4cm, height: 2cm)
#let flowers=(
    (name: "roses", color: "red"),
    (name: "violets", color: "blue"),
    (name: "daffodils", color: "yellow"),
    (name: "begonias", color: "pink"),
    (name: "marigolds", color: "orange"),
)
#let hidden = ("roses", "violets")
#for flower in flowers [
    #if flower.name not in hidden [
        #flower.name are #flower.color\ 
    ]
]

Not shown: 
#for h in hidden [ 
    - #h 
]
    ```,
    image("typ2.17.jpg")
  )
]

== Dynamische Dokumente

#show raw.where(block: true): set text(size: 14pt)

- Daten können aus Textdateien gelesen werden
- Überblick typische Formate:
  #only("2-")[
    - csv: Comma-separated values
  ]
  #only("3-")[
    - json: JavaScript Object Notation
  ]
  #only("4-")[
    - XML: eXtensible Markup Language
  ]
  #only("5-")[
    - TOML: Tom's Obvious Minimal Language 
  ]
#only(2)[
  ```csv
id,name,email
1,John,john.doe@example.com
2,Jane,janey72@test.org
  ```
]
#only(3)[
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
- Spezialisierte Funktionen für unterschiedliche Formate #doclink("https://typst.app/docs/reference/data-loading/")
]

== Dynamisches Dokument: Beispiel

`#toml` #doclink("https://typst.app/docs/reference/data-loading/toml/") liefert eine Dictionary mit Werten aus toml-Datei.

#grid(
  columns: (2fr, 1fr),
  gutter: 1em,
  [
    ```typst
#set page(width: 7cm, height: 4cm)
#let mails = toml("mails.toml")
= #mails.title

#for c in mails.users [
  #c.id: #c.name <#c.email>\ 
]
    ```
    ```toml
title = "Private Kontakte"

[[users]]
id = 1
name = "John"
email = "john.doe@example.com"

[[users]]
id = 2
name = "Jane"
email = "janey72@test.org"
  ```
  ],
  [
    #image("typ2.18.jpg")
  ]
)

== Übungsaufgabe

#grid(
  columns: (3fr, 1fr),
  gutter: 1em,
  [
    In Moodle unter "Materialien": Ordner "Hunderassen" mit mehreren Bildern.
    - Bilder runterladen
    - toml-Datei erstellen mit Bilddatei-Namen und Rassennamen
    - Typst-Datei mit Liste von Rassen mit Bilder generieren (mit `#toml` und `#for`)
  ],
  image("typ2.19.jpg")
)

== Pakete

- #link("https://typst.app/universe/")[Typst Universe]: Erweiterungspakete
- Beispiele: meander, mmdr, timeliney

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#import "@preview/meander:0.4.3"
#set page(width: 8cm, height: 8cm)
#set par(justify: true)
#meander.reflow({
  placed(top+left, image("i1.png", width: 30%))
  placed(bottom+right, dy: -22%, 
    image("i2.jpg", width: 50%))
  container()
  content[
    #lorem(12)
    - A cat
    - More cats
    #lorem(20)
  ]
})
    ```,
    image("meander.png")
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#import "@preview/mmdr:0.2.2": mermaid
#mermaid(
  "flowchart TD
    A((x, y))-->B[res=x]
    B-->C[x-=1]
    C-->D{x==0}
    D-->|ja|G((res))
    D-->|nein|E[res+=y]
    E-->F[x-=1]
    F-->D"
)
    ```,
    place(dy:-3cm, image("mermaid.png", height: 100%))
  )
]


#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#import "@preview/timeliney:0.4.0"
#import timeliney: *
#timeliney.timeline(
  {
    headerline(
      group(([*2026*], 3)), group(([*2027*], 1)))
    headerline(
      group([Q2], [Q3], [Q4]), group([Q1]))
    taskgroup(title: [*Lernen*], {
      task("Grundlagen",(from: 0, to: 2))
      task("Objektorientiert",(from: 1.5, to: 4))
    })
    milestone(at: 1.75, [MIDI-Tool])
    milestone(at: 3.75, [DICOM-Reader])
  }
)
    ```,
    image("gantt.png")
  )
]

== Übungsaufgabe

Dokument erstellen mit:

- Einer Seite A4
- Zwei figures (im Text referenziert):
  - Ein Bild
  - Ein mit Paket generiertes Bild, z.B. mit #link("https://typst.app/universe/package/lilaq/")[lilaq] 
- Textfluss um beide Figures herum (meander)
- Inhalt: Egal, kann auch `lorem()` sein.


= Templating

== Funktionen

- Templates: Erlauben die Definition wiederverwendbarer Layouts
- Umsetzung in Typst: Funktionen (Dokument-Content #sym.arrow Dokument-Content in korrektem Layout)
- Dafür eigene Funktionen: `#let` kann auch Funktion definieren
- Argumente: Mit Namen oder positional

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#let showauthor(
  color: rgb("0000ff"), 
  size: 12pt, 
  author: "?"
) = [
    #align(right)[#text(fill: color, size: size, [By: #author])]
]
Das ist ein schlauer Satz!
#showauthor()
      ```
      Named arguments mit Standardwerten
    ],
    image("typ2.20.jpg")
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#let showauthor(
  color: rgb("0000ff"), 
  size: 12pt, 
  author: "?"
) = [
    #align(right)[#text(fill: color, size: size, [By: #author])]
]
Das ist ein schlauer Satz!
#showauthor(author: "Icke", color: red)
      ```
      Named: Optional, Reihenfolge egal
    ],
    image("typ2.21.jpg")
  )
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#let showauthor(
  color: rgb("0000ff"), 
  size: 12pt, 
  author,
  pseudonym
) = [
    #align(right)[#text(fill: color, size: size, [By: #author]), a.k.a. "#pseudonym"]
]
Das ist ein schlauer Satz!
#showauthor(color: red, [Icke], [Jemand])
      ```
    ],
    image("typ2.22.jpg")
  )
  #v(-0.6cm)
  Ohne Namen: Positional, müssen angegeben werden!
]

#only(4)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#let showauthor(
  color: rgb("0000ff"), 
  size: 12pt, 
  author,
  pseudonym
) = [
    #align(right)[#text(fill: color, size: size, [By: #author]), a.k.a. "#pseudonym"]
]
Das ist ein schlauer Satz!
#showauthor(color: red, [Icke])[Jemand]
      ```
    ],
    image("typ2.22.jpg")
  )
  #v(-0.6cm)
  Letztes Positional: Kann mit `#befehl(...)[arg]` dahinter.
]


== `#show`

`#show`: Funktion auf bestimmte Content-Blöcke anwenden

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 5cm, height: 6cm)
#let amaze(color: rgb("0000ff"), txt) = [
    #text(fill: color)[✨ #box(txt) ✨]
]
#amaze[toller Text], und mehr
#amaze(color: orange)[toller Text]
      ```
      Anwendung:
      - Blau auf alle Headings level 1
      - Orange auf alle Headings level 1
    ],
    image("typ2.23.jpg")
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 5cm, height: 6cm)
#let amaze(color: rgb("0000ff"), txt) = [
    #text(fill: color)[✨ #box(txt) ✨]
]
#show heading.where(level: 1): amaze
= Kapitel
== Unterkapitel
== Unterkapitel
= Kapitel
== Unterkapitel
      ```
      Anwendung:
      - Blau auf alle Headings level 1 #sym.checkmark
      - Orange auf alle Headings level 1 
    ],
    image("typ2.24.jpg")
  )
]
#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 5cm, height: 6cm)
#let amaze(color: rgb("0000ff"), txt) = [
    #text(fill: color)[✨ #box(txt) ✨]
]
#show heading.where(level: 1): amaze
#show heading.where(level: 2): amaze.with(color: orange)
= Kapitel
== Unterkap
== Unterkap
= Kapitel
== Unterkap
      ```
      Anwendung:
      - Blau auf alle Headings level 1 #sym.checkmark
      - Orange auf alle Headings level 1 #sym.checkmark
    ],
    image("typ2.25.jpg")
  )
  #sym.arrow `.with(...)`: Standard-Argumente "voranwenden".
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 5cm, height: 6cm)
#let amaze(color: rgb("0000ff"), txt) = [
    #text(fill: color)[✨ #box(txt) ✨]
]
#show: amaze.with(color: orange)
= Kapitel
== Unterkap
== Unterkap
= Kapitel
== Unterkap
      ```
  `#show` ohne Selektor: Auf alles anwenden

  Randnotiz: Nur 2 ✨ wegen `#box`
    ],
    image("typ2.30.jpg")
  )
]

#only(4)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 5cm, height: 6cm)
#let amaze(color: rgb("0000ff"), txt) = [
    #text(fill: color)[✨ #box(stroke: 1pt+black, txt) ✨]
]
#show: amaze.with(color: orange)
= Kapitel
== Unterkap
== Unterkap
= Kapitel
== Unterkap
      ```
    ],
    image("typ2.31.jpg")
  )
]

/*== `#show`-Beispiel: `#table`

Typische Anwendung: Styling von `#table` #doclink("https://typst.app/docs/guides/tables/").

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 10cm, height: 6.5cm)
#table(
    columns: (1cm, 2fr, 3fr),
    [Nr.], [Wort], [Aussprache (IPA)],
    [1.], [appreciation], [[əˌpɹiː.ʃiˈeɪ.ʃən]],
    [2.], [excruciating], [[ɪkˈskɹuː.ʃi.eɪ.tɪŋ]],
    [3.], [autodefenestrate], [[ˌɔː.təʊ.dɪˈfɛn.ɪ.stɹeɪt]],
    [4.], [Streichhölzer], [[ˈʃtʁaɪ̯çˌhœlt͡sɐ]],
    [5.], [Aufzeichnung], [[ˈaʊ̯fˌt͡saɪ̯çnʊŋ]],
    [6.], [Eichhörnchen], [[ˈaɪ̯çˌhœʁnçən]],
)
      ```
    ],
    image("typ2.26.jpg")
  )
  Table: 
  - Beliebig viele Content-Blöcke, auf gegebene Columns verteilt
  - columns: Liste mit Breiten (absolut oder fr) oder Anzahl
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      #codly(
        highlighted-lines: (3,
        )
      )
      ```typst
#set page(width: 10cm, height: 6.5cm)
#table(
    columns: 3,
    [Nr.], [Wort], [Aussprache (IPA)],
    [1.], [appreciation], [[əˌpɹiː.ʃiˈeɪ.ʃən]],
    [2.], [excruciating], [[ɪkˈskɹuː.ʃi.eɪ.tɪŋ]],
    [3.], [autodefenestrate], [[ˌɔː.təʊ.dɪˈfɛn.ɪ.stɹeɪt]],
    [4.], [Streichhölzer], [[ˈʃtʁaɪ̯çˌhœlt͡sɐ]],
    [5.], [Aufzeichnung], [[ˈaʊ̯fˌt͡saɪ̯çnʊŋ]],
    [6.], [Eichhörnchen], [[ˈaɪ̯çˌhœʁnçən]],
)
      ```
    ],
    image("typ2.27.jpg")
  )
  Implizit: Jeder Content-Block in `#table.cell` #doclink("https://typst.app/docs/reference/model/table/#definitions-cell")\ 
  #sym.arrow Styling über `#show table.cell: funktion`
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 10cm, height: 6.5cm)
#show table.cell: strong
#table(
    columns: 3,
    [Nr.], [Wort], [Aussprache (IPA)],
    [1.], [appreciation], [[əˌpɹiː.ʃiˈeɪ.ʃən]],
    [2.], [excruciating], [[ɪkˈskɹuː.ʃi.eɪ.tɪŋ]],
    [3.], [autodefenestrate], [[ˌɔː.təʊ.dɪˈfɛn.ɪ.stɹeɪt]],
    [4.], [Streichhölzer], [[ˈʃtʁaɪ̯çˌhœlt͡sɐ]],
    [5.], [Aufzeichnung], [[ˈaʊ̯fˌt͡saɪ̯çnʊŋ]],
    [6.], [Eichhörnchen], [[ˈaɪ̯çˌhœʁnçən]],
)
      ```
    ],
    image("typ2.28.jpg")
  )
  Eigenschaften von `#table.cell`: u.A. `x`, `y` #sym.arrow Header
]

#only(4)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 10cm, height: 6.5cm)
#show table.cell.where(y: 0): strong
#table(
    columns: 3,
    [Nr.], [Wort], [Aussprache (IPA)],
    [1.], [appreciation], [[əˌpɹiː.ʃiˈeɪ.ʃən]],
    [2.], [excruciating], [[ɪkˈskɹuː.ʃi.eɪ.tɪŋ]],
    [3.], [autodefenestrate], [[ˌɔː.təʊ.dɪˈfɛn.ɪ.stɹeɪt]],
    [4.], [Streichhölzer], [[ˈʃtʁaɪ̯çˌhœlt͡sɐ]],
    [5.], [Aufzeichnung], [[ˈaʊ̯fˌt͡saɪ̯çnʊŋ]],
    [6.], [Eichhörnchen], [[ˈaɪ̯çˌhœʁnçən]],
)
      ```
    ],
    image("typ2.29.jpg")
  )
]
*/

== Template-Funktion

#only(1)[
  `#show: function.with(...)` = "Template" für Dokumentlayout 
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 8cm, height: 10cm)
#let layout(title: "", author: "", doc) = [
    #align(center)[#text(weight: "bold", size: 20pt)[#title]]
    #align(right)[By #author]
    #doc
]

#show: layout.with(title: "Ein Dokument", author: "icke")
Bla Text
      ```
    ],
    image("typ2.32.jpg")
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```typst
#set page(width: 8cm, height: 10cm)
#let layout(title: "", author: "", abstract: "", doc) = [
    #align(center)[#text(weight: "bold", size: 20pt)[#title]]
    #align(right)[By #author]
    #align(center)[
        #text(style: "italic", size: 14pt)[Abstract]\ 
        #text(style: "italic", size: 10pt)[#abstract]
    ]
    #set par(justify: true)
    #set text(size: 12pt)
    #doc
]
#show: layout.with(
    title: "Ein Dokument", 
    author: "icke",
    abstract: "Ein Beispieldokument für Layouting in Typst",
)
#lorem(36)
      ```
    ],
    [
      #image("typ2.33.jpg")
    ]
  )
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
  - `#import file.typ: function`: `file.typ` einlesen, `function` daraus importieren
  - Beispiel: `#let layout(...) = [...]` in `layout.typ`, dann:
      ```typst
#import "layout.typ": layout
#show: layout.with(
    title: "Ein Dokument", 
    author: "icke",
    abstract: "Ein Beispieldokument für Layouting in Typst",
)
#lorem(36)
      ```
    ],
    [
      #image("typ2.33.jpg")
    ]
  )
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
  - Selbes Dokument, nur `lyout.typ` verändert:
      ```typst
#let layout(title: "", author: "", abstract: "", doc) = [
    #set text(hyphenate: true, lang: "de", size: 10pt)
    #set page(columns: 2)
    #align(center)[#text(weight: "bold", size: 18pt)[#title]]
    #align(center)[By #author]
    #align(left)[
        #text(fill: blue)[Abstract]\ 
        #text(style: "italic", size: 12pt)[#abstract]
    ]
    #set par(justify: false)
    #doc
]

      ```
    ],
    [
      #image("typ2.34.jpg")
    ]
  )
]


== Typst Universe 

Diverse Templates, die diese Techniken verwenden, sind im #link("https://typst.app/universe/search/?kind=templates")[Typst-Universe] vorhanden, z.B.:
  - Journals wie #link("https://typst.app/universe/package/charged-ieee")[IEEE], #link("https://typst.app/universe/package/graceful-genetics")[Oxford Physics] oder #link("https://typst.app/universe/package/splendid-mdpi")[MDPI]
    - Befolgen oft gleiche Standard #sym.arrow oft austauschbar
    - Vorsicht, Argumentnamen für `#show` beachten!
    - Gemeinsam online anschauen
  - Alles Mögliche von #link("https://typst.app/universe/package/cram-snap")[CheatSheets] über #link("https://typst.app/universe/package/clean-print-cv")[CV] bis hin zu #link("https://typst.app/universe/package/chef-cookbook")[Rezeptbüchern]


= Zitationen und Querverweise

== Querverweise

Elemente in Typst können referenziert werden:
- Markierung mit `<Markierung>`
- Referenzierung mit `@Markierung`
- Anpassung (Sprache etc.) in `text` 

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#set text(lang: "de")
#set page(width: 8cm)
#set heading(numbering: "1.")
= Kapitel 1
#lorem(10) (siehe @Katze in @kap2) #lorem(10)

= Kapitel 2 <kap2>
#lorem(20)
#figure(
  image("img1.png"),
  caption: "Eine Katze"
)<Katze>
    ```,
    place(dy: -5cm, image("ref.png"))
  )
]

== Literaturangaben

Literatur wird im #link("https://de.wikipedia.org/wiki/BibTeX")["BibTeX-Format"] verwaltet:
- Separat in einer .bib-Datei
- Diverse Tools existieren zum Generieren, z.B. #link("https://www.bibtex.com/c/isbn-to-bibtex-converter/")[ISBN in BibTeX]
- Referenzierung mit `@NameAusBibTeX`
- Einbindung der Datei mit `#bibliography` #doclink("https://typst.app/docs/reference/model/bibliography/")
- Beispiel: Gemeinsam online, mit unterschiedlichen Zitierstilen
  - BibTeX aus Webseite oder DOI: #link("https://www.act-act-act.com/doi2bib")[DOI2BIB]
  - BibTeX aus Pubmed-ID: #link("https://www.bibtex.com/c/pmid-to-bibtex-converter/")[PMID to BibTeX converter]
  - Viele weitere Converter #sym.arrow Google hilft

== Beispiel Literaturangaben

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```bibtex
@BOOK{Adams1999-aw,
  title     = "Per Anhalter Durch Die Galaxis",
  author    = "Adams, Douglas",
  publisher = "Wilhelm Heyne Verlag",
  month     =  sep,
  year      =  1999,
  address   = "Munchen, Germany",
  language  = "de"
}
      ```
      ```typst
#set text(lang: "de")
#set page(width: 8cm, height: 10cm)

= Bücher!

Es gibt viele Bücher, aber nur in einem steht alles, was man wissen muss @Adams1999-aw.

#bibliography("example.bib")
      ```
    ],
    [
      #image("typ2.35.jpg")
    ]
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    [
      ```bibtex
@BOOK{Adams1999-aw,
  title     = "Per Anhalter Durch Die Galaxis",
  author    = "Adams, Douglas",
  publisher = "Wilhelm Heyne Verlag",
  month     =  sep,
  year      =  1999,
  address   = "Munchen, Germany",
  language  = "de"
}
      ```
Zitierstil: `style: "..."`

      ```typst
#set text(lang: "de")
#set page(width: 8cm, height: 10cm)

= Bücher!

Es gibt viele Bücher, aber nur in einem steht alles, was man wissen muss @Adams1999-aw.

#bibliography(style: "chicago-notes", "example.bib")
      ```
    ],
    [
      #image("typ2.36.jpg")
    ]
  )
]




== Abgabe

Zur Erinnerung:
#task

#focus-slide[Bearbeitungszeit für Abgabe]
