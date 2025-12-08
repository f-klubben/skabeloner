#import "@preview/one-liner:0.2.0": *

#set page("a3", margin: (top: 0cm, left: 0cm, right: 0cm, bottom: 0cm))

// Variables
#let frontpage-text-fill = white
#let card-width = 12cm
#let sponsor-logos = ("sponsor/xci.png", "sponsor/adsl.png", "sponsor/prosa.svg", "sponsor/BankData-Blue-Dark.svg",)
#let stregsystem-blå = rgb("#001679")
#let backside-color = stregsystem-blå
//#let top-backside-color = rgb("#D4AF37") // golden
#let top-backside-color = rgb("#ffffff")

#let participants = (
  ("Kresten", "Næstformand"),
  ("ForKat", "Forkat"),
  ("Topholt", "F-Kult Instruktør"),
  ("En BoAnd", "F-Kult Instruktør"),
  ("En BoAnd", "F-Kult Instruktør"),
  ("En Boand", "F-Kult Instruktør"),
  ("En Boand", "F-Kult Instruktør"),
  ("En Boand", "F-Kult Instruktør"),
  ("En Boand", "F-Kult Instruktør"),
  ("____", none),
  ("____", none),
  ("____", none),
)
#let count = participants.len()

#let default-member-title = "Fember"

// Resources
#let flogo = image("graphics/logo-white.svg")
#let cornor-decor = image("graphics/santa-sled.png")
#let font-name = "Atma"
#let font-header = "Allura"


// Translation functions

#let prepare-name(fullname) = {
  /*  
  let parts = fullname.split(" ")
  let first-name = parts.at(0)

  if parts.len() > 1 {
    let second-name-initial = parts.last().at(0)
    first-name + " " + second-name-initial + "."
  }
  else {
    first-name
  }*/
  
  fullname
}

#let prepare-member-title(title) = {
  if title == none {
    default-member-title
  } else {
    title
  }
}

// Cards
#set text(fill: frontpage-text-fill)

#let feaster-title(color) = box(height: 1cm, stack(
  dir: ltr
)[
  #text(size: 25pt, fill: color, font: font-name, "F-Julefrokost 2025")
])

#let card-header(color) = grid(
  columns: (20%, 60%, 20%),
  rows: (auto),
  align: center + horizon,

  scale(x: -100%, cornor-decor),
  feaster-title(color),
  cornor-decor,
)

#let card-footer() = grid(
  columns: (15%, 70%, 15%),
  rows: (auto),
  align: center + horizon,

  scale(x: -100%, cornor-decor),
  box(),
  cornor-decor,
)

#let top-layout(header-color, content) = grid(
  columns: (auto),
  rows: (15%, 70%, 15%),
  align: center + horizon,
  card-header(header-color),
  content,
  card-footer()
)

#let top-back-content() = top-layout(
  white,
  stack(
    dir: ltr,
    spacing: 0.5cm,
    ..sponsor-logos.map(src => image(src, width: 2.5cm))
  )
)

#let top-front-content(name) = top-layout(
  frontpage-text-fill,
  grid(
      columns: (15%, 70%, 15%),
      rows: (20%, 60%, 20%),
      align: center + horizon,
      [], [], [],
      flogo,
      align(center + horizon, fit-to-width(text(font: font-header, prepare-name(name.at(0))))),
      flogo,
      [],
      align(center + horizon, text(size: 18pt , "— " + prepare-member-title(name.at(1)) + " —")),
      [],
    )
)

#let background-image(img, content) = {
  rotate(180deg,
    block(
      height: 100%,
      fill: stregsystem-blå,
      rotate(180deg,
        image(img, fit: "stretch", width: 100%)
      )
    )
  )
  place(
    top + left,
    block(inset: 0.2cm, width: 100%, height: 100%, [
      #content
    ]
  ))
}

#let top-back() = box(fill: top-backside-color, inset: 0.1cm, top-back-content())

#let top-front(name) = background-image("graphics/snow.png", top-front-content(name))

