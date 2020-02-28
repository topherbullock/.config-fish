# lazy dev
function dev
  source /opt/dev/dev.fish
  dev $argv
end

function 'ugh-railgun'
  dev down
  railgun ls-data | tail -n +2 | awk '{print $1}' | xargs -n 1 -t railgun rm-data
  railgun ls-images | tail -n +2 | awk '{print $1}' | xargs -n 1 -t railgun rm-image
  dev up
end

function 'ugh-rebase'
  env NOHOOK='1' git co master
  git pull
  env NOHOOK='1' git co -
  git rebase master
end

function 'prep-commit'
  dev test
  dev style
  git add -p
end
