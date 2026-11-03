#import "lib/nametag.typ": nametag

#set page(flipped: true, margin: 0pt)

#let people = (
  (name: "Kresten", role: "Formand"),
  (name: "Daniel", role: "Arrangør"),
  (name: "Amalie", role: "Messe Assistent"),
  (name: "Jae", role: "Messe Assistent"),
  (name: "Jeff", role: "Messe Assistent"),
  (name: "Lukas", role: "Arrangør"),
  (name: "Luna", role: "Messe Assistent"),
  (name: "Nicolai", role: "Messe Assistent"),
  (name: "Thomas", role: "Messe Assistent"),
  (name: "Nielda", role: "Arrangør"),
  (name: "Mathias", role: "Arrangør"),
  (name: "Emin", role: "Messe Assistent"),
  (name: "Bjarne", role: "Messe Assistent"),
)

#let nametags = people.map(p => {
  nametag(p.name, p.role)
})

#set grid.cell(breakable: false)

#for chunk in nametags.chunks(9) {
  grid(columns: (auto, auto, auto), ..chunk)
  pagebreak()
  pagebreak()
}

