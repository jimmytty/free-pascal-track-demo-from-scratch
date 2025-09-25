SHELL      = /bin/bash
DESTDIR    = build
BASENAME   = $(shell basename $$(pwd) | sed -r 's/(^|-)([a-z])/\U\2/g')Tests
TESTFILE   = $(BASENAME).pas
EXECUTABLE = $(DESTDIR)/$(BASENAME)
COMMAND    = fpc -l- -v0 -Sehnw -Fu./lib "./$(TESTFILE)" -FE"./$(DESTDIR)"

test:
	@[ -d "./$(DESTDIR)" ] || rm -fr "./$(DESTDIR)"
	@mkdir -p "./$(DESTDIR)"
	@cp -r ./lib "./$(DESTDIR)"
	@$(COMMAND) && "./$(EXECUTABLE)"
	@rm -fr "./$(DESTDIR)"
