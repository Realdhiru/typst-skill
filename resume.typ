#import "private/profile.typ": candidate, summary, projects, experience, community, technical_skills, education

#set page(
  paper: "us-letter",
  margin: (x: 0.44in, top: 0.32in, bottom: 0.30in),
)

#set text(
  font: ("Liberation Serif", "TeX Gyre Termes", "DejaVu Serif"),
  size: 9.25pt,
  lang: "en",
)

#set par(justify: true, leading: 0.54em)

// Custom link styling
#let clink(url, body) = link(url)[#text(fill: rgb("#0047AB"))[#underline(stroke: 0.5pt + rgb("#0047AB"), offset: 1.5pt)[#body]]]

// Section Header with horizontal rule & clean breathing room
#let section(title) = {
  v(5.5pt)
  text(size: 10.0pt, weight: "bold")[#upper(title)]
  v(-2.8pt)
  line(length: 100%, stroke: 0.55pt + black)
  v(2.8pt)
}

// Entry header with left title and right date/location
#let entry-header(left-bold, left-normal: "", right-text: "") = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    [
      #text(weight: "bold")[#left-bold]
      #if left-normal != "" [ #text(weight: "regular")[#left-normal] ]
    ],
    [#text(weight: "regular")[#right-text]],
  )
}

#set list(marker: ([•],), spacing: 4.0pt, indent: 3pt, body-indent: 5pt)

// ---------------------------
// HEADER
// ---------------------------
#align(center)[
  #text(size: 17pt, weight: "bold")[#upper(candidate.name)]
  #v(2pt)
  #text(size: 9.0pt)[
    #candidate.location #h(5pt)|#h(5pt)
    #candidate.phone #h(5pt)|#h(5pt)
    #clink("mailto:" + candidate.email)[#candidate.email] #h(5pt)|#h(5pt)
    #clink(candidate.github_url)[#candidate.github] #h(5pt)|#h(5pt)
    #clink(candidate.linkedin_url)[#candidate.linkedin]
  ]
]

#v(-1pt)

// ---------------------------
// PROFESSIONAL SUMMARY
// ---------------------------
#section("Professional Summary")
#summary

// ---------------------------
// PROJECTS
// ---------------------------
#section("Featured Engineering Projects")

#for p in projects [
  #entry-header(
    if "url" in p and p.url != "" { clink(p.url)[#p.title] } else { p.title },
    left-normal: p.subtitle,
    right-text: p.date,
  )
  #v(1.5pt)
  #list(..p.bullets)
  #v(2.5pt)
]

#v(-2.5pt)

// ---------------------------
// EXPERIENCE & INTERNSHIPS
// ---------------------------
#section("Experience & Internships")

#for exp in experience [
  #entry-header(
    exp.company,
    left-normal: "| " + exp.role,
    right-text: exp.date,
  )
  #v(1.5pt)
  #list(..exp.bullets)
]

// ---------------------------
// OPEN SOURCE & COMMUNITY
// ---------------------------
#section("Open Source & Community")

#for comm in community [
  #entry-header(
    if "url" in comm and comm.url != "" { clink(comm.url)[#comm.organization] } else { comm.organization },
    left-normal: "| " + comm.role,
    right-text: comm.date,
  )
  #v(1.5pt)
  #list(..comm.bullets)
]

// ---------------------------
// TECHNICAL SKILLS
// ---------------------------
#section("Technical Skills")

#grid(
  columns: (auto, 1fr),
  row-gutter: 3.2pt,
  column-gutter: 5pt,
  ..technical_skills.map(item => ([*#item.at(0)*], [#item.at(1)])).flatten()
)

// ---------------------------
// EDUCATIONAL QUALIFICATIONS
// ---------------------------
#section("Educational Qualifications")

#for (i, edu) in education.enumerate() [
  #if i > 0 [ #v(1.5pt) ]
  #entry-header(
    edu.institution,
    left-normal: [– #edu.degree],
    right-text: edu.date,
  )
]
