# **Disaster Recovery**

### **Table of contents** {#table-of-contents}

[Table of contents](#table-of-contents)

[Preparing for the worst](#preparing-for-the-worst)

[List of files/folders to backup/restore](#list-of-files/folders-to-backup/restore)

[Config files](#config-files)

[SSH](#ssh)

[Git](#heading=h.ttvlgtlmhsh5)

[Sublime Text](#heading=h.ofw1g3ldtn7r)

[Misc](#misc)

[Network](#network)

[Claude Code](#claude-code)

[Bitbucket / GitHub](#bitbucket-github)

[Shell secrets](#shell-secrets)

[Essential tools](#essential-tools)

[When the worst happens](#when-the-worst-happens)

[Install OS](#install-os)

[Restore configs](#restore-configs)

[Update OS](#update-os)

[Run the dotfiles script](#run-the-dotfiles-script)

[Modern dev tooling](#modern-dev-tooling)

[Manual installation/configuration](#manual-installation/configuration)

[Virtualbox](#virtualbox)

[Crashplan PRO](#crashplan-pro)

[Upwork](#upwork)

[Slack](#slack)

[Zoom](#zoom)

[Gitkraken](#gitkraken)

[Filezilla](#filezilla)

[Installing new OS](#installing-new-os)

[Dropbox](#dropbox)

[Config files](#config-files-1)

[Manual Configuration](#manual-configuration)

[Filezilla](#filezilla-1)

[Vagrant](#vagrant)

[VVV](#vvv)

[Symlinks](#symlinks)

[Setting up VVV](#setting-up-vvv)

[Secondary concerns](#secondary-concerns)

[Symlinks](#symlinks-1)

[Crashplan Small Business](#crashplan-small-business)

# **Minimal Work Setup**

* Photoshop (Windows)  
* Illustrator (Windows)  
* Creative cloud app  
* Slack app  
* Screen capture software  
* Virtualbox  
* Vagrant  
* VVV  
* Filezilla  
* Terminal emulator  
* Chrome  
* Upwork app  
* Gitkraken

# **Preparing for the worst** {#preparing-for-the-worst}

UPDATE: The intention is to **virtualize all development**, and to ensure all projects are correctly versioned and kept up to date in the repo. This should mean that some of the below is **no longer required**.

* Make sure all accounts are syncing and up to date\!  
* Config files in web projects that aren’t in the repo  
  * `wp-cli.yml`

## **List of files/folders to backup/restore** {#list-of-files/folders-to-backup/restore}

### **Config files** {#config-files}

#### **SSH** {#ssh}

* /home/.ssh/

#### **Misc** {#misc}

* /home/.config/filezilla/  
  * `sitemanager.xml`  
* /etc/fstab

#### **Network** {#network}

* .smbcredentials

#### **Claude Code** {#claude-code}

* \~/.claude/ — **excluding** `.credentials.json` and anything under `ide/`, `history.jsonl`, `daemon/` (session-local, don't restore)  
* Back up specifically: `CLAUDE.md`, `agents/`, `agent-memory/`, `hooks/`, `plugins/`, `.mcp.json`, `projects/*/memory/`  
* Credentials and MCP auth must be **re-authenticated** on the new machine, not restored from backup

#### **Bitbucket / GitHub** {#bitbucket-github}

* Bitbucket app password — regenerate at bitbucket.org/account/settings/app-passwords, store in `~/.config/secrets/env` (see [Shell secrets](#shell-secrets) below)  
* SSH keys for GitHub/Bitbucket covered under [SSH](#ssh) above

#### **Shell secrets** {#shell-secrets}

* `~/.config/secrets/env` — sourced by both `~/.bashrc` and `~/.zshrc`, mode 600. It sits **outside** `~/.dotfiles` on purpose: that repo is public, so a secret inside it is one `.gitignore` mistake away from being published.
* **Regenerate, do not restore** — same rule as the Claude credentials above. The file holds live API keys, so a copy in a backup is a copy to lose track of. Expected contents, by variable name:
  * `OPENAI_API_KEY` — platform.openai.com, used by the studio voice and interview tools
  * `DEEPL_API_KEY` — deepl.com account page, free tier (`:fx` suffix)
  * `BITBUCKET_USER` and `BITBUCKET_APP_PASSWORD` — not currently set; add them here when the app password is regenerated, per [Bitbucket / GitHub](#bitbucket-github) above
* Until the file exists, both shells start without error and simply have no keys, so a missing API key on a fresh machine is the expected symptom, not a broken install.

## **Essential tools** {#essential-tools}

* **A CD/DVD drive**  
  Live CDs can be burned quickly onto a DVD.   
* **Linux distro live “CD”**  
* **Internet connection**  
* **Time\!**  
* **Google account password**  
* **Phone (for 2-factor auth)**

# **When the worst happens** {#when-the-worst-happens}

* ## **Install OS** {#install-os}

  1. Configure screens and switch off “Sticky edges”  
  2. Install Spanish keyboard  
  3. To **permanently** show all hidden files/folders, in any file manager window, click Edit ▸ Preferences and select the Views tab.  
  4. To permanently show hidden files in File Manager: Edit \> Preferences

### **Restore configs** {#restore-configs}

* \~/.shh

* ## **Update OS** {#update-os}

  1. Run available updates  
  2.   
* Install Chrome  
  1. Install LastPass browser extension  
     1. Sign in with the master password  
     2. Get your main Google account password  
  2. Sign into Google  
     *All bookmarks, extensions will be synced*  
     1. ~~Disable “material design” bookmark manager~~   
        ~~chrome://flags/~~

### **Run the dotfiles script** {#run-the-dotfiles-script}

In fact, the dotfiles script installs not only your dotfiles, but apps. 

1. Install Git  
   sudo apt install \-y git  
2. Clone the Dotfiles repo  
   cd \~  
   git clone [https://github.com/markbain/dotfiles.git](https://github.com/markbain/dotfiles.git) .dotfiles  
3. cd into the directory and chmod \+x the stetup script.  
4. Run the script.  
   1. **Your password will be required at various points during the running of the script.**  
5. Run the symlinks script

### **Modern dev tooling** {#modern-dev-tooling}

Covered by the dotfiles **setup** script (Docker, DDEV, VS Code) except where noted.

* **Docker** — installed via official apt repo in `setup`  
* **DDEV** — installed via official apt repo in `setup`; current default project stack  
* **VVV \+ Vagrant \+ VirtualBox** — still installed via `setup` for legacy projects (see [VVV](#vvv) below)  
* **Node / NVM** — `setup` installs NVM and the current Node LTS via `nvm install node`; re-run `nvm install node` after restore and check `nvm alias default` matches what you need  
* **VS Code** — installed via `setup`; settings/extensions/keybindings restored automatically via built-in **Settings Sync** (sign in with the same Microsoft/GitHub account) — no manual config restore needed  
* **Claude Code** — install via the official installer ([https://docs.claude.com/en/docs/claude-code](https://docs.claude.com/en/docs/claude-code)), then restore `~/.claude` per [Claude Code](#claude-code) above and re-authenticate  
* **Bitbucket app password** — see [Bitbucket / GitHub](#bitbucket-github) above  
* **Terminator layouts** — symlinked via `symlinks` script (`~/.dotfiles/terminator/config`), includes the studio project tab layout

### **Manual installation/configuration** {#manual-installation/configuration}

Some apps are not included in the dotfiles script or require additional configuration. 

#### **Virtualbox** {#virtualbox}

* Installed via the dotfiles **setup** script (current version from the official Oracle apt repo, no manual download needed)  
* Still required for **VVV** (legacy WordPress projects) alongside Vagrant  
* Install Guest Additions if running as a VM host itself

#### **Crashplan PRO** {#crashplan-pro}

1. [Download and install the crashplan pro app](https://web-lbm-msp.crashplanpro.com/console/#/dashboard?redirectFromIndex=true)

#### **Upwork** {#upwork}

Link: [Upwork](https://www.upwork.com/downloads)

#### **Slack** {#slack}

Link: [Slack](https://slack.com/intl/es-es/signin)

1. [Find teams](https://slack.com/get-started)  
2. Download app and install   
3. Launch all teams

#### **Zoom** {#zoom}

Link: [Zoom](https://zoom.us/download)

#### **Gitkraken** {#gitkraken}

Link: [Gitkraken](https://www.gitkraken.com/download/linux-deb)

#### **Filezilla** {#filezilla}

1. Launch Filezilla to create default config files in \~/.config/filezilla.  
2. Copy backup of sitemanager.xml (obtained via Crashplan) into this directory.  
3. Open the Site Manager and check all saved sites are present.

### **Installing new OS** {#installing-new-os}

* Do so on the same PC (rather than externally or in a secondary PC) **so the UUIDs are correct in `/etc/fstab`**  
* Do so with **all the drives in place** (for same reasons)  
* Reinstall printer via **Settings \> Printers \> Add printer**  
* **Enable workspaces**  
  Settings \> Appearance \> Behavior

### **Dropbox** {#dropbox}

The dropbox folder is not backed up as part of the normal routine.

**Essential files can be accessed via the web interface and downloaded as required.** This should be the first phase of recovery.

* Location of folder  
* Sync from cloud (**will take a long time**)

### **Config files** {#config-files-1}

OS

update system and restart

Install

# **Manual Configuration** {#manual-configuration}

Many packages still require either installing or require manual configuration.

## **Filezilla** {#filezilla-1}

* Filezilla is installed via the **Setup Script**  
* Copy the backup of  sitemanager.xml to /home/mark/.config/filezilla  
* **Test:** Site Manager should show and allow access to all sites.

* Add SSH key — this will allow access to sites that need SSH keys (e.g. Ruby Tapas production)

## **Vagrant** {#vagrant}

1. Check the [version of Vagrant currently required by VVV](https://varyingvagrantvagrants.org/docs/en-US/installation/software-requirements/#installing-vagrant-and-virtualbox)   
2. [Download the .deb package](https://www.vagrantup.com/downloads.html) from the Vagrant site  
3. Install via **Software Center**  
4. Install vagrant plugins  
   vagrant plugin install vagrant-hostsupdater vagrant-triggers vagrant-vbguest

## **VVV** {#vvv}

[VVV website](https://varyingvagrantvagrants.org/)

### **Installing VVV**

1. Ensure **virtualization** is enabled in your BIOS  
2. Install VVV in the directory where you keep your code  
   e.g. git clone \-b master git://github.com/Varying-Vagrant-Vagrants/VVV.git \~/code/vagrant-local

### **Setting up existing dev projects**

#### **WordPress (VVV)**

* [Refer to these instructions for setting up existing dev projects on a new machine](https://docs.google.com/document/d/1I2hPCrXsGLV5gioWyQqXnHVbKLYGUhi3BQvU1qDCiJs/edit#).

### **Symlinks** {#symlinks}

Symlinks **do not work** in Vagrant/VVV. 

You will need to manually copy the latest vvv-custom file from \~/.dotfiles to \~/code/vagrant-local.

* CD into a dev project and try `vagrant up`

### **Setting up VVV** {#setting-up-vvv}

If you cannot access the dev drive, then you will need to set up your VVV projects again.

* Project folders **do not need to exist** before provisioning. These are created when cloning the repo.  
* WordPress files should be provisioned using wp-cli.  
* Issues with cloning? See [VVV troubleshooting docs](https://varyingvagrantvagrants.org/).
* Databases are not currently created via the provisioning script. **Do it manually.**

# **Secondary concerns** {#secondary-concerns}

## **Symlinks** {#symlinks-1}

Some symlinks will be missing and the backups broken so these will need to be set up again

* \~/dev \-\> development dir, where vvv, etc. is  
  * Used for “quick access” in VS Code

## **Crashplan Small Business** {#crashplan-small-business}

* Log into the webapp and go to [https://web-eam-msp.crashplanpro.com/console/\#/app-downloads](https://web-eam-msp.crashplanpro.com/console/#/app-downloads)  
* Unpack the .tgz archive and run the included install.sh Bash script: sudo ./install.sh  
* Use default settings

* Audacity  
* **Gitkraken**  
  * Install  
  * Re-add the repos manually

* poedit  
* Thunderbird  
* abcde

