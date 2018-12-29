# jupyter-book-tools

This repo contains tools to build ebooks from jupyter notebooks.

In a nutshell, it follows the steps below:
1. Use `jupyter nbconvert` command to convert ipynb file into a latex file
2. Modify the latex file to work around some quirks related to text processing
3. Use `xelatex` command to convert the latex file to PDF format

Step 2 is required, unfortunately, to deal with few issues:

* Copyright unicode symbol is not converted properly by xelatex
* Dollar sign must be escaped by double backslashes in jupyter markdown but the extra backslash isn't ignored by xelatex
