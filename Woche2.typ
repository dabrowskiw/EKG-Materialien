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

#title-slide()

= Allgemeines

== Vorgehen heute

- Arbeit erstmal online in #link("https://typst.app")[Typst.app]
- Gerne auch lokal installieren und ausprobieren, sprengt aber den Rahmen hier
- Einfach mitmachen und ausprobieren
- Abgabe: Kurzes "Paper" zu einem beliebigen Thema, mit mindestens:
  - 1 Abbildung (mit Unterschrift)
  - 1 Tabelle (mit Unterschrift)
  - 2 Quellenangaben (im Text zitiert)
  - Verwendung eines #link("https://typst.app/universe/search/?kind=templates")[Templates]

= Sprachelemente

== Text

Alles in Typst ist erstmal Text. Es gibt Formatierungselemente im Text:
  - `*text*`: Bold
  - `_text_`: Italic
  - `=`, `==` etc: Kapitelüberschrift, Unterkapitelüberschrift etc.
  - `- `: Aufzählungszeichen
  - `+ `: Nummeriertes Aufzählungszeichen
  - `$ $`: #link("https://typst.app/docs/reference/math/")[Formel], z.B. `$ sum_(k=0)^n k = (n(n+1))/2 $`: $ sum_(k=0)^n k = (n(n+1))/2 $

== Funktionen

Funktionen führen zusätzlichen Code aus, der:

- Elemente im Dokument hinzufügt
- Das Aussehen des Dokuments verändert
- Werte von Variablen setzt oder abruft

Funktionen:

- Beginnen mit einem `#`
- Bekommen Argumente in `()`, die Argumente können Namen haben oder über Reihenfolge definiert sein. *Datentypen beachten!*
- Gehen davon aus, dass Argumente Variablennamen sind! Text muss in `""` oder `[]`


== Funktionen-Beispiel: Text

Beispiel: #link("https://typst.app/docs/reference/text/text/")[Text-Funktion]

- Argumente beispielsweise:
  - Der Text an sich, ohne Namen (`#text("Das ist ein Text")` bzw. `#text([Das ist ein Text])`)
    - Text in `""`: Formatierung wird nicht ausgewertet
    - Text in `[]`: Content-Block, Formatierung und Funktionen gehen
    - Beispiel: `#text("Te*xt*")` vs. `#text([Te*xt*])`
  - `style`: String ("normal", "italic" oder "oblique") 
  - `weight`: Zahl oder String (bspw. "thin", "bold", "extrabold"...)
  - `fill`: Color (spezieller Datentyp - `blue` vs. `"blue"`)

== Verschachtelte Funktionen: Figure

Content-Blocks (`[]`) erlauben das Verschachteln von Funktionen, z.B. in #link("https://typst.app/docs/reference/model/figure/")[figure] und #link("https://typst.app/docs/reference/visualize/image/")[image]:

- `#image`: Bekommt einen Dateinamen, z.B. `#image("image.jpg", width: 5cm)`
- `figure`: Bekommt als erstes Argument einen Content-Block, z.B. `#figure([#image("image.jpg", width: 5cm)], caption: [Ein Bild])`, oder lesbarer:

```typst
#figure(
  [#image("image.jpg", width: 5cm)], 
  caption: [Ein Bild]
)```

== Verschachtelte Funktionen: Table

Weiteres Beispiel: #link("https://typst.app/docs/reference/model/table/")[Table-Funktion]:

- Bekommt zuerst Formatierungs-Argumente, wie `columns`
- Bekommt danach beliebig viele Content-Blöcke, die sie anordnet:
- Beliebig komplexe Tabellen durch Verschachtelung z.B. mit `#table.cell()`, Beispiele im #link("https://typst.app/docs/guides/tables/")[Tabellen-Guide]

```typst
#table(columns: (10%, 60%, 1fr),
  [1.], [Text der ersten Zeile], [Rest der ersten Zeile],
  [2.], [Text der zweiten Zeile], [*Noch mehr* Text],
  [3.], [#table.cell(colspan: 2, fill: rgb("EAF2F5"), [Das geht über zwei Spalten])]
)
```

== Gruppenübung 1

In Gruppen zu 2-3 Personen (mit jeweils mind. 1 Laptop) eine Tabelle für ein Tierheim erstellen:

