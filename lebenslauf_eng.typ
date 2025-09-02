#import "@preview/fontawesome:0.5.0": *

#let cv(body) = {
  set document(author: "Michael Reinegger", title: "Resume")
  set text(font: "Lucida Sans", lang: "en", weight: "medium", size: 10pt)
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

  // Custom styling for links (underlined and colored)
  show link: it => text(fill: primary-color, underline(it.body))

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
        #place(top, box(width: level * 100%, height: bar-height, fill: primary-color, radius: bar-height / 2))
      ]
    ]
  }

  grid(
    columns: (sidebar_width, 1fr),
    gutter: 5mm,
    // Left column with background
    block(fill: secondary-color, width: 100%, inset: 10pt, radius: 10pt, {
      align(left)[
        // Add profile image
        #align(center)[
          #box(width: 120pt, height: 120pt, radius: 60pt, clip: true, image("Michael_Reinegger.jpg"))
        ]
        #text(24pt, weight: "bold", primary-color)[Michael Reinegger]

        == CONTACT
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
        == SKILLS
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
        #stack(spacing: 0.5em, skill-with-level("Flutter", 0.2, "flutter"), skill-with-level("Kotlin", 0.7, "k"))

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

        == LANGUAGES
        - German (Native)
        - English (B2)
        #v(1em)

        == OTHER
        - Driver's License (B)
        #v(1em)

        == HOBBIES
        - Programming
        - Capture The Flag
        - Running (Longest Run: Wolfganseelauf)
        - 3D Printing and CAD Modeling (#link("https://www.printables.com/@MrCode_1053723")[3D Models])
        - Arduino, Raspberry Pi
        - Cooking and Baking
        - Hiking
        - Climbing
      ]
    }),
    // Right column
    [
      = EDUCATION

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
            text(weight: "bold", size: 11pt)[#institution], text(fill: text-gray, style: "normal")[#period],
          )
          #text(fill: primary-color, weight: "medium")[#degree]
          #v(4pt)
          #list(
            spacing: 0.75em,
            marker: text(fill: primary-color, "◈"),
            ..details,
          )
        ]
      ]

      #education-entry("Computer Science Master", "Johannes Kepler University Linz", "2024 - Present", (
        "Major: Networks and IT Security",
      ))

      #education-entry("Bachelor in Computer Science", "Johannes Kepler University Linz", "2021 - 2024", (
        "Bachelor Thesis: Optimizing LSTM-based Speaker Diarization: Comparing Architectures and Clustering Methods",
      ))

      #education-entry(
        "Higher Technical College Matura Mechatronics",
        "Höhere Technische Lehranstalt Steyr",
        "2015 - 2020",
        (
          "Focus: Mechatronics",
        ),
      )

      = PROFESSIONAL EXPERIENCE

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
            if type(period) == array {
              stack(dir: ltr, spacing: 1em, ..period.map(p => text(fill: text-gray, style: "normal")[#p]))
            } else {
              text(fill: text-gray, style: "normal")[#period]
            },
          )
          #text(fill: primary-color, weight: "medium")[#role]

          #list(
            spacing: 0.7em,
            marker: text(fill: primary-color, "◈"),
            ..details,
          )
        ]
      ]

      // Remove the outer block and stack, just list entries directly
      #experience-entry(
        "Intern Software Development",
        "Dynatrace Austria - Engineering Headquarters",
        "08.2025 - 09.2025",
        (
          "Development of internal authorization management tool",
        ),
      )

      #experience-entry("Student Assistant", "JKU Linz - Institute for Complex Systems", "10.2024 - 06.2025", (
        "Correction of homework for Digital Circuits",
        "Correction of homework for Computer Architecture",
      ))

      #v(5pt) // Add some spacing between entries

      #experience-entry("Summer Intern - Software Development", "Ventopay GmbH - Hagenberg", "07.2024 - 07.2024", (
        "Angular and C# development of an existing system",
        "UI/UX development with focus on accessibility",
      ))

      #v(5pt) // Add some spacing between entries

      #experience-entry("Student Assistant", "JKU Linz - Institute for Complex Systems", "10.2023 - 06.2024", (
        "Correction of homework for Digital Circuits",
        "Correction of homework for Computer Architecture",
      ))

      #v(5pt) // Add some spacing between entries

      #experience-entry(
        "Summer Intern - Software Development",
        "Bosch GMBH - Engineering Center Linz",
        "08.2023 - 09.2023",
        (
          "Development of a dashboard for team-relevant information with Sveltekit and TailwindCSS",
          "Data querying and processing with RESTful APIs, Proxy APIs and HTML-Scraping",
        ),
      )

      #v(5pt) // Add some spacing between entries

      #experience-entry("Summer Intern - Assembly and Testing", "Bosch Rexroth GMBH - Pasching", "06.2021 - 06.2021", (
        "Assembly of cable ducts and switch cabinets",
        "Setup and testing of hydraulic systems",
      ))

      #v(5pt) // Add some spacing between entries

      #experience-entry("Civil Servant", "Herz-Kreislauf-Zentrum - Bad Ischl", "09.2020 - 05.2021", (
        "Support of office staff",
        "Care of patients",
      ))

      #v(5pt) // Add some spacing between entries

      #experience-entry("Mandatory Internship", "Engel Austria GMBH - Dietach", "07.2018 - 07.2018", (
        "Data processing with Excel",
        "Assistance in production",
      ))

      #v(5pt) // Add some spacing between entries

      #experience-entry("Mandatory Internship", "Engel Austria GMBH - St. Valentin", "07.2017 - 07.2017", (
        "Assistance in production",
        "Electrical wiring of injection molding machines",
      ))

      = PROJECTS

      #experience-entry(
        "HTML, CSS, JavaScript, GitHub Actions, Caddy Server",
        "Personal Homepage - mljr.eu",
        link("https://mljr.eu")[mljr.eu],
        (
          "Development of a personal website",
          "Landing page and resume with HTML, CSS and JavaScript",
          "Use of GitHub Actions for CI/CD",
        ),
      )

      #v(5pt)

      #experience-entry(
        "SvelteKit, Pocketbase, go, TailwindCSS, RESTful APIs",
        "Sudoku Generator and Printer",
        (link("https://github.com/MrCodeEU/sudoku-gen")[Github], link("https://sudoku.mljr.eu")[sudoku.mljr.eu]),
        (
          "Storing generated Sudokus in a database",
          "Filtering Sudokus for printing with or without solution and colors",
          "Support for 9x9, 12x12 and 16x16 Sudokus",
        ),
      )
      #v(5pt)

      #experience-entry(
        "Python, Torch, Pyannote, Keras, Scikit-learn, Matplotlib",
        "Bachelor Thesis - Speaker Diarization",
        link("https://github.com/MrCodeEU/LSTM-Based-Speaker-Diarization")[Github],
        (
          "Implementation of LSTM networks for Speaker Diarization",
          "Training and evaluation of different models",
          "Comparison of different clustering methods and architectures",
        ),
      )
      #v(5pt)

      // #experience-entry(
      //   "Flutter, Dart, Kotlin (Ktor), PocketBase, SQL",
      //   "Board Games Statistics App",
      //   link("https://github.com/MrCodeEU/")[In Development],
      //   (
      //     "Account management and statistics for board games",
      //     "Development of a mobile app and website with Flutter",
      //     "A REST API for communication with the SQL database"
      //   )
      // )

      #experience-entry(
        "Kotlin, Compose Multiplatform UI Framework",
        "Conway's Game of Life - Multiplatform",
        (
          link("https://github.com/MrCodeEU/Game-of-Life-Multiplatform")[Github],
          link("https://mljr.eu/game-of-life/")[mljr.eu/game-of-life/],
        ),
        (
          "Implementation of Conway's Game of Life in Kotlin Multiplatform",
          "Use of Compose for the user interface",
          "Deployment for Android, Web and Desktop",
        ),
      )
    ],
  )
}

#cv[]
