# Makefile for running R scripts

# Define the R script interpreter
RSCRIPT = Rscript

# Define scripts and their outputs
SCRIPT1 = script1.R
OUTPUT1 = output1.csv

SCRIPT2 = script2.R
OUTPUT2 = output2.csv

SCRIPT3 = komet2a.R
OUTPUT3 = output3.csv

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