- Tabelle mit einer Titel-Zeile (alles bold) und:
  - Mindestens 3 weiteren Zeilen mit den Spalten:
    - Die Art eines Tieres (Hund, Katze o.Ä.)
    - Ein Beispielbild
    - Wie viele davon im Tierheim sind
  - Einer letzten Zeile mit nur zwei Spalten:
    - Eine, die die ersten beiden überspannt, mit dem Summenzeichen 
    - Eine, in der die Gesamtanzahl der Tiere steht


= Anpassung von Dokumenten

== Show-set

Mittels `#show Bedingung: set Funktion(...)` kann die Formatierung von Elementen #link("https://typst.app/docs/tutorial/advanced-styling/")[beliebig komplex angepasst] werden, beispielsweise (mit #link("https://typst.app/docs/reference/foundations/selector/")[Selektoren] auch mit komplexen Bedingungen):

```typst
#show heading : set text(fill: rgb("ff0000"))
= Test

#show table.cell.where(y: 0): set text(weight: "bold")
#table(
  columns: (0.5fr, 1fr),
  [Titel], [Zeile], 
  [Andere], [Zeile]
)
```

== Eigene Funktionen

Es ist möglich, mit `#let name(arg-Name1: Standardwert1, arg-Name2: Standardwert2) = {Typst-Code}` eigene #link("https://typst.app/docs/reference/foundations/function/")[Funktionen zu definieren], z.B.:

```typst
#let boldanditalic(bold: "...", italic: "...") = {
  [* #bold * and _ #italic _]
}
#boldanditalic(bold: "Text 1", italic: "Text 2")
```

== Anonyme Funktionen

Beispiel im #link("https://typst.app/docs/guides/tables/")[Table Guide]. Hier "Anonyme Funktion", braucht keinen Namen und wird nur hier verwendet: `(argumente) => { Code }`

```typst
#table(
  fill: (x, y) => { 
    if calc.even(y) { 
      blue 
    } 
  },
  columns: (0.5fr, 1fr),
  [Titel], [Zeile], 
  [Andere], [Zeile],
  [mehr], [Zeilen],
)
```

== Templating

Kombination von eigenen Funktionen und `show` erlaubt #link("https://typst.app/docs/tutorial/making-a-template/")[Templates für Dokumente], da `#show` implizit das Dokument als Argument übergibt (hier `#term`):

```typst
#let amazed(term) = box([✨ #term ✨])
#show: amazed /*Kein Selektor: Anwendung auf alles*/
Das hier ist ein Dokumenttext
```

== Templating-Funktion mit Dokument

Die Template-Funktion kann selber auch wieder `#show` enthalten:

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
```


== Templating mit Namen

Mit anonymen Funktionen kann die Template-Funktion auch mehr Argumente bekommen:

```typst
#let amazed(author: "", titel: "", titelfarbe: black, 
            dokument: "") = [ 
  #align(center, [#text(fill: titelfarbe, [#titel])])
  #align(right, [Geschrieben von: #author])
  #dokument
]
#show: doc => amazed(author: "Icke", titel: "Toller Text", 
                     titelfarbe: blue, dokument: doc)
Das hier ist ein Dokumenttext
```


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
- Anpassung (Sprache etc.) ist in #link("https://typst.app/docs/reference/model/ref/")[Dokumentation] beschrieben

```typst
= Kapitel 1
#lorem(100) (siehe @Katze in @kap2) #lorem(50)

= Kapitel 2 <kap2>
#lorem(20)
#figure(
  image("image.jpg"),
  caption: "Eine Katze"
)<Katze>
```

== Literaturangaben

Literatur wird im #link("https://de.wikipedia.org/wiki/BibTeX")["BibTeX-Format"] verwaltet:
- Separat in einer .bib-Datei
- Diverse Tools existieren zum Generieren, z.B. #link("https://www.bibtex.com/c/isbn-to-bibtex-converter/")[ISBN in BibTeX]
- Referenzierung mit `@NameAusBibTeX`
- Einbindung der Datei mit #link("https://typst.app/docs/reference/model/bibliography/")[bibliography-Funktion]
- Beispiel: Gemeinsam online, mit unterschiedlichen Zitierstilen

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
