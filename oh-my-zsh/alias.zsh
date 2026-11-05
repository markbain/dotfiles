alias la='ls -al'
alias goclients='cd ~/code/vvv/clients/www && ls -al'
alias gobain='cd ~/code/vvv/bain/www && ls -al'

# Client SSH aliases are NOT kept here: this repo is public.
# They live in ~/.config/secrets/ssh-aliases.zsh, sourced by zshrc.


# Vagrant
alias vu='vagrant up'
alias vr='vagrant reload'
alias vrp='vagrant reload --provision'
alias vh='vagrant halt'
alias vssh='vagrant ssh'
alias vgs='vagrant global-status'
alias vxd_on='vagrant ssh -c "switch_php_debugmod xdebug"'
alias vxd_off='vagrant ssh -c "switch_php_debugmod none"'


# Misc

alias hud='screenfetch'
alias dnsflush='sudo /etc/init.d/nscd restart' # Clear the DNS cache
alias go='gnome-open' # Open a file in another application
alias top10='sudo du -hsx * | sort -rh | head -10' # Show the 10 largest dirs or files

# Git 
alias ghow='git show --stat --pretty=format:"%C(yellow)%h%C(reset) %G? %C(bold blue)%an%C(reset) %s%C(bold cyan)%d%C(reset) %C(green)%cr.%C(reset) %n%n%b%n%N%-%n"
'
alias gl='git log --graph --pretty=format:"%C(yellow)%h%C(reset) %G? %C(bold blue)%an%C(reset) %s%C(bold cyan)%d%C(reset) %C(green)%cr.%C(reset)"
'

# Studio task creation
alias studio-task='python3 /media/data/dev/bain-studio/studio/sync.py --create-task --project'

# Studio Slack notification
alias studio-notify='python3 /media/data/dev/bain-studio/studio/notifier.py'
