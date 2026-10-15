.PHONY: all watch clean preview

all:
	./compile.sh

watch:
	./watch.sh

preview: all
	nix shell nixpkgs#poppler-utils -c pdftoppm -png -r 150 resume.pdf preview && mv preview-1.png preview.png

clean:
	rm -f resume.pdf preview*.png
