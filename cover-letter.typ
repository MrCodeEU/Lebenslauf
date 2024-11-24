#import "@preview/fontawesome:0.5.0": *

#let cover-letter(body) = {
  set document(author: "Michael Reinegger", title: "Motivationsschreiben")
  set text(font: "Lucida Sans", lang: "de", weight: "medium", size: 10pt)
  set page(margin: (left: 25mm, right: 25mm, top: 15mm, bottom: 30mm))

  // Define consistent colors
  let primary-color = rgb("#1976d2")
  let secondary-color = rgb("#f5f5f5")
  let text-gray = rgb("#666666")
  rect(
    width: 100%,
    height: 15mm,
    fill: primary-color,
    [
      #align(horizon + center)[
        #text(
          fill: white,
          size: 16pt,
          weight: "bold",
        )[Motivationsschreiben],
      ]
    ],
  )
  // Header with contact information
  grid(
    columns: (auto, 1fr),
    rows: 2,
    align(left)[
      #v(2mm)
      #text(fill: text-gray)[
        Firma XYZ GmbH \
        z.Hd. Personalabteilung \
        Unternehmensstraße 1 \
        A-1234 Wien
      ]
    ],
    align(right)[
      #set text(fill: text-gray, size: 9pt)
      Michael Reinegger \
      #fa-icon("map-pin")#h(.5em) Ahornstraße 8 \
      #h(1.4em) 4484 Kronstorf \
      #fa-icon("square-phone")#h(.5em) +43 699 10145155 \
      #fa-icon("envelope")#h(.5em) michael-reinegger\@tuta.io\
      #fa-icon("link")#h(.5em) #link("https://mljr.eu")[mljr.eu]
    ],
  )

  v(15mm)
  text(fill: text-gray)[Kronstorf, am #datetime.today().display("[day].[month].[year]")]

  v(8mm)
  text(fill: primary-color, weight: 900, size: 14pt)[*Bewerbung als TODO*]

  v(5mm)
  [Sehr geehrte Damen und Herren!]

  v(3mm)

  block(
    width: 100%,
    stroke: (left: 2pt + primary-color),
    inset: (left: 8pt),
  )[
    #par(justify: true)[
      TODO: Add your motivation letter here \ \
      #lorem(50)

      #lorem(50)
      \ \
      Ich freue mich über die Möglichkeit eines persönlichen Gesprächs.
    ]
  ]

  v(3em)
  [Mit freundlichen Grüßen \
    #v(2mm)
    #image("unterschrift_black.png", width: 45mm)
    #v(2mm)
    Michael Reinegger

    //*Anlagen:* \
    //- Lebenslauf \
    //- Zeugnisse
  ]
}

#cover-letter[]