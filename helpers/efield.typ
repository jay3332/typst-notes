#import "@preview/cetz:0.4.2"

// Returns the next point given current (x, y) and step size h
#let rk4-step(p, q, x, y, h) = {
  let k1x = p(x, y)
  let k1y = q(x, y)

  let k2x = p(x + 0.5 * h * k1x, y + 0.5 * h * k1y)
  let k2y = q(x + 0.5 * h * k1x, y + 0.5 * h * k1y)

  let k3x = p(x + 0.5 * h * k2x, y + 0.5 * h * k2y)
  let k3y = q(x + 0.5 * h * k2x, y + 0.5 * h * k2y)

  let k4x = p(x + h * k3x, y + h * k3y)
  let k4y = q(x + h * k3x, y + h * k3y)

  let next-x = x + (h / 6.0) * (k1x + 2 * k2x + 2 * k3x + k4x)
  let next-y = y + (h / 6.0) * (k1y + 2 * k2y + 2 * k3y + k4y)

  (next-x, next-y)
}

#let draw_quiver(
  func_p, func_q,
  x-domain: (-4, 4), y-domain: (-4, 4),
  samples: 15, scale: 0.15, normalize: false,
  max-mag: 10, color: black,
) = {
  cetz.draw.group({
    let (x-min, x-max) = x-domain
    let (y-min, y-max) = y-domain
    let dx = (x-max - x-min) / samples
    let dy = (y-max - y-min) / samples

    let i = 0
    while i <= samples {
      let x = x-min + i * dx
      let j = 0
      while j <= samples {
        let y = y-min + j * dy
        let u = func_p(x, y)
        let v = func_q(x, y)
        let mag = calc.sqrt(u * u + v * v)

        if mag > 0.001 {
          let u_draw = u
          let v_draw = v
          if normalize {
             u_draw = u / mag
             v_draw = v / mag
          }
          let color = color.transparentize(100% * (1 - calc.min(1, mag / max-mag)))
          cetz.draw.line(
            (x, y), (x + u_draw * scale, y + v_draw * scale), 
            stroke: (paint: color, thickness: 0.0pt), 
            mark: (end: "stealth", size: 0.10, fill: color)
          )
        }
        j += 1
      }
      i += 1
    }
  })
}

