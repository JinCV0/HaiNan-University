# 使用 xelatex 编译
$latex = 'xelatex -synctex=1 -interaction=nonstopmode %O %S';

# 设置 bibtex （你也可以用 biber）
$bibtex = 'bibtex %O %B';

# 使 latexmk 自动运行多轮以解析引用
$pdf_mode = 1;
$pdflatex = $latex;
