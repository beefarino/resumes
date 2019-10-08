param( $theme );

$blob = $theme;
if( -not $theme ) {
  $theme = ls ./node_modules/jsonresume-theme-* | select -expand name ;
  $theme = $theme -replace 'jsonresume-theme-', '';
  write-warning ("no theme specified, exporting all {0} themes installed" -f $theme.count )
  $blob = '*';
}

@($theme) | foreach {
  $name = $_;
  node .\node_modules\resume-cli export --theme=${name}  ./_local/jim-christopher-${name}.html
}

ls ./_local/jim-christopher-${blob}.html | ii;
