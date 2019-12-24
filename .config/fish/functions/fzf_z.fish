function fzf_z
  set z_data_path '/home/fill/.local/share/z/data'

  grep -v "\.\git" $z_data_path > /tmp/z.tmp
  cat /tmp/z.tmp > $z_data_path

  z -l | awk '{ print $2 }' |fzf --height 30% --reverse --border |  read recent
  if [ $recent ]
    cd $recent
    commandline -t ""
    commandline -f repaint
  end
end
