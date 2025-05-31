# HNUThesisLatexTemplate

Latex template for HNU thesis.

# 说明

海南大学本科生毕业论文 LaTeX 模版。

# LaTeX优点

在刚刚结束的毕业设计撰写中，很多使用 Word 的同学在写作过程中出现大量难以解决的格式问题。LaTeX 虽然学习曲线较为陡峭，但花费一个小时左右时间熟悉后即可完全专注于内容撰写而无需操心任何格式问题。本模版即旨在你只需复制粘贴修改具体内容即可作出 __完全__ 符合海南大学现行规范的毕业设计。

LaTeX 加本模板可以实现：

* 无比优雅的数学公式
* 章节的自动标号
* 公式的自动标号
* 插图的自动标号
* 表格的自动标号
* 目录的自动生成
* 参考文献和标引的自动标号
* __所有格式的自动正确__

# 如何使用本模板

## 基本使用

首先请阅读文档《[一份不太简短的 LaTeX 介绍](http://www.ctan.org/tex-archive/info/lshort/chinese/)》，了解 LaTeX 的基础语法。

打开 `Thesis/preface/cover.tex`，修改封面内容。

打开 `Thesis/body.tex`，开始根据示例书写你的毕业设计。绝大部分需求（标引、插图、表格、数学公式、代码环境）等均在示例中有所体现，可直接复制粘贴修改内容。

## 数学公式

数学公式的具体书写方式参考文档《[一份不太简短的 LaTeX 介绍](http://www.ctan.org/tex-archive/info/lshort/chinese/)》，注意：需要标号的公式请在 `equation`环境下配合 `\label{}`标签使用，在需要引用的地方使用 `\eqref{}`命令引用相应公式。示例如下：

```latex
计算公式：

（1）准确率：

\begin{equation}
\label{eq:precision}
\mathrm{Precision} = \frac{TP}{TP + FP}
\end{equation}

（2）召回率：
\begin{equation}
\label{eq:recall}
\mathrm{Recall} = \frac{TP}{TP + FN}
\end{equation}
```

## 插图与表格

参考文档与模板示例。建议图像使用 `.pdf`矢量格式，放入 `figures` 目录下。

插图示例：

```latex
\begin{figure}[htbp!]
\centering
\includegraphics[width=0.75\textwidth]{figures/fig2-1.pdf}
\caption{番木瓜果园采集图像示例}\label{fig:fig2-1}
\vspace{-1em}
\end{figure}
```

表格示例：

```latex
其他网络超参数如表\ref{tab:table2-2}所示。
\begin{table}[htbp]
    \caption{YOLOv11网络超参数}\label{tab:table2-2}
    \vspace{0.5em}\centering\wuhao
    \begin{tabular}{ll}
    \toprule[1.5pt]
    Hyperparameter & Value \\
    \midrule[1pt]
    每批次图像数量(batch) & 72 \\
    训练轮次(epoch) & 250 \\
    输入图像尺寸(image size) & 640 \\
    动量(momentum) & 0.973 \\
    初始学习率(lr0) & 0.01 \\
    最终学习率(lrf) & 0.01 \\
    权重衰减(weight\_decay) & 0.005 \\
    \bottomrule[1.5pt]
    \end{tabular}
    \vspace{\baselineskip}
    \end{table}

```

## 参考文献

所有参考文献在 `Thesis/references/reference.bib` 中。BibTex 格式的参考文献可通过以下步骤获得：

* 打开浏览器，访问 [Google Scholar](http://scholar.google.com)
* 查找你所需的文献
* 点击文献下方 引用/cite 按钮
* 在弹出框内点击 BibTex
* 复制新窗口里的文本粘贴到 reference.bib 中
* 在 body.tex 中需要引用的地方使用 `\cite{}`命令进行引用，括号里填参考文献第一行左花括号后面的 identifier。如使用下面推荐的工具链可以实现参考文献自动补全
* （新）把复制的国标引用格式丢给AI，让其按bib格式输出粘贴到 `reference.bib` 中
* 中文参考文献请添加
  ```
  language = {ch},
  ```

## 目录，字体，字号，编号，序号，页码，页眉，排版...

全都是自动的。

# 关于版本

本模板适用于 texlive 2025，使用 `xelatex->bibtex->xelatex->xelatex` 编译链。或者直接使用 `xelatexmk`配方更快。在 macOS, Windows 10 下进行修改与测试，无法完全保证其它平台的正常使用。希望 Linux 用户踊跃反馈。

## 编译

> - 编译操作**在 `hunmain.tex` 所在目录下进行**
> - 以下编译方式任选其一即可

### 使用 `Latexmk`编译

```bash
latexmk -pvc -xelatex -file-line-error -interaction=nonstopmode -synctex=1 hnumain.tex
```

### 手动编译

**依次运行**以下四条命令：

```bash
xelatex hnumain.tex
bibtex hnumain.aux
xelatex hnumain.tex
xelatex hnumain.tex
```

注意：由于存在目录、参考文献和图表编号等，需要多次编译以保证顺序正确。

## 清理缓存及日志

### Atom

安装插件 `language-latex`和 `latex`，提供 Build 和 Clean 的功能。

### Visual Studio Code

安装插件 `LaTeX Workshop`，提供 clean up

### Latexmk

```bash
latexmk -c
```

### 其他

也可使用我制作的小脚本：

* 资源管理器中双击claen.bat运行

如提示 Permission Denied，请‘管理员运行’执行即可。

# 推荐工具链

* 请搭配VS Code使用，其他工具未经实验

注意：使用 VS Code 配合 LaTeX Workshop 插件，可能需要在 VS Code 设置中加入

```js
    "latex-workshop.latex.tools": [
    {
        "name": "latexmk",
        "command": "latexmk",
        "args": [
            "-xelatex",
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "%DOC%"
        ]
    },
    {
        "name": "pdflatex",
        "command": "pdflatex",
        "args": [
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "%DOCFILE%"
        ]
    },
    {
        "name": "xelatex",
        "command": "xelatex",
        "args": [
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "%DOCFILE%"
        ]
    },
    {
        "name": "bibtex",
        "command": "bibtex",
        "args": [
            "%DOCFILE%"
        ]
    }
],
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatexmk",
            "tools": ["latexmk"]
        },

        {
            "name": "xelatex",
            "tools": [
                "xelatex"
            ],
        },
        {
            "name": "pdflatex",
            "tools": [
                "pdflatex"
            ]
        },
        {
            "name": "xe->bib->xe->xe",
            "tools": [
                "xelatex",
                "bibtex",
                "xelatex",
                "xelatex"
            ]
        },
        {
            "name": "pdf->bib->pdf->pdf",
            "tools": [
                "pdflatex",
                "bibtex",
                "pdflatex",
                "pdflatex"
            ]
        },

    ],
        "latex-workshop.latex.outDir": "./out", // 输出目录
        "latex-workshop.latex.clean.fileTypes": [
            "*.aux",    // 辅助文件
            "*.bbl",    // 参考文献文件
            "*.blg",    // BibTeX 日志
            "*.idx",    // 索引文件
            "*.ind",    // 索引文件
            "*.lof",    // 图片列表
            "*.lot",    // 表格列表
            "*.out",    // 超链接文件
            "*.toc",    // 目录文件
            "*.acn",    // 首字母缩写列表
            "*.acr",    // 首字母缩写引用
            "*.alg",    // 算法列表
            "*.glg",    // 术语表日志
            "*.glo",    // 术语表
            "*.gls",    // 术语表样式
            "*.ist",    // makeindex 样式
            "*.fls",    // 文件列表
            "*.log",    // 编译日志
            "*.fdb_latexmk"  // latexmk 数据库
        ],
  
  
        //tex文件浏览器，可选项为"none" "browser" "tab" "external"
        "latex-workshop.view.pdf.viewer": "tab",
        //自动编译tex文件
        "latex-workshop.latex.autoBuild.run": "onFileChange",
        //显示内容菜单：（1）编译文件；（2）定位游标
        "latex-workshop.showContextMenu": true,
        //不显示错误
        "latex-workshop.message.error.show": false,
        //显示警告
        "latex-workshop.message.warning.show": false,
        //从使用的包中自动补全命令和环境
        "latex-workshop.intellisense.package.enabled": true,
        //设置为never，为不清除辅助文件
        "latex-workshop.latex.autoClean.run": "never",
        //设置vscode编译tex文档时的默认编译链
        "latex-workshop.latex.recipe.default": "lastUsed",
        // 用于反向同步的内部查看器的键绑定。ctrl/cmd +点击(默认)或双击
        "latex-workshop.view.pdf.internal.synctex.keybinding": "double-click",
        "editor.wordWrap": "on",
        "editor.inlineSuggest.showToolbar": "always", 
  
        // "editor.fontFamily": "JetBrains Mono, Fira Code, monospace",
        "editor.fontSize": 20, //控制字体大小(像素)。
                "editor.lineHeight": 25, //控制行高(像素)。
                "editor.fontLigatures": true,  //启用字体连字。
                "editor.guides.indentation": true, //启用缩进指南。
                "editor.folding": true //启用代码折叠。
```

# 主要改进点

1. 更加严格按照海南大学本科毕业设计格式规范（2025届）
2. 采用新配方“xelatexmk”编译，速度提高了几倍

# 致谢

tjuthesis 的原作者们作出了前人栽树的不可磨灭的贡献（[原地址](https://code.google.com/p/hnuthesis)）

# License

由于原项目使用 GNU GPL v3 协议，本项目作为基于 hnuthesis 的衍生项目，仍保持 GNU GPL v3 协议。
