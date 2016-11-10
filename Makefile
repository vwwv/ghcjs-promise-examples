


.stack-work:
	@echo "***********************************************************************"
	@echo "* Setting up stack, if it is the first time it will take a long while *"
	@echo "***********************************************************************"
	@echo ""
	stack setup

batteryExample: .stack-work
	stack build ghcjs-promise-examples:battery
	mkdir -p build
	cp $(shell stack path --local-install-root)/bin/battery.jsexe/all.js build/battery.js


meaningLifeExample: .stack-work
	stack build ghcjs-promise-examples:meaning-life
	mkdir -p build
	cp $(shell stack path --local-install-root)/bin/meaning-life.jsexe/all.js build/meaning-life.js


all: meaningLifeExample batteryExample


