#import "@preview/flow:0.3.2": template as _t

#let bf(content) = $upright(bold(#content))$
#let dd(variable) = $dif#variable$
#let dv(f, x) = $dd(#f)/dd(#x)$
#let inlinedv(f, x) = $dd(#f) slash dd(#x)$
#let ndv(f, x, n) = $(dif^#n #f)/(dif #x^#n)$
#let pdv(f, x) = $(partial #f)/(partial #x)$
#let npdv(f, x, n) = $(partial^#n #f)/(partial #x^#n)$
#let ang(..args) = {
  let inner = args.pos().join([$,$])
  $lr(chevron.l #inner chevron.r)$
}
#let grad = $arrow(nabla "")$
#let transpose = $sans(upright(T))$
#let evaluated(expr, size: 100%) = $lr(#expr|, size: #size)$

#let tred(x) = text(fill: red, x)
#let tblue(x) = text(fill: blue, x)
#let tgreen(x) = text(fill: rgb("#108010"), x)
#let tgray(x) = text(fill: gray, x)
#let torange(x) = text(fill: orange, x)
#let tpurple(x) = text(fill: purple, x)

#let cred(x) = tred($#x$)
#let cblue(x) = tblue($#x$)
#let cgreen(x) = tgreen($#x$)
#let cgray(x) = tgray($#x$)
#let corange(x) = torange($#x$)
#let cpurple(x) = tpurple($#x$)

#let lgreen = line(length: 100%, stroke: rgb("#108010"))
#let lorange = line(length: 100%, stroke: orange)
#let lblue = line(length: 100%, stroke: blue)

#let small(x) = text(size: 0.8em, $#x$)

#let boxed(content, stroke: black) = box(width: 100%, inset: 12pt, stroke: stroke, radius: 8pt)[#content]

#let define(title, content) = boxed(stroke: black)[
  ==== #title
  #content
]
#let derivation(title, content) = boxed(stroke: rgb("#108010"))[
  ==== #text(fill: rgb("#108010"))[#title]
  #content
]

#let example(title, content) = boxed(stroke: orange)[
  ==== #text(fill: orange)[Example: ] #title
  #content
]
#let resource(title, content, _align: center) = boxed(stroke: purple)[
  #text(fill: purple)[#align(_align)[==== #title]]
  #content
]
#let note(title: "", content) = boxed(stroke: blue)[
  #let title = if title.len() == 0 { "Note" } else { title }
  ==== #text(fill: blue)[#title]
  #content
]

#let subtext(content) = text(size: 0.8em, fill: luma(40%))[
  #content
]
#let rsubtext(content) = align(right)[#subtext[#content]]

// CeTZ helpers
#let midpoint = (p1, p2) => ((p1.at(0) + p2.at(0))/2, (p1.at(1) + p2.at(1))/2)
#let midpointn = (..points) => {
  let n = points.pos().len()
  let sum_x = points.pos().fold(0, (acc, p) => acc + p.at(0))
  let sum_y = points.pos().fold(0, (acc, p) => acc + p.at(1))
  (sum_x / n, sum_y / n)
}
#let midpoint3d = (..points) => {
  let n = points.pos().len()
  let sum_x = points.pos().fold(0, (acc, p) => acc + p.at(0))
  let sum_y = points.pos().fold(0, (acc, p) => acc + p.at(1))
  let sum_z = points.pos().fold(0, (acc, p) => acc + p.at(2))
  (sum_x / n, sum_y / n, sum_z / n)
}

// brief:
// #let example(..args) = []
// #let derivation(..args) = []    

