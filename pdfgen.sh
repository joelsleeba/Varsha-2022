for dir in *; do
    if [ -d "$dir" ]; then
        cd  "$dir"
	pdflatex main.tex
	cd ..
    fi
done
