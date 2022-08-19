SSHFOLDER=$HOME/.ssh
ssh-add -D
shred -u $SSHFOLDER/sleeba*
