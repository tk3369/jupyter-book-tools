# jupyter-book-tools

## Summary
This repo contains tools to build ebooks from jupyter notebooks.

## Usage

Run the following command and replace `<dir>` with the directory that 
contains notebook files.

```
docker run --mount "type=bind,src=<dir>,dst=/book" -it tomkwong/jupyter-book-tools
```

Once you have the command prompt, you can generate PDF from the notebook file as 
follows:
```
genbook myfile.ipynb
```

If you have multiple notebook files (e.g. Chapter1.ipynb, Chapter2.ipynb, etc.)
then you can use the `nbmerge` command to combine notebook files before running 
the `genbook` command e.g.

```
nbmerge -o book.ipynb Chapter1.ipynb Chapter2.ipynb
genbook book.ipynb
```

## How it works
In a nutshell, it follows the steps below:
1. Use `jupyter nbconvert` command to convert ipynb file into a latex file
2. Modify the latex file to work around some quirks related to text processing
3. Use `pdflatex` command to convert the latex file to PDF format
