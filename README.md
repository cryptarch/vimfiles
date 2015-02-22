After you clone the repo you'll need to symlink it into appropriate parts of `vim`'s default path.
If you have an existing `~/.vim` directory containing your own plugins etc that you don't want to overwrite,
you could do something like the following:

    $ ln -svf "$PWD"/vimrc ~/.vimrc
    $ find -mindepth 1 -type d ! -regex ".*\.git.*" -exec mkdir -pv ~/.vim/{} \;
    $ find -mindepth 2 -type f ! -regex ".*\.git.*" -exec ln -sv $PWD/{} ~/.vim/{} \;

