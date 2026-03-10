#import "@preview/zap:0.4.0"
#import "@preview/cetz:0.4.2"

// #let battery(name, node, cells: 1, width: .3, height: 1, cell-gap: none, ..params) = {
//   // Custom styling properties
//   let custom-style = (
//     width: width, // Width of a single cell pair
//     height: height,
//     gap: if cell-gap == none { width } else { cell-gap },    // Gap between cells
//   )

//   // Drawing function
//   let draw(ctx, position, style) = {
//     // Calculate total width based on number of cells
//     let total_width = cells * custom-style.width + (cells - 1) * custom-style.gap
//     let start_x = -total_width / 2

//     zap.interface(
//       (start_x, -custom-style.height / 2),
//       (start_x + total_width, custom-style.height / 2),
//       io: position.len() < 2,
//     )

//     // Loop through and draw each cell
//     for i in range(cells) {
//       let x_offset = start_x + i * (custom-style.width + custom-style.gap)
      
//       // Long line (Positive terminal side)
//       cetz.draw.line(
//         (x_offset, -custom-style.height / 2),
//         (x_offset, custom-style.height / 2),
//         ..style,
//       )

//       // Short line (Negative terminal side)
//       // Note: traditionally the shorter line is slightly thicker
//       cetz.draw.line(
//         (x_offset + custom-style.width, -custom-style.height / 4),
//         (x_offset + custom-style.width, custom-style.height / 4),
//         ..style,
//       )
//     }
//   }

//   // Component call
//   zap.component("battery", name, node, draw: draw, ..params)
// }

#let battery(name, node, cells: 1, width: .3, height: 1, cell-gap: none, show-polarity: false, ..params) = {
  // Custom styling properties
  let custom-style = (
    width: width, // Width of a single cell pair
    height: height,
    gap: if cell-gap == none { width } else { cell-gap },    // Gap between cells
  )

  // Drawing function
  let draw(ctx, position, style) = {
    let total_width = cells * custom-style.width + (cells - 1) * custom-style.gap
    let start_x = -total_width / 2
    let end_x = start_x + total_width

    // Define the interface/bounding box
    zap.interface(
      (start_x, -custom-style.height / 2),
      (end_x, custom-style.height / 2),
      io: position.len() < 2,
    )

    // Optional Polarity Labels
    if show-polarity {
      // Positive label (+) near the first (long) line
      cetz.draw.content(
        (start_x - 0.25, custom-style.height / 4 + 0.2),
        text(size: 0.8em)[$+$],
        anchor: "center"
      )
      // Negative label (-) near the last (short) line
      cetz.draw.content(
        (end_x + 0.2, custom-style.height / 4 + 0.2),
        text(size: 0.8em)[$-$],
        anchor: "center"
      )
    }

    // Loop through and draw each cell
    for i in range(cells) {
      let x_offset = start_x + i * (custom-style.width + custom-style.gap)
      
      // Long line (Positive)
      cetz.draw.line(
        (x_offset, -custom-style.height / 2),
        (x_offset, custom-style.height / 2),
        ..style,
      )

      // Short line (Negative)
      cetz.draw.line(
        (x_offset + custom-style.width, -custom-style.height / 4),
        (x_offset + custom-style.width, custom-style.height / 4),
        // // Schematic standard: the short line is often thicker
        // stroke: (thickness: 1.5pt), 
        ..style,
      )
    }
  }

  zap.component("battery", name, node, draw: draw, ..params)
}

#let inline-circuit(inner, size: 50%) = context {
  $#scale(inner, size, reflow: true)$
}