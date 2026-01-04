#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x

swaync-client -t

list_col='1'
list_row='6'


# CMDs (add your apps here)
term_cmd='kitty'
file_cmd='thunar'
text_cmd='code --new-window'
web_cmd='brave'
music_cmd='spotify'
obidian='flatpak run md.obsidian.Obsidian'


option_1=" Terminal <span weight='light' size='small'><i>($term_cmd)</i></span>"
option_2=" Files <span weight='light' size='small'><i>($file_cmd)</i></span>"
option_3=" Editor <span weight='light' size='small'><i>($text_cmd)</i></span>"
option_4=" Browser <span weight='light' size='small'><i>($web_cmd)</i></span>"
option_5=" Music <span weight='light' size='small'><i>($music_cmd)</i></span>"
option_6=" Notes <span weight='light' size='small'><i>($obidian)</i></span>"


# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-p 'Applications' \
		-mesg "Installed Packages : `pacman -Q | wc -l` (pacman)" \
		-markup-rows \
		-theme apps.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		${term_cmd}
	elif [[ "$1" == '--opt2' ]]; then
		${file_cmd}
	elif [[ "$1" == '--opt3' ]]; then
		${text_cmd}
	elif [[ "$1" == '--opt4' ]]; then
		${web_cmd}
	elif [[ "$1" == '--opt5' ]]; then
		${music_cmd}
	elif [[ "$1" == '--opt6' ]]; then
		${setting_cmd}
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
    $option_6)
		run_cmd --opt6
        ;;
esac

if [[ ${chosen} == "" ]]; then
	swaync-client -t
fi