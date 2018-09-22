# oracle
oracle sql

ssh-keygen -t rsa -C "824425643@qq.com"
ssh -T git@github.com
git config --global user.name "shanxiangchen"
git config --global user.email "824425643@qq.com"
git init
git add *
git commit -m "first commit"
git remote add origin git@github.com:shanxiangchen/oracle.git
git pull --rebase origin master
git push -u origin master
