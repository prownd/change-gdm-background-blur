convert_picture() {
  blur_geometry="$1"
  src_picture="$2"
  dst_picture="$3"
  sudo="$4"

  # if arg4 is sudo
  [[ "$sudo" = "sudo" ]] && sudo="/usr/bin/sudo"

  # Make your wallpaper blurry
  # /usr/share/backgrounds/LOCKSCREEN_WALLPAPER_NAME
#log_info "Convert Wallpaper:          \"${src_picture}\" -> \"${dst_picture}\"\n"
  # Make your wallpaper blurry
  if [[ $gui -eq 1 ]]; then
    ( $sudo convert -blur ${blur_geometry} "${src_picture}" "${dst_picture}" ) \
      | zenity --progress --pulsate --auto-close --no-cancel --title="Image Converter" --text="Making blurry picture: ${dst_picture}" 2>/dev/null
    [ $? -eq -1 ] && zenity --error --text="Image Converter canceled."
  else
    $sudo convert -blur ${blur_geometry} "${src_picture}" "${dst_picture}"
  fi
}

background_picture=$1
screensaver_picture=$2

[[ -z "$blur_geometry_lockscreen" ]] && blur_geometry_lockscreen="0x40"

convert_picture "${blur_geometry_lockscreen}" "$background_picture" "$screensaver_picture"


#./convert_blur_picture_gdm_background.sh   winter-in-bohemia.png  winter-in-bohemia-blur.png
#./convert_blur_picture_gdm_background.sh  field-wheat-country-road-tree.jpg  field-wheat-country-road-tree-blur.jpg
#set-gdm-wallpaper  ./winter-in-bohemia-blur.png
#

#convecrt 设置模糊的数字，数字越大，模糊的程度越高
#gdm  模糊背景处理。修改  gresource 中的  gnome-shell.css  lockDiaglogGroup background 的css属性。然后设置背景。然后用convert 模糊处理图片
# 这样就达到了背景模糊的效果
#去掉fedora的 gdm logo


#  xhost +si:localuser:gdm
#  sudo -u gdm gsettings set org.gnome.login-screen logo ''
#  sudo system restart gdm
