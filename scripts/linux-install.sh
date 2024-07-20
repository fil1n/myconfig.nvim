CONFIG="$HOME/.config/nvim"
BRANCH="dev"

if [ ! -d "$CONFIG" ]; then
	mkdir -p -v "$CONFIG"
fi

# TODO: change wget to curl ?
if [ "$1" = "--tiny" ]; then
	core=$(wget -qO - https://raw.githubusercontent.com/fil1n/myconfig.nvim/$BRANCH/lua/core/config.lua)
	keys=$(wget -qO - https://raw.githubusercontent.com/fil1n/myconfig.nvim/$BRANCH/lua/core/keybindings.lua)
	printf "$core\n$keys" > "$CONFIG/init.lua"
	echo "done"
	exit
fi

git clone https://github.com/fil1n/myconfig.nvim $CONFIG
echo "done"
