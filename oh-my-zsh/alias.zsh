alias la='ls -al'

# Vagrant
alias vu='vagrant up'
alias vr='vagrant reload'
alias vrp='vagrant reload --provision'
alias vh='vagrant halt'
alias vssh='vagrant ssh'
alias vgs='vagrant global-status'

# Vagrant machines
# ed8b935
alias vhruby='vagrant halt ed8b935'
alias vuruby='vagrant up ed8b935'
# 4e8e76d
alias vhshare='vagrant halt 4e8e76d'
alias vushare='vagrant up 4e8e76d'
# 76d405e
alias vhac='vagrant halt 76d405e'
alias vuac='vagrant up 76d405e'
# 3914ad2
alias vhbain='vagrant halt 3914ad2'
alias vubain='vagrant up 3914ad2'

# Client projects

    ## Ruby Tapas
    alias ssh_ruby_prod='ssh wp_tjtd7f@107.180.234.26' # SSH to production server
    alias ssh_ruby_stag='ssh wp_jxdneh@208.113.143.141' # SSH to staging server
    alias ssh_avdicodes='ssh wp_56wdp4@avdi.codes.dream.website'

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
