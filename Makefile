# Makefile for running R scripts

# Define the R script interpreter
RSCRIPT = Rscript

# Define scripts and their outputs
SCRIPT1 = diffs.R
OUTPUT1 = output1.csv


# Default target
all: $(OUTPUT3)

# Rules to produce outputs
$(OUTPUT1): $(SCRIPT1)
	$(RSCRIPT) $<

$(OUTPUT2): $(SCRIPT2) $(OUTPUT1)
	$(RSCRIPT) $<

$(OUTPUT3): $(SCRIPT3) $(OUTPUT2)
	$(RSCRIPT) $<

# Phony targets for cleaning and running all scripts
.PHONY: clean all

clean:
	rm -f $(OUTPUT1) $(OUTPUT2) $(OUTPUT3)
