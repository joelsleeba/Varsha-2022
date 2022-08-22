echo -n "Enter commit message:"
read MESSAGE

git add .
git commit -m "$MESSAGE"
git push -u my-repo pre-edit

git checkout main
git merge pre-edit
git push -u my-repo main

git checkout source
git pull source main
git push -u my-repo source
