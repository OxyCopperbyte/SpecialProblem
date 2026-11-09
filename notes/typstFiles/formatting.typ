#import "@preview/equate:0.3.3": equate

#let template(body) = {
  set text(
    font: "New Computer Modern" ,
    size: 11pt,
  )

  set par(
    justify: true,
    first-line-indent: (amount: 0.5in, all: true),
    spacing: 2em,
  )

  show heading: set block(above: 3em, below: 2em)
  show: equate.with(breakable: true, sub-numbering: true)
  set math.equation(numbering: "(1.1)")

  body
}
