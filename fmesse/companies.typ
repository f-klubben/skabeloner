#import "@preview/one-liner:0.3.0": fit-to-width
#import "/lib/style.typ": flue, logo

#set page(flipped: true, margin: 0mm, fill: white)

#let companies = (
  "Company A",
  "Company B",
  "Company C",
)

#let companytag(
  name,
  year: none
) = {
  // Constants
  let upperNameSize = 150pt
  let otherTextSize = 60pt
  let gutterWidth = 8mm
  let marginWidth = 1cm
  let cutoutPadding = 5mm
  
  // Derived constants
  let logoSize = upperNameSize * 0.8
  
  // Set rules
  set align(center)
  set text(fill: white)
  
  let tagYear = if true {
    datetime.today().year()
  } else { year }
  
  let tagContent = grid(
    rows: (1em, auto, 1em),
    gutter: (5cm),
    fill: flue,
  )[
    #set text(size: otherTextSize)
    F-Messe #tagYear
    #v(30pt)
  ][
    #set text(size: upperNameSize)
    #align(center + horizon)[#grid(
      columns: (auto, auto, auto),
      rows: (logoSize),
      gutter: gutterWidth,
      logo, fit-to-width(name), logo,
    )]
  ]
  
  let tag = align(center + horizon)[
    #block(
      width: 100%,
      height: 100%,
      fill: flue,
      inset: marginWidth,
      tagContent,
    )
  ]
  
  tag
}

#let posters = companies.map(c => companytag(c))

// if printing one-sided we need to space them out
#let oneSided = posters.map(p => (p, [#v(1fr)])).flatten()

#grid(..oneSided)
