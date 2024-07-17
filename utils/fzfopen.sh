FZF=fzf

OUT='inode/directory'
PT='.'
while [[ $OUT == 'inode/directory' ]]; 
do
  cd $PT;
  FNAME=$(find -maxdepth 5 -type f,d,s | fzf)
  OUT=$(file --mime-type $FNAME | awk '{print $2}');
  PT=$FNAME;
done
# if [[ $(printf %.4s $OUT) == 'text' ]]; then
  nvim $FNAME
# fi
