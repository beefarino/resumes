param( $comment, [switch]$push )

cp .\output\jim-christopher-jimbo-simple.html -dest ..\beefarino.github.io\index.html -force
cp .\output\jim-christopher-jimbo-markdown.md -dest ..\beefarino.github.io\README.md -force
cp ./res -dest ../beefarino.github.io -container -recurse -force

pushd ../beefarino.github.io

git add .
git commit -m "$comment"

if( $push ) {
  git push
}

popd
