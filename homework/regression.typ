#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot

#let slope-intercept-regression(data) = {
  let n = data.len()
  let sum-x = data.map(it => it.at(0)).sum()
  let sum-y = data.map(it => it.at(1)).sum()
  let sum-xy = data.map(it => it.at(0) * it.at(1)).sum()
  let sum-x2 = data.map(it => it.at(0) * it.at(0)).sum()
  
  let denom = n * sum-x2 - sum-x * sum-x
  let slope = (n * sum-xy - sum-x * sum-y) / denom
  let intercept = (sum-y - slope * sum-x) / n

  return (slope: slope, intercept: intercept)
}

#let slope-regression(data) = {
  let n = data.len()
  let sum-xy = data.map(it => it.at(0) * it.at(1)).sum()
  let sum-x2 = data.map(it => it.at(0) * it.at(0)).sum()
  return (slope: sum-xy / sum-x2, intercept: 0)
}

#let perform-regression(
  data,
  size: (9, 5.5),
  title: "",
  x-label: "",
  y-label: "",
  legend: "inner-north-west",
  label: none,
  x-min: auto,
  x-max: auto,
  y-min: auto,
  y-max: auto,
  x-tick: auto,
  y-tick: auto,
  domain: auto,
  line: blue + 1.5pt,
  strategy: slope-intercept-regression,
) = {
  let reg = strategy(data)
  if type(label) == function {
    label = label(reg)
  }

  let plot = align(center)[
    === #title
    #canvas({
      import plot: *
      plot(
        size: size,
        axis-style: "scientific-auto",
        x-min: x-min,
        x-max: x-max,
        x-tick-step: x-tick,
        x-grid: true,
        x-label: x-label,
        y-min: y-min,
        y-max: y-max,
        y-tick-step: y-tick,
        y-grid: true,
        y-label: y-label,
        legend: legend,
        {
          add(
            data,
            line: "raw",
            style: (stroke: none),
            mark: "o",
            mark-style: (stroke: black, fill: black),
          )
          add(
            domain: domain,
            n => reg.slope * n + reg.intercept,
            style: (stroke: line),
            mark: none,
            label: label,
          )
        },
      )
    })
  ]
  return (..reg, plot: plot)
}