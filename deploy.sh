#!/bin/bash
set -ex
git config --global http.sslVerify "false"

# 生成静态文件
hexo clean && hexo g 
echo "blog.mrzhenggang.com" > public/CNAME

# 推送本站
# 配置git
git config --global user.name "zhenggang"
git config --global user.email "mrzhenggang@foxmail.com" 

# deploy nscc.git
msg='来自郑刚的手动部署'
git add -A
git commit -m "$msg"
git push -u origin main

# 推送public内容
hexo d

# clean
hexo cleant
