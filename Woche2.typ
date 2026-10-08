#import "header.typ": *

#show: htwslides
#set page(margin: (bottom: 0.1cm))

#title-slide(
  title: [Einführung in #linebreak() Kultur und Gesundheit],
  subtitle: "Einführung und Typst",
  institution-name: "HTW Berlin"
)


= Allgemeines

== Vorgehen heute

- Arbeit weiter:
  - Online in #link("https://typst.app")[Typst.app]
  - Oder lokal mit #link("https://katvan.app/")[Katvan]
- Einfach weiter mitmachen und ausprobieren
- Abgabe: Kurzes "Paper" zu einem beliebigen Thema, mit mindestens:
  - Angabe des Autors (oder der Autoren bei Gruppenabgabe, bis 3 Personen - eingelesen *aus toml-Datei*)
  - 1 Abbildung (mit Unterschrift)
  - 1 Tabelle (mit Unterschrift)
  - 2 Quellenangaben (im Text zitiert)
  - Einem #link("https://typst.app/universe/search/?kind=templates")[Template] mit Link zum Template im Dokument
  - Zwei beliebigen weiteren Paketen aus Typst Universe 

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

- Bedingung: Tue etwas nur, falls...

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

== Übungsaufgabe 1

Dokument erstellen mit:

- Drei figures (im Text referenziert):
  - Einem #link("https://mermaid.ai/open-source/syntax/examples.html")[Mermaid-Chart] (anderer Typ als flowchart)
  - Einem Gantt-Chart
  - Einem Bild
- Textfluss um alle 3 Figures herum (meander)
- Inhalt: Egal, kann auch `lorem()` sein.

= Fortgeschrittenes Styling

== Show-set

Mittels `#show Bedingung: set Funktion(...)` kann die Formatierung von Elementen #link("https://typst.app/docs/tutorial/advanced-styling/")[beliebig komplex angepasst] werden, beispielsweise (mit #link("https://typst.app/docs/reference/foundations/selector/")[Selektoren] auch mit komplexen Bedingungen):

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#show heading : set text(fill: rgb("ff0000"))
= Test

#show table.cell.where(y: 0): set text(weight: "bold")
#table(
  columns: (0.5fr, 1fr),
  [Titel], [Zeile], 
  [Andere], [Zeile]
)
    ```,
    image("table1.png")
  )
]


== Eigene Funktionen

Es ist möglich, mit `#let name(arg-Name1: Standardwert1, arg-Name2: Standardwert2) = {Typst-Code}` eigene #link("https://typst.app/docs/reference/foundations/function/")[Funktionen zu definieren], z.B.:

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#let boldanditalic(bold: "...", italic: "...") = {
  [* #bold * and _ #italic _]
}
#boldanditalic(bold: "Text 1", italic: "Text 2")
    ```,
    image("bai.png")
  )
]

== Anonyme Funktionen

Beispiel im #link("https://typst.app/docs/guides/tables/")[Table Guide]. Hier "Anonyme Funktion", braucht keinen Namen und wird nur hier verwendet: `(argumente) => { Code }`

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#table(
  fill: (x, y) => { 
    if calc.even(y) { 
      blue 
    } 
  },
  columns: (0.5fr, 1fr),
  ..for i in range(1,10) {
    ([Row #i], [$i^2$: #(i*i)])
  }
)
    ```,
    image("table2.png")
  )
]

== Templating

Kombination von eigenen Funktionen und `show` erlaubt #link("https://typst.app/docs/tutorial/making-a-template/")[Templates für Dokumente], da `#show` implizit das Dokument als Argument übergibt (hier `#term`):

#```typst
#let amazed(term) = box([✨ #term ✨])
#show: amazed /*Kein Selektor: Anwendung auf alles*/
Das hier ist ein Dokumenttext
```

#image("amazed1.png")

== Templating-Funktion mit Dokument

Die Template-Funktion kann selber auch wieder `#show` enthalten:

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#let amazed(doc) = [ 
  #set text(blue)
  #show "Dokumenttext" : [
    #text(
      red, 
      [veränderter Dokumentext]
    )
  ]
  #doc
]
#show: amazed
Das hier ist ein Dokumenttext
    ```,
    image("amazed2.png")
  )
]


== Templating mit Namen

Mit anonymen Funktionen kann die Template-Funktion auch mehr Argumente bekommen:

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    ```typst
#let amazed(author: "", titel: "", 
            farbe: black, dokument: "") = [ 
  #align(center, [#text(fill: farbe, [#titel])])
  #align(right, [Geschrieben von: #author])
  #dokument
]
#show: doc => amazed(
  author: "Icke", titel: "Toller Text", 
  titelfarbe: blue, dokument: doc
)

Das hier ist ein Dokumenttext
    ```,
    image("amazed3.png")
  )
]


== Templating mit Template-Dateien

Mit `#import` lassen sich Funktionen aus anderen Dateien importieren. Wenn das `#let amazed` von der vorherigen Folie in der Datei `amazing.typ` steht, funktioniert:

```typst
#import "amazing.typ": amazed
#show: doc => amazed(author: "Icke", titel: "Toller Text", 
                     titelfarbe: blue, dokument: doc)

#lorem(100) /* Generiert Lorem-Ipsum-Text mit 100 Wörtern */
```

Gemeinsam Template erweitern mit Hilfe der #link("https://typst.app/docs/")[Dokumentation]:
- Blocksatz (Auf Englisch: "justified text")
- Zwei Spalten (Titel: Google hilft, und man muss nicht alles verstehen)

== Gruppenübung 2

- Beispieldokument erstellen mit:
  - Text
  - Einer Tabelle mit mindestens 6 Zeilen und 4 Spalten
  - Mehr Text
- Zwei Templates erstellen, die als Argumente bekommen:
  - Titel
  - Autor
  - Anzahl Spalten
  - Zusatz: Hintergrundfarbe für gestreifte Tabellen (abwechselnde *Spaltenfarben*)
- PDFs Herunterladen für das Dokument mit beiden Templates

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
- Einbindung der Datei mit #link("https://typst.app/docs/reference/model/bibliography/")[bibliography-Funktion]
- Beispiel: Gemeinsam online, mit unterschiedlichen Zitierstilen
  - BibTeX aus Webseite oder DOI: #link("https://www.act-act-act.com/doi2bib")[DOI2BIB]
  - BibTeX aus Pubmed-ID: #link("https://www.bibtex.com/c/pmid-to-bibtex-converter/")[PMID to BibTeX converter]
  - Viele weitere Converter #sym.arrow Google hilft

== Typst Universe 

Diverse Templates, die diese Techniken verwenden, sind im #link("https://typst.app/universe/search/?kind=templates")[Typst-Universe] vorhanden:
- Vorlagen für wissenschaftliche Journals wie #link("https://typst.app/universe/package/charged-ieee")[IEEE], #link("https://typst.app/universe/package/graceful-genetics")[Oxford Physics] oder #link("https://typst.app/universe/package/splendid-mdpi")[MDPI]
  - Befolgen oft gleiche Standard, aber Vorsicht, Argumentnamen für `#show` beachten!
  - Gemeinsam online anschauen
- Alles Mögliche von CheatSheets über ToDo-Listen bis hin zu Folien
- Diverse Pakete, beispielsweise für #link("https://typst.app/universe/package/pintorita")[Graphen]
- Integration diverser Programmiersprachen

Die Möglichkeiten sind unbegrenzt, da Typst eine komplette Programmiersprache ist.

#focus-slide[Bearbeitungszeit für Abgabe]