#let draw_streamlines(
  func_p, func_q,
  x-domain: (-4, 4), y-domain: (-4, 4),
  density: 1.5, // Seed points per unit
  step-size: 0.05,
  max-steps: 100,
  direction: "forward", // "forward", "backward", "bidirectional"
  color: red,
  thickness: 0.8pt,
  arrows: false,
  arrow-step: 1.5, // Distance between arrows along the curve (in arclength)
  arrow-size: 0.15,
  seeds: none,
  highlight-seeds: false,
  dead-zones: (),
  dead-zone-radius: 0.2,
) = {
  cetz.draw.group({
    let (x-min, x-max) = x-domain
    let (y-min, y-max) = y-domain
    
    // 1. Generate Seeds
    if seeds == none {
      seeds = ()
      let x = x-min
      while x <= x-max {
        let y = y-min
        while y <= y-max {
          seeds.push((x, y))
          y += 1.0 / density
        }
        x += 1.0 / density
      }      
    }

    // 2. Trace Logic
    let trace-direction(start-x, start-y, h) = {
      let path = ()
      let curr-x = start-x
      let curr-y = start-y
      let k = 0
      let r-sq = dead-zone-radius * dead-zone-radius
      
      while k < max-steps {
        let (nx, ny) = rk4-step(func_p, func_q, curr-x, curr-y, h)
        
        let t-limit = 1.0
        let hit-something = false

        // A. Check Box Boundaries
        if nx < x-min or nx > x-max or ny < y-min or ny > y-max {
          hit-something = true
          if nx < x-min { t-limit = calc.min(t-limit, (x-min - curr-x) / (nx - curr-x)) }
          if nx > x-max { t-limit = calc.min(t-limit, (x-max - curr-x) / (nx - curr-x)) }
          if ny < y-min { t-limit = calc.min(t-limit, (y-min - curr-y) / (ny - curr-y)) }
          if ny > y-max { t-limit = calc.min(t-limit, (y-max - curr-y) / (ny - curr-y)) }
        }

        // B. Check Dead Zones (Full Segment Intersection)
        for dz in dead-zones {
          let (cx, cy) = dz
          
          // Vector from current point to next point
          let dx = nx - curr-x
          let dy = ny - curr-y
          // Vector from circle center to current point
          let fx = curr-x - cx
          let fy = curr-y - cy
          
          // Quadratic coefficients: At^2 + Bt + C = 0
          let A = dx*dx + dy*dy
          let B = 2 * (fx*dx + fy*dy)
          let C = fx*fx + fy*fy - r-sq
          
          // Avoid solving if segment is zero length
          if A > 0.000001 {
            let delta = B*B - 4*A*C
            if delta >= 0 {
              let sqrt-delta = calc.sqrt(delta)
              // We want the smallest t between 0 and 1
              let t1 = (-B - sqrt-delta) / (2 * A)
              let t2 = (-B + sqrt-delta) / (2 * A)
              
              if t1 >= 0 and t1 <= 1.0 {
                hit-something = true
                t-limit = calc.min(t-limit, t1)
              } else if t2 >= 0 and t2 <= 1.0 {
                // Usually t1 is the entry, but check t2 just in case
                hit-something = true
                t-limit = calc.min(t-limit, t2)
              }
            }
          }
        }

        // C. Update Path
        if hit-something {
          // Interpolate exact hit point
          let end-x = curr-x + t-limit * (nx - curr-x)
          let end-y = curr-y + t-limit * (ny - curr-y)
          path.push((end-x, end-y))
          break // Stop tracing
        } else {
          path.push((nx, ny))
          curr-x = nx
          curr-y = ny
        }

        k += 1
      }
      return path
    }

    // 3. Render Lines
    for seed in seeds {
      let (sx, sy) = seed
      if highlight-seeds {
         cetz.draw.circle(seed, radius: 0.05, fill: green, stroke: green)
      }
      
      // Integrate Forward (positive step)
      let fwd = if direction == "forward" or direction == "bidirectional" {
        trace-direction(sx, sy, step-size)
      } else {
        ()
      }
      
      // Integrate Backward (negative step)
      let bwd = if direction == "backward" or direction == "bidirectional" { 
        trace-direction(sx, sy, -step-size)
      } else {
        ()
      }
      
      let full-path = bwd.rev() + (seed,) + fwd
      if full-path.len() > 1 {
        cetz.draw.line(..full-path, stroke: (paint: color, thickness: thickness))

        // Draw arrows at fixed arc-length intervals
        if arrows {
          let traveled = 0.0
          let next-arrow-target = arrow-step
          
          let i = 0
          while i < full-path.len() - 1 {
            let (x1, y1) = full-path.at(i)
            let (x2, y2) = full-path.at(i+1)
            
            let seg-dx = x2 - x1
            let seg-dy = y2 - y1
            let seg-len = calc.sqrt(seg-dx * seg-dx + seg-dy * seg-dy)
  
            // While we have passed the next target within this segment
            while traveled + seg-len >= next-arrow-target {
              let remaining = next-arrow-target - traveled
              let t = remaining / seg-len // Interpolation factor (0 to 1)
              
              // Exact position of the arrow center
              let ax = x1 + t * seg-dx
              let ay = y1 + t * seg-dy
              
              // Draw a zero-length line just to place the marker
              // We use a tiny offset to orient the marker correctly
              let dir-x = seg-dx / seg-len * 0.01
              let dir-y = seg-dy / seg-len * 0.01
              
              cetz.draw.line(
                (ax, ay), (ax + dir-x, ay + dir-y),
                stroke: 0pt,
                mark: (end: "stealth", size: arrow-size, fill: color)
              )
              
              next-arrow-target += arrow-step
            }
            
            traveled += seg-len
            i += 1
          }
        }
      }
    }
  })
}

#let Efield-from-point-charge(charge, position, k: 1) = {
  let (charge-x, charge-y) = position
  return (x, y) => { 
    // kQ / r^2
    let dx = x - charge-x
    let dy = y - charge-y
    let r2 = dx * dx + dy * dy
    if r2 == 0 { r2 = 0.01 }
    let E = k * charge / r2

    let theta = calc.atan2(dx, dy) // negative because pointing away
    return (E * calc.cos(theta), E * calc.sin(theta))
  } 
}

#let split-fields = (..fields) => {
  let p(x, y) = fields.pos().map(field => field(x, y).at(0)).sum()
  let q(x, y) = fields.pos().map(field => field(x, y).at(1)).sum()
  return (p, q)
}

