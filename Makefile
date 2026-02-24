TYPST       := typst
TYPST_FLAGS := --font-path fonts --features html --root .

EXCLUDE := homework/helpers.typ
SRCS := $(filter-out $(EXCLUDE),$(shell find homework -name '*.typ'))
PDFS := $(patsubst homework/%.typ,pdf/homework/%.pdf,$(SRCS))

.PHONY: all clean
all: $(PDFS)

pdf/homework/%.pdf: homework/%.typ
	mkdir -p $(dir $@)
	$(TYPST) compile $< $@ $(TYPST_FLAGS)
