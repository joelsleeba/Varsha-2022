git checkout source
git pull source main
git checkout pre-edit
git rm -rf "*.log" "*.aux" "*.pdf" "*.out" "*.syn*" "*.latexmain"
echo "ready for merge from source"
echo "run: git merge source"
