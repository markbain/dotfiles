alias la='ls -al'
alias goclients='cd ~/code/vvv/clients/www && ls -al'
alias gobain='cd ~/code/vvv/bain/www && ls -al'

# The Nature Of Real Estate
alias ssh_tnore_prd='ssh -t -p 65002 u597309227@82.29.158.75 "cd /home/u597309227/domains/thenatureofrealestate.com/public_html ; bash --login"'

# Alex Wright
alias ssh_aw_prd='ssh -t awright249@pdx1-shared-a4-07.dreamhost.com "cd /home/awright249/alexwright.com/docs && pwd && ls -al ; bash --login"'
alias ssh_aw_stg='ssh -t awright249@pdx1-shared-a4-07.dreamhost.com "cd /home/awright249/staging.alexwright.com/docs && pwd && ls -al ; bash --login"'

# Bioinformatico
alias ssh_bic='ssh bioinformatico.com@ssh.gb.stackcp.com'
alias ssh_bic_prd='ssh -t bioinformatico.com@ssh.gb.stackcp.com "cd public_html ; bash --login"'
alias ssh_bic_stg='ssh -t bioinformatico.com@ssh.gb.stackcp.com "cd staging_html ; bash --login"'

# KF - Environments
alias ssh_kf_prd='ssh -t khyentsefndt@khyentsefndt.ssh.wpengine.net "cd /sites/khyentsefndt ; bash --login"'
alias ssh_kf_stg='ssh -t khyentsefo3stg@khyentsefo3stg.ssh.wpengine.net "cd /sites/khyentsefo3stg ; bash --login"'

## Middle Way Education
alias ssh_mwe_prod='ssh -t middlewayedu@middlewayedu.ssh.wpengine.net "cd /sites/middlewayedu ; bash --login"'
alias ssh_mwe_dev='ssh -t middlewaydev@middlewaydev.ssh.wpengine.net "cd /sites/middlewaydev ; bash --login"'
alias ssh_mwe_staging='ssh -t mwestaging@mwestaging.ssh.wpengine.net "cd /sites/mwestaging ; bash --login"'

## CABP
alias ssh_cabp_prd='ssh -t u1598-5nhubybv4mlo@gvam1277.siteground.biz -p 18765 "cd /home/u1598-5nhubybv4mlo/www/cabpexpo.com/public_html ; bash --login"'

## SINI
alias ssh_sini_prod='ssh -t sini@sini.ssh.wpengine.net "cd /home/wpe-user/sites/sini ; bash --login"'
alias ssh_sini_staging='ssh -t sini2024@sini2024.ssh.wpengine.net "cd /home/wpe-user/sites/sini2024 ; bash --login"'

## Film English
alias ssh_fe_prd='ssh -t filmenglish@filmenglish.ssh.wpengine.net "cd /sites/filmenglish ; bash --login"'
alias ssh_fe_stg='ssh -t filmenglis1stg@filmenglis1stg.ssh.wpengine.net "cd /sites/filmenglis1stg ; bash --login"'

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
