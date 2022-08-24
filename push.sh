echo -n "Enter commit message:"
read MESSAGE

./pdfgen.sh
git add .
git commit -m "$MESSAGE"
git push -u myrepo edit

git checkout main
git merge edit
git push -u myrepo main

git checkout source
git pull source main
git push -u myrepo source

git checkout edit
