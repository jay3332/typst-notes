import subprocess
from os import path, makedirs
from sys import argv

TEMPLATE = """
#import "helpers/template.typ": *

#show: template.with(
  title: "Multivariable Calculus", 
  description: "Unit {0}",
  toc_depth: {1},
)

#include("src/multivariable_calculus/unit_{0}.typ")
"""

def build_unit(num: int, typst_path: str) -> None:
    full = TEMPLATE.format(num, 3)
    output_pdf = f"pdf/multivariable_calculus/unit_{num}.pdf"
    makedirs(path.dirname(output_pdf), exist_ok=True)
    with open("temp.typ", "w") as f:
        f.write(full)
    subprocess.run([typst_path, "compile", "temp.typ", output_pdf, "--features=html"])
    subprocess.run(["rm", "temp.typ"])

def main() -> None:
    typst_path = argv[1] if len(argv) > 1 else "typst"
    for unit_num in range(1, 6):
        build_unit(unit_num, typst_path)

if __name__ == "__main__":
    main()
