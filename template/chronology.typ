#import "lib.typ": *

#let dot() = {
  let size = 6pt
  box(
    width: size,
    height: size,
    radius: size / 2,
    fill: black,
  )
}

#let company_logo(size: 40pt) = {
  box(
    width: size,
    height: size,
    stroke: 1pt + black,
  )
}

#let chronology(
  company,
  ..experiences
) = {
  box[
    #company_logo()
    #company
  ]

  grid(
    columns: (auto, auto),
    column-gutter: 1em,
    row-gutter: space.big,
    ..experiences.pos().map(exp => {
      let is_last = exp == experiences.at(experiences.pos().len() - 1)
      (
        box[
          #dot()
          #if not is_last {
            context place(
              dx: 2.5pt,
              dy: 6pt,
              layout(size => {
                let m = measure(exp)
                line(
                  angle: 90deg,
                  stroke: 1.5pt + black,
                  length:  m.height
                )
              })
            )
          }
        ],
        exp
      )
    }).join()
  )
}