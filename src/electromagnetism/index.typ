#import "../../helpers/template.typ": *

#show: template.with(
  title: "Electricity & Magnetism", 
  font: "times",
)

#show figure: it => {
  html.elem("figure", attrs: (class: "typst"), html.frame(it))
}

// #include("unit_1.typ")
// #include("unit_2.typ")
// #include("unit_3.typ")
// #include("unit_4.typ")
#include("unit_5.typ")
// #include("unit_6.typ")