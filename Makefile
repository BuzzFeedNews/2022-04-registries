reproduce: clear analyze

clear:
	rm -r outputs || True
	mkdir -p outputs

analyze:
	nbexec --timeout 30 notebooks/substantiations/*.ipynb
	nbexec notebooks/appeals/*.ipynb
