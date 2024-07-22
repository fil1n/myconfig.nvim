BRANCH="$1"
MODE="$2"
CONFIG="$HOME/.config/nvim"
DOWNLOAD_URL="https://github.com/fil1n/myconfig.nvim/archive/refs/heads/$BRANCH.tar.gz"

if [ ! -d "$CONFIG" ]; then
	mkdir -p -v "$CONFIG"
fi

if [ "$MODE" = "core" ]; then
	 wget -qO - $DOWNLOAD_URL | tar xzf - --exclude=init.lua "myconfig.nvim-$BRANCH/lua/core/*" --to-stdout > "$CONFIG/init.lua"
fi

if [ "$MODE" = "full" ]; then
	wget -qO - $DOWNLOAD_URL | tar xzf - --strip-components=1 -C $CONFIG
fi
