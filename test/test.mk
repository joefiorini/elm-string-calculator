# Directory variables
# --------------------------
TEST = test

# Source files
# --------------------------
TEST_SOURCES = $(TEST)/Test.elm $(wildcard $(TEST)/**/*.elm)

.INTERMEDIATE: test-unwrapped.js

$(TEST)/test.js: $(TEST_SOURCES) $(ELM_SOURCES)
	cd test; elm-make $(notdir $<) --output test-unwrapped.js; \
    ./elm-io.sh test-unwrapped.js test.js

.PHONY: test_prepare test test_watch

test_prepare:
	cd test; elm-package install evancz/automaton; \
    npm install jsdom

test_watch:
	supervise test

test: $(TEST)/test.js
	chmod +x test/elm-io.sh
	cd test; node $(notdir $<)
