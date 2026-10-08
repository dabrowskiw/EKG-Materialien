#let layout(title: "", author: "", doc) = [
    #align(center)[#text(weight: "bold", size: 20pt)[#title]]
    #align(right)[By #author]

#doc
]

#show: layout.with(title: "Ein Dokument", author: "icke")

Bla Text