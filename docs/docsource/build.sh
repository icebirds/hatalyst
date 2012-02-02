#!/bin/sh
curPath="/home/icebird/projects/webframework/release/docs/docsource"

# 简体中文
cd $curPath
cd zh_cn
xelatex -papersize=b5 -output-directory=/home/icebird/projects/webframework/release/docs/docsource/output hatalyst_analytics.tex