#let net-Efield(..charges, k: 1) = { // charges: ((magnitude, (x, y)), ...)
  let charges = charges.pos()
  let p(x, y) = {
    let sum = 0.0
    for charge in charges {
      let (q, (cx, cy)) = charge
      let dx = x - cx
      let dy = y - cy
      let r2 = dx * dx + dy * dy
      if r2 == 0 { continue }
      let E = k * q / r2
      let theta = calc.atan2(dx, dy)
      sum += E * calc.cos(theta)
    }
    return sum
  }
  let q(x, y) = {
    let sum = 0.0
    for charge in charges {
      let (q, (cx, cy)) = charge
      let dx = x - cx
      let dy = y - cy
      let r2 = dx * dx + dy * dy
      if r2 == 0 { continue }
      let E = k * q / r2
      let theta = calc.atan2(dx, dy)
      sum += E * calc.sin(theta)
    }
    return sum
  }
  return (p, q)
}

#let points-around-by-angle(position, angles, radius: 1) = {
  let (x, y) = position
  let points = ()

  for angle in angles {
    points.push((x + radius * calc.cos(angle), y + radius * calc.sin(angle)))
  }
  return points
}

#let points-around(position, radius: 1, count: 8, start: 0deg, step: none) = {
  let (x, y) = position
  let dtheta = if step == none { 360deg / count } else { step }
  let theta = start
  let points = ()

  let i = 0
  while i < count {
    points.push((x + radius * calc.cos(theta), y + radius * calc.sin(theta)))
    theta += dtheta
    i += 1
  }
  return points
}

// demo

#let c1 = cetz.canvas({
  import cetz.draw: *

  let (p, q) = net-Efield(
    (1, (-1, 0)),
    (-1, (1, 0)),
  )

  draw_quiver(
    p, q, 
    samples: 20, 
    scale: 0.05, 
    normalize: true, 
    max-mag: 2,
    color: gray,
  )

  draw_streamlines(
    p, q,
    step-size: 0.04,
    max-steps: 2000,
    color: black,
    direction: "forward",
    arrows: true,
    seeds: points-around((-1, 0), radius: 0.2, count: 16),
    dead-zones: ((1, 0),),
  )
  draw_streamlines(
    p, q,
    step-size: 0.04,
    max-steps: 2000,
    color: black,
    direction: "backward",
    arrows: true,
    seeds: points-around((1, 0), radius: 0.2, count: 5, start: -45deg, step: 22.5deg),
    dead-zones: ((-1, 0),),
  )

  circle((1, 0), name: "neg", radius: 0.2, fill: blue)
  circle((-1, 0), name: "pos", radius: 0.2, fill: red)

  content("neg", anchor: "center", text(fill: white, size: 6pt)[$-q$])
  content("pos", anchor: "center", text(fill: white, size: 6pt)[$+q$])
  
  // Frame
  rect((-4, -4), (4, 4), stroke: black)
})

#let c2 = cetz.canvas({
  import cetz.draw: *

  let (p1, p2, p3) = (
    (-1, 0), (1, 0), (0, 2 * calc.sin(60deg))
  )
  let (p, q) = net-Efield(
    (1, p1),
    (-1, p2),
    (0.1, p3),
  )
  
  draw_quiver(
    p, q, 
    samples: 20, 
    scale: 0.05, 
    normalize: true, 
    max-mag: 2,
    color: gray,
  )

  let streamline(direction, seeds, dead-zones) = draw_streamlines(
    p, q,
    step-size: 0.04,
    max-steps: 20000,
    color: black,
    direction: direction,
    arrows: true,
    seeds: seeds,
    dead-zones: dead-zones,
  )

  streamline("forward", points-around(p1, radius: 0.2, count: 12), (p2, p3))
  streamline("forward", points-around(p3, radius: 0.2, count: 6), (p1, p2))
  streamline(
    "backward", 
    points-around((1, 0), radius: 0.2, count: 4, start: -45deg, step: 22.5deg), 
    (p1, p3),
  )

  circle(p1, radius: 0.2, fill: red)
  circle(p2, radius: 0.2, fill: blue)
  circle(p3, radius: 0.2, fill: green.darken(30%))

  content(p1, anchor: "center", text(fill: white, size: 6pt)[$+q$])
  content(p2, anchor: "center", text(fill: white, size: 6pt)[$-q$])
  content(p3, anchor: "center", text(fill: white, size: 6pt)[$+q/10$])

  // Frame
  rect((-4, -4), (4, 4), stroke: black)
})

// doc

#show: align.with(center)
#title("Electric Field Lines")

#grid(
  columns: 2,
  column-gutter: 16pt,
  c1, 
  c2,
)

$
  bold(upright(E))(arrow(r)) = sum_i 1/(4pi epsilon_0) q_i / norm(arrow(r)_i - arrow(r))^2 hat(r)
$