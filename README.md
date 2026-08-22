A reliable way to always see Docker image timestamps: create a shell alias that forces Docker to print the CreatedAt field every time you run docker images.

Add this alias to your shell
If you’re using bash or zsh, add this to your ~/.bashrc or ~/.zshrc:

Run this to force timestamps to show:

docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.CreatedAt}}\t{{.Size}}"
Or a tighter version:

Code
docker images --format "{{.Repository}} {{.Tag}} {{.CreatedAt}}"
This prints the creation time no matter how narrow your terminal is.

If you want, I can help you build a custom alias so you always see timestamps.

yes please
Here’s a clean, reliable way to always see Docker image timestamps: create a shell alias that forces Docker to print the CreatedAt field every time you run docker images.

Add this alias to your shell
If you’re using bash or zsh, add this to your ~/.bashrc or ~/.zshrc:

Code
alias dimg='docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.CreatedAt}}\t{{.Size}}"'
Then reload your shell:


source ~/.bashrc
or


source ~/.zshrc

Now just run:
dimg