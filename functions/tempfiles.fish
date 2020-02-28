function 'vimtemp'
  set filename (mktemp)
  vim $filename
end

function 'vimpaste'
  set filename (pbdump)
  vim $filename
end

function 'pbdump'
  set filename (mktemp)
  pbpaste >> $filename
  echo $filename
end
