alias la='ls -al'

# Vagrant
alias vu='vagrant up'
alias vr='vagrant reload'
alias vrp='vagrant reload --provision'
alias vh='vagrant halt'
alias vssh='vagrant ssh'

# Client projects

    ## Ruby Tapas
    alias ssh_ruby_prod='ssh wp_xkwiqr@67.205.16.93' # SSH to production server
    alias ssh_ruby_stag='ssh wp_jxdneh@208.113.143.141' # SSH to staging server
    alias ssh_avdicodes='ssh wp_56wdp4@avdi.codes.dream.website'
    alias go_ruby='terminator -m --layout=dev && ssh_ruby'

    ## Foobot
    alias go_foo_drop='go /media/mark/Data\ B/development/vvv_test_1/www/dev.foobot.io' # Launch the shared Dropbox
    alias go_foo_dev='cd /media/mark/Data\ B/development/vvv_test_1/www/dev.foobot.io' # Go to the dev project dir
    alias go_foo='terminator -m --layout=dev && go_drop_foo && go_dev_foo && go https://dev.foobot.io/' # Launch dev environment

# SSH

## Personal

### NameCheap
alias sshdes='ssh mbain2@host42.registrar-servers.com -p21098' # bain.design
alias sshdig='ssh bainvehc@host42.registrar-servers.com -p21098' # bain.digital

### Hostgator
alias sshmb='ssh -p 2222 markba@markba.in' # markba.in

### Cloudways
alias ssh_cloudways='ssh master_czajrvfzzm@178.62.31.106' # https://platform.cloudways.com

## Clients

### NameCheap
alias ssh_aerialtellyco='ssh aerialtellyco@host42.registrar-servers.com -p21098' #
alias ssh_alba='ssh alba@host42.registrar-servers.com -p21098' #

alias ssh_annaalonso='ssh annaalonso@host42.registrar-servers.com -p21098' #
alias ssh_beakrayenbuhl='ssh beakrayenbuhl@host42.registrar-servers.com -p21098' #
alias ssh_dev1='ssh dev1bain@host42.registrar-servers.com -p21098' #
alias ssh_dev2='ssh dev2bain@host42.registrar-servers.com -p21098' #
alias ssh_dev3='ssh dev3bain@host42.registrar-servers.com -p21098' #
alias ssh_filmenglish='ssh filmenglish@host42.registrar-servers.com -p21098' #
alias ssh_gcalbainsta='ssh gcalbainstal@host42.registrar-servers.com -p21098' #
alias ssh_jamesdonaghyco='ssh jamesdonaghyco@host42.registrar-servers.com -p21098' #
alias ssh_jamiekeddie='ssh jamiekeddie@host42.registrar-servers.com -p21098' #
alias ssh_jeremytaylor='ssh jeremytaylor@host42.registrar-servers.com -p21098' #
alias ssh_kierandonaghy='ssh kierandonaghy@host42.registrar-servers.com -p21098' #
alias ssh_latentestudi='ssh latentestudi@host42.registrar-servers.com -p21098' #
alias ssh_leopoldo='ssh leopoldo@host42.registrar-servers.com -p21098' #
alias ssh_lessonstream='ssh lessonstream@host42.registrar-servers.com -p21098' #
alias ssh_lindsayclandfiel='ssh lindsayclandfiel@host42.registrar-servers.com -p21098' #
alias ssh_markba='ssh markba@host42.registrar-servers.com -p21098' #
alias ssh_markbaindesign='ssh markbaindesign@host42.registrar-servers.com -p21098' #
alias ssh_sergifmoure='ssh sergifmoure@host42.registrar-servers.com -p21098' #
alias ssh_sixthings='ssh sixthings@host42.registrar-servers.com -p21098' #
alias ssh_theround='ssh theround@host42.registrar-servers.com -p21098' #
alias ssh_thomasewens='ssh thomasewens@host42.registrar-servers.com -p21098' #
alias ssh_videotelling='ssh videotelling@host42.registrar-servers.com -p21098' #

# Misc

alias hud='screenfetch'
alias dnsflush='sudo /etc/init.d/nscd restart' # Clear the DNS cache
alias go='gnome-open' # Open a file in another application
alias top10='sudo du -hsx * | sort -rh | head -10' # Show the 10 largest dirs or files
