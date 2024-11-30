#import "@preview/fontawesome:0.5.0": *

#let cv(body) = {
  set document(author: "Michael Reinegger", title: "Lebenslauf")
  set text(font: "Lucida Sans", lang: "de", weight: "medium", size: 10pt)
  set page(margin: (left: 5mm, right: 5mm, top: 10mm, bottom: 5mm))

  // Define consistent colors
  let primary-color = rgb("#1976d2")
  let secondary-color = rgb("#eae9ff")
  let text-gray = rgb("#666666")

  // Custom styling for headings
  show heading: it => block[
    #set text(fill: primary-color)
    #if it.level == 1 {
      text(size: 1.3em, weight: "bold", it.body)
      line(length: 100%, stroke: .5pt + primary-color)
    } else if it.level == 2 {
      text(size: 0.9em, weight: "bold", it.body)
    } else {
      text(weight: "bold", it.body)
    }
  ]

  // Date style function
  let date-style(content) = text(fill: text-gray, weight: "medium")[#content]

  let sidebar_width = 30%

  // Skill bar function
  let skill-with-level(name, level, icon) = {
    let max-width = 100%
    let bar-height = 4pt
    block(spacing: 0.5em)[
      #if icon != "" {
        fa-icon(icon, font: "Font Awesome 6 Brands")
        h(0.5em)
      }
      #name
      #box(width: max-width)[
        #box(width: 100%, height: bar-height, fill: rgb("#e0e0e0"), radius: bar-height / 2)
        #place(
          top,
          box(width: level * 100%, height: bar-height, fill: primary-color, radius: bar-height / 2),
        )
      ]
    ]
  }

  grid(
    columns: (sidebar_width, 1fr),
    gutter: 5mm,
    // Left column with background
    block(fill: secondary-color, width: 100%, inset: 10pt, radius: 10pt,{
      align(left)[
        // Add profile image
        #align(center)[
          #box(
            width: 120pt,
            height: 120pt,
            radius: 60pt,
            clip: true,
            image("Michael_Reinegger.jpg")
          )
        ]
        #text(24pt, weight: "bold", primary-color)[Michael Reinegger]

        == KONTAKT
        #box(width: 100%)[
          #set par(leading: 1em)
          #text(fill: text-gray)[
            #fa-icon("map-pin")#h(.5em) Ahornstraße 8\ #h(1.4em)4484 Kronstorf \
            #fa-icon("square-phone")#h(.5em) +43 669 10 145155 \
            #fa-icon("envelope")#h(.5em) #link("mailto:michael-reinegger@tuta.io")[michael-reinegger\@tuta.io] \
            #fa-icon("cake")#h(.5em) 24.06.2001 in Steyr \
            #fa-icon("github")#h(.5em) #link("https://github.com/MrCodeEU")[github.com/MrCodeEU] \
            #fa-icon("linkedin-in")#h(.5em) #link("https://at.linkedin.com/in/MrCodeEU")[linkedin.com/in/MrCodeEU]\
            #fa-icon("globe")#h(.5em) Homepage: #link("https://mljr.eu")[mljr.eu]
          ]
        ]

        #v(0.5em)
        == Fähigkeiten
        #text(weight: "bold")[Frontend]
        #stack(
          spacing: 0.5em,
          skill-with-level("JavaScript", 0.7, "js"),
          skill-with-level("HTML", 0.8, "html5"),
          skill-with-level("CSS", 0.6, "css3"),
          skill-with-level("Angular", 0.6, "angular"),
          skill-with-level("Svelte", 0.6, "s"),
        )

        #v(0.5em)
        #text(weight: "bold")[All Purpose/Backend]
        #stack(
          spacing: 0.5em,
          skill-with-level("Java", 0.9, "java"),
          skill-with-level("C#", 0.9, "#"),
          skill-with-level("Python", 0.75, "python"),
          skill-with-level("Node.js", 0.6, "node-js"),
          skill-with-level("PHP", 0.4, "php"),
        )

        #v(0.5em)
        #text(weight: "bold")[Mobile]
        #stack(
          spacing: 0.5em,
          skill-with-level("Flutter", 0.2, "flutter"),
          skill-with-level("Kotlin", 0.7, "k"),
        )

        #v(0.5em)
        #text(weight: "bold")[Systems]
        #stack(
          spacing: 0.5em,
          skill-with-level("C++", 0.3, "c++"),
          skill-with-level("Rust", 0.5, "rust"),
          skill-with-level("Go", 0.3, "golang"),
        )

        #v(1em)
        #text(weight: "bold")[Software & Tools]
        #stack(
          spacing: 0.5em,
          skill-with-level("MS Office", 0.9, "microsoft"),
          skill-with-level("Git", 0.7, "git"),
          skill-with-level("Docker", 0.6, "docker"),
          skill-with-level("Linux", 0.8, "linux"),
          skill-with-level("Github Actions", 0.6, "github"),
          skill-with-level("SQL", 0.6, "database"),
          skill-with-level("RESTful APIs", 0.6, "api"),

        )

        == SPRACHEN
        - Deutsch (Muttersprache)
        - Englisch (B2)
        #v(1em)

        == SONSTIGES
        - PKW-Führerschein
        #v(1em)

        == HOBBIES
        - Programmieren
        - Capture The Flag
        - Laufen (Weitester Lauf: Wolfganseelauf)
        - 3D-Druck
        - CAD-Modellierung
        - Arduino, Raspberry Pi
        - Kochen und Backen
        - Wandern
        - Klettern
      ]
    }),
    // Right column
    [
      = AUSBILDUNG

      #let education-entry(degree, institution, period, details) = block(
        width: 100%,
        inset: (x: 0pt, y: 5pt),
        fill: white,
        radius: 4pt,
      )[
        #block(
          width: 100%,
          stroke: (left: 2pt + primary-color),
          inset: (left: 8pt),
        )[
          #grid(
            columns: (1fr, auto),
            text(weight: "bold", size: 11pt)[#institution],
            text(fill: text-gray, style: "normal")[#period]
          )
          #text(fill: primary-color, weight: "medium")[#degree]
          #v(4pt)
          #list(
            spacing: 0.75em,
            marker: text(fill: primary-color, "◈"),
            ..details
          )
        ]
      ]

      #education-entry(
        "Computer Science Master",
        "Johannes Kepler Universität Linz",
        "2024 - Heute",
        ("Major: Networks and IT Security",)
      )

      #education-entry(
        "Bachelor Informatik",
        "Johannes Kepler Universität Linz",
        "2021 - 2024",
        ("Bachelorarbeit: Optimizing LSTM-based Speaker Diarization: Comparing Architectures and Clustering Methods",)
      )

      #education-entry(
        "BHS Matura Mechatronik",
        "Höhere Technische Lehranstalt Steyr",
        "2015 - 2020",
        ("Schwerpunkt: Mechatronik",)
      )

      #education-entry(
        "Unterstufe",
        "Bundesrealgymnasium Enns",
        "2011 - 2015",
        ("Fokus: Naturwissenschaften",)
      )

      = BERUFSERFAHRUNG

      #let experience-entry(role, company, period, details) = block(
        width: 100%,
        inset: (x: 0pt, y: 5pt),
        fill: white,
        radius: 4pt,
        breakable: false,
      )[
        #block(
          width: 100%,
          stroke: (left: 2pt + primary-color),
          inset: (left: 8pt),
        )[
          #grid(
            columns: (1fr, auto),
            text(weight: "bold", size: 11pt)[#company],
            text(fill: text-gray, style: "normal")[#period]
          )
          #text(fill: primary-color, weight: "medium")[#role]

          #list(
            spacing: 0.7em,
            marker: text(fill: primary-color, "◈"),
            ..details
          )
        ]
      ]

      // Remove the outer block and stack, just list entries directly
      #experience-entry(
        "Tutor",
        "JKU Linz - Institute for Complex Systems",
        "10.2024 - Aktuell",
        (
          "Korrektur von Hausaufgaben für Digitale Schaltungen",
        )
      )

      #v(5pt) // Add some spacing between entries

      #experience-entry(
        "Ferialpraktikant - Softwareentwicklung",
        "Vento GmbH - Hagenberg",
        "07.2024 - 07.2024",
        (
          "Angular und C# Weiterentwicklung eines bestehenden Systems",
          "UI/UX Entwicklung mit Fokus auf Barrierefreiheit"
        )
      )

      #v(5pt) // Add some spacing between entries

      #experience-entry(
        "Tutor",
        "JKU Linz - Institute for Complex Systems",
        "10.2023 - 06.2024",
        (
          "Korrektur von Hausaufgaben für Digitale Schaltungen",
          "Korrektur von Hausaufgaben für Rechnerarchitektur"
        )
      )

      #v(5pt) // Add some spacing between entries

      #experience-entry(
        "Ferialpraktikant - Softwareentwicklung",
        "Bosch GMBH - Engineering Center Linz",
        "08.2023 - 09.2023",
        (
          "Softwareentwicklung verschiedener IT-Systemen",
          "Entwicklung eines Dashboard für Team relevante Informationen mit Sveltekit und TailwindCSS",
          "Datenabfrage und -verarbeitung mit RESTful APIs, Proxy APIs und HTML-Scraping"
        )
      )

      #v(5pt) // Add some spacing between entries

      #experience-entry(
        "Ferialpraktikant - Montage und Testen",
        "Bosch Rexroth GMBH - Pasching",
        "06.2021 - 06.2021",
        (
          "Montage von Kabelschächten und Schaltkästen",
          "Aufbau und Testen hydraulischer Anlagen"
        )
      )

      #v(5pt) // Add some spacing between entries

      #experience-entry(
        "Zivildiener",
        "Herz-Kreislauf-Zentrum - Bad Ischl",
        "09.2020 - 05.2021",
        (
          "Unterstützung des Büropersonals",
          "Betreuung von Patienten"
        )
      )

      #v(5pt) // Add some spacing between entries

      #experience-entry(
        "Pflichtpraktikum",
        "Engel Austria GMBH - Dietach",
        "07.2018 - 07.2018",
        (
          "Datenverarbeitung mit Excel",
          "Mithilfe in der Fertigung"
        )
      )

      #v(5pt) // Add some spacing between entries

      #experience-entry(
        "Pflichtpraktikum",
        "Engel Austria GMBH - St. Valentin",
        "07.2017 - 07.2017",
        (
          "Mithilfe in der Fertigung",
          "Elektrische Verkabelung von Spritzgießmaschinen"
        )
      )

      = PROJEKTE

      #experience-entry(
        "HTML, CSS, JavaScript",
        "Persönliche Homepage - mljr.eu",
        link("https://mljr.eu")[mljr.eu],
        (
          "Entwicklung einer persönlichen Website",
          "Landingpage und Lebenslauf mit HTML, CSS und JavaScript",
          "Verwenden von GitHub Actions für CI/CD"
        )
      )

      #v(5pt)

      #experience-entry(
        "SvelteKit",
        "Dashboard - Office TV",
        link("https://github.com/MrCodeEU/dashboard")[Github],
        (
          "Entwicklung eines Dashboards mit SvelteKit",
          "Verwendung von TailwindCSS für das Styling",
          "Verwendung von RESTful APIs für die Datenbeschaffung"
        )
      )
            #v(5pt)

      #experience-entry(
        "Python",
        "Bachelorarbeit - Speaker Diarization",
        link("https://github.com/MrCodeEU/LSTM-Based-Speaker-Diarization")[Github],
        (
          "Implementierung von LSTM-Netzwerken für Speaker Diarization",
          "Training und Evaluierung verschiedener Modelle",
          "Vergleich verschiedener Clustering Methoden und Architekturen"
        )
      )

      #experience-entry(
        "Flutter, Dart, Kotlin (Ktor), PocketBase, SQL",
        "Brettspiele Statistik App",
        link("https://github.com/MrCodeEU/")[In Entwicklung],
        (
          "Accountverwaltung und Statistiken für Brettspiele",
          "Entwicklung einer mobilen App und Webseite mit Flutter",
          "Eine REST API für die Kommunikation mit der SQL-Datenbank"
        )
      )
    ]
  )
}

#cv[]