TYPST       := typst
TYPST_FLAGS := --font-path fonts --features html --root .

EXCLUDE := homework/helpers.typ
SRCS := $(filter-out $(EXCLUDE),$(shell find homework -name '*.typ'))
PDFS := $(patsubst homework/%.typ,pdf/homework/%.pdf,$(SRCS))

SRC_FLAT_TYPS := $(wildcard src/*.typ)
SRC_FLAT_PDFS := $(patsubst src/%.typ,pdf/%.pdf,$(SRC_FLAT_TYPS))

SRC_DIR_INDEXES := $(wildcard src/*/index.typ)
SRC_DIR_PDFS    := $(patsubst src/%/index.typ,pdf/%.pdf,$(SRC_DIR_INDEXES))

.PHONY: all clean
all: $(PDFS) $(SRC_FLAT_PDFS) $(SRC_DIR_PDFS)

pdf/homework/%.pdf: homework/%.typ
	mkdir -p $(dir $@)
	$(TYPST) compile $< $@ $(TYPST_FLAGS)

pdf/%.pdf: src/%.typ
	mkdir -p $(dir $@)
	$(TYPST) compile $< $@ $(TYPST_FLAGS)

pdf/%.pdf: src/%/index.typ
	mkdir -p $(dir $@)
	$(TYPST) compile $< $@ $(TYPST_FLAGS)
