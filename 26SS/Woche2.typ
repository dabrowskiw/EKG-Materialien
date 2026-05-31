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
    subtitle: [Typst],
    short-title: [EKG - Typst],
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
#show raw: set text(size: 14pt)

#title-slide()

= Allgemeines

== Vorgehen heute

- Arbeit weiter online in #link("https://typst.app")[Typst.app]
- Gerne auch lokal installieren und ausprobieren
- Einfach mitmachen und ausprobieren
- Abgabe: Kurzes "Paper" zu einem beliebigen Thema, mit mindestens:
  - Angabe des Autors (oder der Autoren bei Gruppenabgabe, bis 3 Personen)
  - 1 Abbildung (mit Unterschrift)
  - 1 Tabelle (mit Unterschrift)
  - 2 Quellenangaben (im Text zitiert)
  - Einem #link("https://typst.app/universe/search/?kind=templates")[Template]
  - Zwei beliebigen weiteren Paketen aus Typst Universe 

= Typst-Grundlagen

== Modes

- Letztes Mal gesehen: Alles ist Text, außer mit `#` davor #sym.arrow Code
- Ganzes Bild: Unterschiedliche #link("https://typst.app/docs/reference/syntax/#modes")[Modes], unterschiedliche Behandlung:
  - Code: Variablen, Funktionen, Schleifen etc.: `#{ Code }`
  - Math: Formeln: `$ Formel $`
  - Markup, default: Text, Formatierungsanweisungen: `[ Markup ]`

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
      #{
        let from=1
        let to=10
        while from < to {
          [ From: #from #linebreak()]
          from += 1
        }
      }
    ```],
    image("code.png")
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
      $ f(x) = a_0 + sum_(n=0)^infinity (
        a_n cos (n pi x)/L +
        b_n sin (n pi x)/L
      ) $
      $ x = (-b plus.minus sqrt(b^2 - 4ac))/(2a c) $
    ```],
    image("maths.png")
  )
]

#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
      #set heading(numbering: "A.1")
      = Titel
      - Text
      - *Mehr Text*
      == Untertitel
      #lorem(6)
      #text(
        fill: color.blue,
        [Blue text is pretty.]
      )
    ```],
    image("text.png") 
  )
]

== Pakete

- #link("https://typst.app/universe/")[Typst Universe]: Erweiterungspakete
- Beispiele: meander, mmdr, timeliney

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
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
    ```],
    image("meander.png")
  )
]

#only(2)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
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
    ```],
    place(dy:-3cm, image("mermaid.png", height: 100%))
  )
]


#only(3)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
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
    ```],
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
    sourcecode[```typst
#show heading : set text(fill: rgb("ff0000"))
= Test

#show table.cell.where(y: 0): set text(weight: "bold")
#table(
  columns: (0.5fr, 1fr),
  [Titel], [Zeile], 
  [Andere], [Zeile]
)
    ```],
    image("table1.png")
  )
]


== Eigene Funktionen

Es ist möglich, mit `#let name(arg-Name1: Standardwert1, arg-Name2: Standardwert2) = {Typst-Code}` eigene #link("https://typst.app/docs/reference/foundations/function/")[Funktionen zu definieren], z.B.:

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
#let boldanditalic(bold: "...", italic: "...") = {
  [* #bold * and _ #italic _]
}
#boldanditalic(bold: "Text 1", italic: "Text 2")
    ```],
    image("bai.png")
  )
]

== Anonyme Funktionen

Beispiel im #link("https://typst.app/docs/guides/tables/")[Table Guide]. Hier "Anonyme Funktion", braucht keinen Namen und wird nur hier verwendet: `(argumente) => { Code }`

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
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
    ```],
    image("table2.png")
  )
]

== Templating

Kombination von eigenen Funktionen und `show` erlaubt #link("https://typst.app/docs/tutorial/making-a-template/")[Templates für Dokumente], da `#show` implizit das Dokument als Argument übergibt (hier `#term`):

#sourcecode[```typst
#let amazed(term) = box([✨ #term ✨])
#show: amazed /*Kein Selektor: Anwendung auf alles*/
Das hier ist ein Dokumenttext
```]

#image("amazed1.png")

== Templating-Funktion mit Dokument

Die Template-Funktion kann selber auch wieder `#show` enthalten:

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
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
    ```],
    image("amazed2.png")
  )
]


== Templating mit Namen

Mit anonymen Funktionen kann die Template-Funktion auch mehr Argumente bekommen:

#only(1)[
  #grid(
    columns: (2fr, 1fr),
    gutter: 1cm,
    sourcecode[```typst
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
    ```],
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
    sourcecode[```typst
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
    ```],
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
