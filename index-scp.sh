# このスクリプトは、ポートフォリオのindex.htmlを更新するためのスクリプトです
# EC2のubuntuサーバーに転送するために、rsyncを使ってファイルを転送します

# SSHの秘密鍵ファイルのパス
SSH_KEY="~/.ssh/recursion-1.pem"

# ローカルの送信元ディレクトリとリモートの宛先ディレクトリ
REMOTE_DEST="ubuntu@34.233.133.36:~/web/portfolio_index"

# 実際に送信するファイルのリスト
FILES_TO_SEND="*.html"

# cssファイルの転送の場合はフォルダごと転送する
FILES_TO_SEND_CSS="css"

# jsファイルの転送の場合はフォルダごと転送する
FILES_TO_SEND_JS="js"

# jpgファイルの転送の場合はフォルダごと転送する
FILES_TO_SEND_JPG="images"

# 実際にscpコマンドを実行するコマンドを生成
SCP_CMD="scp -i $SSH_KEY $FILES_TO_SEND $REMOTE_DEST"
SCP_CMD_CSS="scp -r -i $SSH_KEY $FILES_TO_SEND_CSS $REMOTE_DEST"

# 実際にscpコマンドを実行する関数
function execute_scp {
    echo "ファイルを転送します..."
    $SCP_CMD
    $SCP_CMD_CSS
    
    # jsディレクトリが存在する場合の転送
    if [ -d "$FILES_TO_SEND_JS" ]; then
        SCP_CMD_JS="scp -r -i $SSH_KEY $FILES_TO_SEND_JS $REMOTE_DEST"
        $SCP_CMD_JS
    fi

    # jpgファイルのディレクトリが存在する場合の転送
    if [ -d "$FILES_TO_SEND_JPG" ]; then
        SCP_CMD_JPG="scp -r -i $SSH_KEY $FILES_TO_SEND_JPG $REMOTE_DEST"
        $SCP_CMD_JPG
    fi

    echo "転送が完了しました。"
}

# 実際にscpコマンドを実行
execute_scp
