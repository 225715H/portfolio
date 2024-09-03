#! /bin/sh
path="$HOME/portfolio/resume"
sendTo="e225715@amane:~/public_html/"

function exec_ie {
    echo "ファイルを転送します..."
    rsync -avz $path $sendTo
    echo "転送が完了しました。"
}

function exec_git {
    echo "git add ."
    git add .
    read -p "commit message: " message
    git commit -m "$message"
    git push origin main
}

function main {
    exec_ie
    exec_git
}

main
