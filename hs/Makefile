HaskellWordCount.js: WordCount.hs Exports.js
	ghcjs -DGHCJS_BROWSER WordCount.hs
	echo "(function(global) {" >HaskellWordCount.js
	cat WordCount.jsexe/{rts,lib,out}.js Exports.js >>HaskellWordCount.js
	echo "})(exports);" >>HaskellWordCount.js

HaskellWordCount.min.js: WordCount.hs Exports.js
	ghcjs -DGHCJS_BROWSER WordCount.hs
	echo "(function(global) {" >HaskellWordCount.min.js
	ccjs WordCount.jsexe/{rts,lib,out}.js Exports.js \
	  --compilation_level=ADVANCED_OPTIMIZATIONS \
	  >>HaskellWordCount.min.js
	echo "})(exports);" >>HaskellWordCount.min.js

.PHONY: clean
clean:
	rm -rf WordCount.jsexe
	rm -f HaskellWordCount.{js,min.js}
	rm -f *.js_{hi,o}
