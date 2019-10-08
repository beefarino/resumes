param( $comment, [switch]$push )

cp .\output\jim-christopher-jimbo-simple.html -dest ..\beefarino.github.io\index.html
cp .\output\jim-christopher-jimbo-markdown.md -dest ..\beefarino.github.io\README.md
cp ./res -dest ../beefarino.github.io -container -recurse

pushd ../beefarino.github.io

git add .
git commit -m "$comment"

if( $push ) {
  git push
}

popd