#let top-placecard(name) = block(
  stack(
    dir: ttb,
    block(height: 50%, rotate(180deg)[#top-back()]),
    block(height: 50%, top-front(name)),
  )
)

#let sangtekst-del(part-index) = block(
  if (part-index == 0) {
    block[
      #text(size: 18pt, fill: white, "Fottesangen - Del A")\
      #text(fill: white, emph[Lorenzen - Mel: Midt om natten])
      
      #columns(1, text(fill: white, [
        F-otterne kom helt uventet af dem, i garagen\
        Så skrald og pant var på den igen, i garagen\
        De gnavede sig gennem pant-poserne\
        Så trillede på jorden alle dåserne\
        Åh Jaaa...\
        I garagen\
        I garagen
        
        \
        Det næste der skete, tør jeg ikke tænke på, i garagen\
        Porten var låst, vi ku' ikke komme ind, i garagen\
        Hvad skal vi øre med poserne?\
        Det ikke vores skyld, det er bare F-otterne\
        Sagde facility...\
        Om garagen\
        Om garagen
        #colbreak(weak: true)
    ]))
    ]
  } else {
    columns(1, text(fill: white, [
      #text(size: 18pt, fill: white, "Fottesangen - Del B")\
      #text(fill: white, emph[Lorenzen - Mel: Midt om natten])
      \
      \
      De lukkede op, for at gøre' lortet rent, i garagen\
      De sagde "Tag nogle ting", og vi svarede "tak for det", i garagen\
      Nu glæder vi os til at bruge den igen\
      Før vi skal flytte fra hus og fra hjem\
      Og dér kommer F-otterne vel næppe på besøg\
      Igen...\
      |: I garagen\
      I garagen :| x2
      #colbreak(weak: true)
      \

      #emph[
      |: Åh, vor' dukse\
      Håber i læ-ser jeres mails :| x3\
      Åh...
      ]
      \
    ]))
  }
)

#let bottom-content(song-index) = block(
  inset: 0.1cm,
  stack(dir: ttb,
    // Lyrics
    block(height: 75%, [      
      #sangtekst-del(song-index)
      /*
      #text(size: 18pt, fill: white, "Vi er ikke humanister")\
      #text(fill: white, emph[Melodi: Vi er ikke rigtig voksne])
      
      #columns(text(fill: white, [
        #emph[
        Vi er ikke humanister\
        Vi har ikke samfundsfag\
        Medicin er også noget for de andre\
        Vi er ikke teologer og går ik' på Business School\
        og de andre synes ikke vi er cool\
        ]
        \ \
        Når jeg vil ud og danse hele natten, siger de:\
        Du har ingen rytmesans!\
        Alle tænker bare: stands!\
        Men når de vil have drenge med til fester hører vi\
        at de pludselig kan li' datalogi\
        #colbreak(weak: true)
        
        I hverdagen der skal vi ikke sende dem et nik\
        Du er ikke lækker nok!\
        Du er bare et lille pjok!\
        Men når de skal bruge laser eller nano-mekanik\
        er de blevet meget glade for fysik\
        #colbreak(weak: true)
        
        Hvis vi vil sige noget får vi bare deres blik:\
        Hey - hvem tror du dog du er?\
        Du er lige meget her\
        Men hvis de så har et spørgsmål til en vigtig statistik\
        ved de godt at svaret er på mat'matik\
        \
        ]))*/
      ]),
      block([
        #set text(fill: white)
        #text(size: 18pt, fill: white, "Følger du F-Klubben?")
        #grid(
          rows: 1,
          columns: 3,
          gutter: 0.5cm,
          figure(image("graphics/qr-facebook.svg", width: 1.5cm), caption: [Facebook]
          ),
          figure(image("graphics/qr-instagram.svg", width: 1.5cm), caption: [Instagram]
          ),
          figure(image("graphics/qr-linkedin.svg", width: 1.5cm), caption: [LinkedIn]
          )
        )
      ])
  )
)


#let bottom-placecard(song-index) = box(
  fill: backside-color,
  height: 100%,
  width: 100%,
  stroke: black,
  box(inset: 10pt, bottom-content(song-index))
)

#let cards-per-page = 6

#let all-placecards(names) = {
  let placecards = ()

  let chunked-placecards = names.chunks(cards-per-page)

  for page-cards in chunked-placecards {
    for i in (1, 2) {
      let front = calc.rem(i, 2) == 1
      
      /*if (not front) {
        continue;
      }*/
      for (j, el) in page-cards.enumerate() {
        let card = if front {
          top-placecard(el)
        } else {
          bottom-placecard(calc.rem(j, 2))
        }

        //let rotated = rotate(
        //  if calc.rem(j, 2) == 0 { 0deg } else { 180deg},
        //  card
        //)
        let rotated = card

        if front {
          placecards.push(rotated)      
        } else {
          placecards.push(rotate(180deg, rotated))
        }
      }
    }
  }

  placecards
}

#align(center,
 grid(
  columns: (card-width, card-width),
  rows: (33.3%, 33.3%, 33.3%),
  gutter: (0.0cm, 0.0cm),

  ..all-placecards(participants)
  ) 
)
