alias la='ls -al'

# KF - Environments
alias ssh_kf_prd='ssh -t khyentsefndt@khyentsefndt.ssh.wpengine.net "cd /sites/khyentsefndt ; bash --login"'

## Middle Way Education
alias ssh_mwe_prod='ssh -t middlewayedu@middlewayedu.ssh.wpengine.net "cd /sites/middlewayedu ; bash --login"'
alias ssh_mwe_dev='ssh -t middlewaydev@middlewaydev.ssh.wpengine.net "cd /sites/middlewaydev ; bash --login"'
alias ssh_mwe_staging='ssh -t middlewayedstg@middlewayedstg.ssh.wpengine.net "cd /sites/middlewayedstg ; bash --login"'

## CABP
alias ssh_cabp_sg='ssh -t u1598-5nhubybv4mlo@ssh.patricias58.sg-host.com -p 18765 "cd /home/customer/www/cabpexpo.com/public_html ; bash --login"'
alias ssh_cabp_lw='ssh -t cabpexpo@173.199.174.238 "cd /home/cabpexpo/www ; bash --login"'

## SINI
alias ssh_sini_staging='ssh -t sini2024@sini2024.ssh.wpengine.net "cd /home/wpe-user/sites/sini2024 ; bash --login"'

# Vagrant
alias vu='vagrant up'
alias vr='vagrant reload'
alias vrp='vagrant reload --provision'
alias vh='vagrant halt'
alias vssh='vagrant ssh'
alias vgs='vagrant global-status'

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
