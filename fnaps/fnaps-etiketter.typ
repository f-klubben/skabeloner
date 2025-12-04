#set page(margin: 10pt)
#set par(leading: 0.25em, justify: true)

#let fnaps = (
  // (picture path, description, amount, text color)
  ("fnaps_pære_kanel.png", "Pære, Vanilje og Kanel", 4, white),
  ("fnaps_æble_kanel.png", "Æble, Vanilje og Kanel", 2, white), 
  ("fnaps_slikstok.png", "Slikstok", 2, black),
  ("fnaps_rustne_søm.png", "Rustne søm", 2, white),
  ("fnaps_kiwi.png", "Kiwi", 2, black),
  ("fnaps_kirsebær.png", "Kirsebær", 2, white),
  ("fnaps_citron.png", "Citron", 2, black),
  ("fnaps_appelsin.png", "Appelsin", 2, black),
)

#let griddy = for fnap in fnaps {
  let n = 0;
  while n < fnap.at(2) {
    grid.cell(
      block({
        image(fnap.at(0), width: 100%)
        place(top + center, grid(
          rows: 2em,
          gutter: 10pt,
          grid.cell(y: 2, text("FNAPS", size: 30pt, fill: fnap.at(3))),
          grid.cell(y: 3, text(fnap.at(1), size: 40pt, font: "Allura", fill: fnap.at(3))),
          grid.cell(y: 6, rowspan: 3, image(if fnap.at(3) == black {"flogo.svg"} else {"flogo-white.svg"}, width: 70%)),
        ))
      })
    )

    // Increment
    n = n+1
  }
}


#grid(
  columns: (1fr,) * 2,
  gutter: 5pt,
  ..griddy.children,
)
