
build:
	emacs --batch \
	  --eval "(progn \
	    (find-file \"file.org\") \
	    (org-latex-export-to-pdf) \
	    (org-html-export-to-html))"

open:
	open file.pdf
	open file.html

clean:
	rm -fr *.pdf *.html *.tex
