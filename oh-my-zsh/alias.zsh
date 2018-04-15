# Alias to edit this file!

alias zshconf='go ~/.oh-my-zsh/custom/example.zsh'

# Vagrant
alias vu='vagrant up'
alias vh='vagrant halt'
alias vvv200-up='cd /media/mark/Data\ B/development/vvv_test_1/ && vagrant up' # start VVV v.2.0.0 VM
alias vvv210-up='cd /media/mark/Data\ B/development/vvv/ && vagrant up' # start VVV v.2.1.0 VM

alias dev_root='cd /media/mark/Data\ B/development/vvv/www/'
alias dev_ipass='cd /media/mark/Data\ B/development/ipass_scotch/'

alias dev_mhy='cd /media/mark/Data\ B/development/vvv/www/'

# Open folders

    alias go_downloads='go ~/Downloads'
    alias go_pictures='go ~/Pictures'
    alias go_library='go_downloads && go_pictures'

    ## Dropbox

    ### iPass
    alias go_drop_ipass='go /media/mark/Data\ B/development/ipass_scotch/' # Go to the shared Dropbox



    ### Make Him Yours
    alias go_drop_mhy='go /media/mark/Data\ B/development/vvv/www/' # Go to the shared Dropbox

# Client projects

    ## Ruby Tapas
    alias ssh_ruby='ssh wp_xkwiqr@67.205.16.93' # SSH to production server

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
alias ssh_lukemeddings='ssh lukemeddings@host42.registrar-servers.com -p21098' #
alias ssh_markba='ssh markba@host42.registrar-servers.com -p21098' #
alias ssh_markbaindesign='ssh markbaindesign@host42.registrar-servers.com -p21098' #
alias ssh_sergifmoure='ssh sergifmoure@host42.registrar-servers.com -p21098' #
alias ssh_sixthings='ssh sixthings@host42.registrar-servers.com -p21098' #
alias ssh_theround='ssh theround@host42.registrar-servers.com -p21098' #
alias ssh_thomasewens='ssh thomasewens@host42.registrar-servers.com -p21098' #
alias ssh_videotelling='ssh videotelling@host42.registrar-servers.com -p21098' #

### Bryan Price
alias ssh_watershed='ssh watershedfarmer@watershedretreat.com'

### iPassIELTS
alias ssh_ipass='ssh ipassiel@eep2-05.nexcess.net'

# Misc
alias la='ls -al'
alias hud='screenfetch'
alias dnsflush='sudo /etc/init.d/nscd restart' # Clear the DNS cache
alias go='gnome-open' # Open a file in another application
alias top10='sudo du -hsx * | sort -rh | head -10' # Show the 10 largest dirs or files