#let template(
  title: "", 
  description: "", 
  toc_depth: 2,
  font: "sans",
  body,
) = [
  // 1. HTML helpers
  #show: it => context {
    if target() == "paged" {
      _t.generic(it)
    } else {
      it
    }
  }

  #show math.equation.where(block: false): it => {
    if target() == "html" {
      html.elem("span", attrs: (role: "math"), html.frame(it))
    } else {
      it
    }
  }

  #show math.equation.where(block: true): it => {
    if target() == "html" {
      html.elem("figure", attrs: (role: "math"), html.frame(it))
    } else {
      it
    }
  }

  // for styling, use `where` to assign classes for different types of figure
  #show figure: it => {
    if target() == "html" { 
      html.elem("figure", attrs: (class: "typst"), html.frame(it))
    } else {
      it
    }
  }

  #show grid: it => {
    if target() == "html" {
      let style = "display: flex;"
      html.elem("div", attrs: (style: style), html.frame(it))
    } else {
      it
    }
  }

  #show align: it => {
    if target() == "html" {
      let style = if it.alignment == "center" {
        "text-align: center;"
      } else if it.alignment == "right" {
        "text-align: right;"
      } else {
        ""
      }
      html.elem("div", attrs: (style: style), html.frame(it))
    } else {
      it
    }
  }

  #show h: it => {
    if target() == "html" {
      let style = if type(it.amount) == relative {
        "width: calc(" + it.amount.to_string() + ");"
      } else {
        "width: 40pt;"
      }
      html.elem("div", attrs: (style: style), "")
    } else {
      it
    }
  }

  // suppress pagebreak warnings
  #show pagebreak: it => {
    if target() == "paged" {
      it
    } else {
      []
    }
  }
  
  // 2. Define fonts

  // #set text(font: "Figtree")
  
  // #set text(font: "Fira Sans")
  // #show math.equation: set text(font: "Fira Math")
  
  // #set text(font: "Lato")
  // #show math.equation: set text(font: "Lete Sans Math")

  // #set text(font: "GFS Neohellenic")
  // #show math.equation: set text(font: "GFS Neohellenic Math")

  // #set text(font: "HK Grotesk")

  // #set text(font: "Noto Sans")
  // #show math.equation: set text(font: "Noto Sans Math")
 
  #let text_font
  #let math_font
  #if font == "sans" {
    text_font = "New Computer Modern Sans"
    math_font = "New Computer Modern Sans Math"
  } else if font == "informal" {
    text_font = "Pennstander"
    math_font = "Pennstander Math"
  } else if font == "serif" {
    text_font = "New Computer Modern"
    math_font = "New Computer Modern Math"
  } else if font == "fira" {
    text_font = "Fira Sans"
    math_font = "Fira Math"
  } else if font == "lato" {
    text_font = "Lato"
    math_font = "Lete Sans Math"
  } else if font == "gfs" {
    text_font = "GFS Neohellenic"
    math_font = "GFS Neohellenic Math"
  } else if font == "times" {
    text_font = "XITS"
    math_font = "XITS Math"
  } else {
    text_font = font
    math_font = font + " Math"
  }

  #set text(font: text_font)
  #show math.equation: set text(font: math_font)

  // 3. Define heading styles/numbering
  #set heading(numbering: "1.1")
  #show heading.where(level: 1): set text(size: 24pt)
  #show heading.where(level: 2): set text(size: 20pt)
  #show heading.where(level: 3): set text(size: 16pt)
  #show heading.where(level: 4): set text(size: 13pt)
  #show heading.where(level: 5): set text(size: 11pt)
  #show heading.where(level: 6): set text(size: 9pt)
  
  #show heading.where(level: 3): set heading(numbering: none)
  #show heading.where(level: 4): set heading(numbering: none)
  #show heading.where(level: 5): set heading(numbering: none)
  #show heading.where(level: 6): set heading(numbering: none)
  
  // 4. Document layout
  #set math.equation(numbering: none)
  #set math.mat(delim: "(")
  #v(1fr)
  #[
    #set text(size: 24pt)
    #set align(center)
    *#title*

    #set text(size: 12pt)
    #if description.len() > 0 [ #description \ ]
    Jaysen Tsao
  ]

  #outline(title: [], depth: toc_depth)
  #v(1fr)

  #pagebreak()
  #body
]

#let set_unit_number(k, body) = [
  #set heading(numbering: (..n) => {
    let nums = n.pos()
    if nums.len() > 0 {
      nums.at(0) = k
    }
    numbering("1.1", ..nums)
  })
  #body
]

#let reset_unit_number(body) = [
  #set heading(numbering: "1.1")
  #body
]