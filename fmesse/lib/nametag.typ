#import "@preview/one-liner:0.3.0": fit-to-width
#import "/lib/style.typ": flue, logo

#let nametag(
  name,
  role,
  year: none,
  cutBorder: true
) = context {
  // Constants
  let tagSize = (width: 91mm, height: 57mm)
  let upperNameSize = 50pt
  let otherTextSize = 20pt
  let gutterWidth = 3mm
  let marginWidth = 2mm
  let cutoutPadding = 5mm

  // Derived constants
  let logoSize = upperNameSize * 0.8

  // Set rules
  set align(center)
  set text(fill: white)

  let tagYear = if year == none {
    datetime.today().year()
  } else { year }

  let tagContent = grid(
    rows: (1em, auto, 1em),
    gutter: (10mm, 5mm),
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
  ][
    #set text(size: otherTextSize)
    --- #role ---
  ]

  let tag = align(center + horizon)[
    #block(
      width: tagSize.width,
      height: tagSize.height,
      fill: flue,
      inset: marginWidth,
      tagContent,
    )
  ]

  if cutBorder {
    block(
      fill: fuchsia,
      width: tagSize.width + cutoutPadding,
      height: tagSize.height + cutoutPadding,
    )[
      #tag
    ]
  }
  else {
    tag
  }
}