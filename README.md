## This is a repository which store everyday's bing background I collected
- The background of bing is always very beautiful, I have been collecting it for a long time, and always use it as wallpaper, lock-screen-wallpaper and so on.
- So I established this repoistory, and I hooked it in my home page, I hope this repoistory will make some sense.
- and [this](https://sirius1242.github.io/bing-wallpaper-collect/) is the list of these wallpapers, all pictures in the repo will be displayed
- [curl.sh](./curl.sh) is the auto-pull script I use now, changed from [this](https://github.com/sirius1242/script/blob/master/curl.sh), mainly modification is the command "notify-send" changed to "mail" (mail need to configure first), and add git part (this script need to execute in absolute path).
- [thumbnails.sh](./thumbnails.sh) is the thumbnails auto-generator, it will compare your assets folder and thumbnails target folder and resize source file to 10% and put into directory named with date under target folder, then you can easily put the thumbnail of newly-added photo into your thumbnail site and auto cite it in index.html. You can change the folder locations if you want to use it.
