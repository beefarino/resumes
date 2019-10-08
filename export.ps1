param( $theme, $show );

remove-item ./node_modules/jsonresume-theme-jimbo* -rec -force;
copy-item ./jsonresume-theme-jimbo* -dest ./node_modules -rec -force;

$blob = $theme;
if( -not $theme ) {
  $theme = ls ./node_modules/jsonresume-theme-* | select -expand name ;
  $theme = $theme -replace 'jsonresume-theme-', '';
  write-warning ("no theme specified, exporting all {0} themes installed" -f $theme.count )
  $blob = '*';
}

@($theme) | foreach {
  $name = $_;
  node .\node_modules\resume-cli export --theme=${name}  ./output/jim-christopher-${name}.html
}

copy-item ./res -dest ./output -container -rec -force;
ls ./output/*markdown.html | copy-item  -dest { './output/' + ($_.name -replace '\.html','.md') };
if($show) {
  ls ./output/jim-christopher-${blob}.html | ii;
}
