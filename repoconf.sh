read -p "Enter your username:" Name
read -p "Enter your email ID:" MailID

sshkeygen() {
    KEYNAME="sleeba $(date +"%d-%m-%Y %H:%M:%S")"
    SSHKEY="$HOME/.ssh/$KEYNAME"
    ssh-keygen -t ed25519 -C "unsafe-key" -f "$SSHKEY"
    chmod 600 "$SSHKEY"
    echo -e "\n\nThis is your ssh public key"
    cat "$SSHKEY.pub"
    echo "Access ssh public key in pastebin here:"
    cat "$SSHKEY.pub" | nc termbin.com 9999
    echo -e "\n"
    #ssh-add -t 15 "$SSHKEY"
    export SSHKEY
}

if [[ -d ../.ssh ]]; then
    SSHKEY="$(dirname "$PWD")/.ssh/github-key"
elif [[ "$USER" == "joel" && "$Name" == "joelsleeba" ]]; then
    SSHKEY=$HOME/.ssh/$MailID
else
    read -p "Generate new ssh key? (y/n):" ifkeygen
    #while [[ ! "$ifkeygen" == "y" ]] && [[ ! "$ifkeygen" == "yes" ]] && [[ ! "$ifkeygen" == "n" ]] && [[ ! "$ifkeygen" == "no" ]]; do
    #    echo "Invalid Input"
    #    read -p "Generate new ssh key? (y/n):" $ifkeygen
    #done
    
    if [[ "$ifkeygen" == "yes" || "$ifkeygen" == "y" ]]; then
        sshkeygen
    fi
fi

git config user.name "$Name"
git config user.email "$MailID"

git checkout main
git remote add my-repo git@github.com:joelsleeba/Varsha-2022
git fetch --all
git pull --all
git checkout pre-edit
git remote add source https://github.com/ashishKujur7/Lecture-Notes.git
git remote remove origin
