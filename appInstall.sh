#!/bin/bash

#----------VARIABLES---------
# Change the variables below per your environment
orgName="com.ognyanmoore.scripts"
hostName="Macbook Pro"
loginWindowText="If found please call 650-646-8318"
osVersion=$(sw_vers -productVersion | awk -F. '{print $2}')
swVersion=$(sw_vers -productVersion)
currentDate=$(date +"%Y-%m-%d %H:%M:%S")


function installHomeBrew()
	{
	sudo xcodebuild -license
	
	#Install brew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	
	#Install brew taps
	brew update
	brew tap homebrew/science
	brew tap caskroom/versions
	brew tap homebrew/dupes
	brew tap homebrew/versions
	
	#install brew cask
	brew install caskroom/cask/brew-cask
	}

###############################
function installEssentialApps()
	{
	echo -e "\tDisabling Sleep while plugged-in..."
	sudo pmset -c sleep 0
	
	echo -e "\tCleaning Launchpad..."
	defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
	
	#installing upgraded CLI tools
	brew install openssl --with-brewed-openssl
	brew link openssl --force
	brew install file-formula
	brew install less
	brew install perl518 
	brew install rsync
	#brew install svn #Error with 10.10 see: https://github.com/Homebrew/homebrew/issues/33430
	brew install unzip
	#brew install vim --override-system-vi
	brew install macvim --override-system-vim --custom-system-icons
	brew link --overwrite macvim
	
	#install java
	brew cask install java
	
	#installing replacement utils
	brew install coreutils
	echo export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" >> ~/.bash_profile
	echo export manpath="/usr/local/opt/coreutils/libexec/gnuman:$manpath" >> ~/.bash_profile
	source ~/.bash_profile
	
	brew install binutils
	brew install diffutils
	brew install ed --default-names
	brew install findutils --default-names	
	brew install gawk
	brew install gnu-indent --default-names
	brew install gnu-sed --default-names
	brew install gnu-tar --default-names
	brew install gnu-which --default-names
	brew install gnutls --default-names
	brew install grep --default-names
	brew install gzip
	brew install screen
	brew install watch
	brew install wdiff --with-gettext
	brew install wget
	
	#installing updated command line tools
	brew install git
	brew install lastpass-cli
	brew install bash
	brew link bash --force
	brew install emacs
	brew install gdb  
	brew link --overwrite gdb
	open -a /Applications/Utilities/Keychain\ Access.app
	open https://sourceware.org/gdb/wiki/BuildingOnDarwin
	# gdb (may) requires further actions to make it work. See `brew info gdb`.
	brew install gpatch
	brew install m4
	brew install make
	brew install nano
	
	#installing wallpaper cli
	sudo gem install desktop
	brew install postgresql
	brew install mysql
	brew install node
	brew install ant
	brew install ffmpeg
	brew install eigen
	brew install opencv
	npm install -g gitjk
	sudo npm install -g cordova
	npm install phonegap -g
	
	#installing frameworks
	brew cask install xquartz 
	brew cask install flash 
	brew cask install silverlight
	brew install d-bus
	
	#d-bus post processing.
	mkdir -p ~/Library/LaunchAgents
	cp /usr/local/Cellar/d-bus/1.8.8/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
	launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
	
	#setting up docker for virtualization
	brew install docker

	#Developer configurations
	brew install ruby
	brew link --overwrite ruby
	brew install python
	brew link --overwrite python 
	
	#R-Stats...
	brew install R

	#bandaiding the java installation
	echo -e "\tMaking Java Changes..."
	javaHome=$(/usr/libexec/java_home)
	cd $javaHome && cd ..
	javaContents=$(pwd)
	sudo ln -nsf javaContents ./CurrentJDK
	cd /System/Library/Frameworks/JavaVM.framework
	sudo ln -nsf Versions/CurrentJDK/Home/include/ ./Headers
	sudo cp Headers/darwin/jni_md.h Headers/ && cd ~/
	
	R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers
	
	#ZeroMQ
	brew install zmq
	
	#graphics framework...
	brew install qt5
	brew cask install qt-creator
	
	#Latex
	brew cask install mactex
	echo export PATH=/usr/texbin:$(brew --prefix coreutils)/libexec/gnubin:"$PATH" >> ~/.bash_profile
	source ~/.bash_profile
	
	brew cask install texmaker

	#generic colorizer...
	brew install grc
	echo source "`brew --prefix`/etc/grc.bashrc" >> ~/.bash_profile
	source ~/.bash_profile

	# Install syncing software
	brew cask install dropbox
	open -a ~/Applications/Dropbox.app
	brew cask install skydrive 
	brew cask install amazon-cloud-drive
	brew cask install google-drive
	brew cask install bittorrent-sync

	# Backup and syncing
	brew cask install google-chrome
	open -a ~/Applications/Google\ Chrome.app
	brew cask install lastpass-universal
	open /opt/homebrew-cask/Caskroom/lastpass-universal/latest/lpmacosx.pkg
	brew cask install transmission
	brew cask install evernote 
	open -a ~/Applications/Evernote.app
	brew cask install spectacle	
	open -a ~/Applications/Spectacle.app
	brew cask install cyberduck
	
	#system tools
	brew cask install totalfinder 
	#brew cask install tinkertool
	#brew cask install onyx 
	brew cask install cheatsheet 
	brew cask install iterm2 
	curl -L iterm2.com/misc/install_shell_integration.sh | bash
	brew cask install quicksilver
	open -a ~/Applications/Quicksilver.app
	brew cask install flux 
	open -a ~/Applications/Flux.app
	brew cask install bettertouchtool
	open -a ~/Applications/BetterTouchTool.app
	brew cask install caffeine 
	brew cask install trim-enabler 
	open -a ~/Applications/Trim\ Enabler.app
	brew cask install gfxcardstatus
	API_KEY="INSERTKEY" brew cask install prey
	brew cask install unetbootin
	brew cask install unrarx
	brew cask install virtualbox
	brew cask install vagrant
	brew cask install vagrant-manager
	#vagrant install vagrant-virtualbox
	brew cask install deathtodsstore
	open -a ~/DeathToDSStore.app

	#software development
	brew cask install github 				#github GUI
	open -a ~/Applications/GitHub.app
	brew cask install arduino 				#Arduino IDE
	brew cask install processing 			#Arudino Software Addons
	brew cask install mysqlworkbench 		#SQL Editor
	brew cask install sublime-text3 		#text editor
	#adding sublime text cli
	mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
	
	echo "Install Sublime Package Manager"
	open https://sublime.wbond.net/installation#st3
	open -a ~/Applications/Sublime\ Text.app
	
	brew cask install textmate 				#text editor
	brew cask install pycharm-ce 			#Python IDE for large projects
	brew cask install spyder 				#Python IDE for Scientific Computing
	brew cask install android-studio-bundle #Android IDE
	brew cask install mou 					#Markup editor/viewer
	brew cask install dash 					#Offline API Documentation
	brew cask install rstudio 				#R-Stats IDE

	#media 
	#brew cask install kindle
	brew cask install steam
	brew cask install plex-home-theater
	brew cask install spotify
	brew cask install calibre
	brew cask install vlc
	brew cask install amazon-music
	brew cask install chromecast
	
	#installing fonts
	echo -e "\tInstalling fonts"
	brew tap caskroom/fonts
	fonts=(
		font-m-plus
		font-clear-sans
		font-roboto
	)
	brew cask install ${fonts[@]}
	
	#Post Processing
	echo -e "\tPost Processing Homebrew"
	brew update && brew upgrade && brew cleanup

	#configuring git
	echo -e "\tConfiguring Git"
	git config --global user.name "Ognyan Moore"
	git config --global user.email "ognyan.moore@jacobs.ucsd.edu"
	git config --global github.user j9ac9k
	git config --global color.ui true
	git config --global core.editor "subl -w"
	
	#allowing for auto-complete in bash
	echo -e "\tAllowing auto-complete for git in bash"
	echo source `brew --prefix git`/etc/bash_completion.d/git-completion.bash >> ~/.bashrc
	source ~/.bashrc
	
	#transfering git with HTTPS (needs to store/cache password)
	sudo mv git-credential-osxkeychain \
		"$(dirname $(which git))/git-credential-osxkeychain"
	git config --global credential.helper osxkeychain

	echo -e "\Hiding  /opt..."
	sudo chflags hidden /opt
	}

###########################
function quickLookPlugins()
	{
	# QuickLook Enhancements
	echo -e "\tInstalling QuickLook Enahcements"
	brew cask install qlcolorcode
	brew cask install qlmarkdown
	brew cask install qlimagesize
	brew cask install qlmarkdown
	brew cask install qlprettypatch
	brew cask install qlrest
	brew cask install qlstephen
	brew cask install quicklook-csv
	brew cask install quicklook-json
	brew cask install quicklook-pfm
	brew cask install betterzipql
	brew cask install webp-quicklook
	qlmanage -r
	}

##########################
function resetQuickLook()
	{
	echo -e "\tResetting QuickLook..."
	# Reset QuickLook plugins
	qlmanage -r
	# Reload QuickLook cache
	qlmanage -r cache

	# Remove QuickLook plists
	rm ~/Library/Preferences/com.apple.quicklookconfig.plist
	rm ~/Library/Preferences/com.apple.QuickLookDaemon.plist
	}

##########################
function systemSettings()
	{
    echo "******Deploying system-wide settings******"
	
	echo -e "\tEnabling access to assistive devices..."
	sudo touch /private/var/db/.AccessibilityAPIEnabled
	
	echo -e "\tSetting host name..."
	sudo scutil --set HostName $hostName

	#--------------------#
	# Keyboard
	#--------------------#
	echo -e "\tEnabling full keyboard access..."
	# Enable full keyboard access (tab through all GUI buttons and fields, not just text boxes and lists)
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist AppleKeyboardUIMode -int 3
	
    echo -e "\tSetting a blazingly fast keyboard repeat rate"
    sudo defaults write NSGlobalDomain KeyRepeat -int 0
	
	echo -e "\tSet a shorter Delay until key repeat"
	defaults write NSGlobalDomain InitialKeyRepeat -int 12
	
	echo -e "\tTurn off keyboard illumination when computer is not used for 5 minutes"
	sudo defaults write com.apple.BezelServices kDimTime -int 300
	
	#-------------------#
	# Mouse
	#-------------------#	
	echo -e "\tMaking the scroll dragging speed faster..."
	defaults write -g NSAutoscrollResponseMultiplier -float 3
	
	#echo -e "\tIncreasing mouse tracking to 3..."
	#defaults write -g com.apple.mouse.scaling -float 3

	#echo -e "\tIncreasing trackpad tracking to 3..."
	#defaults write -g com.apple.trackpad.scaling -int 3
	
	echo -e "\tEnabling tap-to-click..."
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	
	#----------------------#
	# Login/User Related   
	#----------------------#
	echo -e "\tDisabling guest account..."
	sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO
	
	echo -e "\tSetting a login banner that reads: $loginWindowText..."
	sudo defaults write /Library/Preferences/com.apple.loginwindow.plist LoginwindowText "$loginWindowText"
	
    echo -e "\tDisabling external accounts..."
    # Disable external accounts (i.e. accounts stored on drives other than the boot drive.)
    sudo defaults write /Library/Preferences/com.apple.loginwindow.plist EnableExternalAccounts -bool false
		
	#-----------------------#
	# Disabling Prompts
	#-----------------------#
	echo -e "\tDisabling prompt to use drives for Time Machine..."
    sudo defaults write /Library/Preferences/com.apple.TimeMachine.plist DoNotOfferNewDisksForBackup -bool true

	echo -e "\tDisable the 'Are you sure you want to open this application?' dialog..."
	defaults write com.apple.LaunchServices LSQuarantine -bool false

    echo -e "\tAutomatically quit printer app once the print jobs complete"
    sudo defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

	echo -e "\tExpanding the print dialog by default..."
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist PMPrintingExpandedStateForPrint -bool true
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist PMPrintingExpandedStateForPrint2 -bool true

	echo -e "\tExpanding the save dialog by default..."
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist NSNavPanelExpandedStateForSaveMode -bool true
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist NSNavPanelExpandedStateForSaveMode2 -bool true
	
	echo -e "\tDisabling crash report dialogs..."
	sudo defaults write com.apple.CrashReporter DialogType none
	
	echo -e "\tDisable the warning when changing a file extension? (y/n)"
	sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	
	echo -e "\tDisable display from automatically adjusting brightness"
	sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false

	echo -e "\tSpeeding up the shutdown delay..."
	sudo defaults write /System/Library/LaunchDaemons/com.apple.coreservices.appleevents.plist ExitTimeOut -int 5
	sudo defaults write /System/Library/LaunchDaemons/com.apple.securityd.plist ExitTimeOut -int 5
	sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ExitTimeOut -int 5
	sudo defaults write /System/Library/LaunchDaemons/com.apple.diskarbitrationd.plist ExitTimeOut -int 5
	sudo defaults write /System/Library/LaunchAgents/com.apple.coreservices.appleid.authentication.plist ExitTimeOut -int 5

	echo -e "\tCheck for software updates daily (not weekly)..."
	sudo defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
	
	echo -e "\tDisabling Spotlight indexing on /Volumes..."
	sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

	echo -e "\tDisabling smart-quotes and smart-dashes..."
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist NSAutomaticQuoteSubstitutionEnabled -bool false
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist NSAutomaticDashSubstitutionEnabled -bool false

	echo -e "\tMaking scrollbars always visible..."
	sudo defaults write /Library/Preferences/.GlobalPreferences.plist AppleShowScrollBars -string "Always"

	echo -e "\tEnabling secure virtual memory..."
	sudo defaults write /Library/Preferences/com.apple.virtualMemory UseEncryptedSwap -bool yes

	echo -e "\tSetting time to 24-hour..."
	sudo defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

	ssdCheck=$(diskutil info / | awk '/Solid State/ {print $3}')
	if [ $ssdCheck = "Yes" ];then
		echo -e "\tSolid State Drive detected..."
		# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
		echo -e "\t\tDisabling Time Machine local snapshots..."
		sudo tmutil disablelocal

		echo -e "\t\tDisabling hibernation..."
		sudo pmset -a hibernatemode 0

		echo -e "\t\tRemoving the sleep image..."
		sudo rm /Private/var/vm/sleepimage
		sudo touch /Private/var/vm/sleepimage
		sudo chflags uchg /Private/var/vm/sleepimage

		echo -e "\t\tDisabling Sudden Motion Sensor..."
		sudo pmset -a sms 0
	else
		echo -e "\tRotational hard disk detected.  No additional setting..."
	fi
	}

#########################
function finderSettings()
	{
	echo "******Deploying Finder settings******"
	
	echo "**---------------FINDER--------"
		
	echo -e "\tSetting home folder as the default location for new Finder windows..."
	defaults write com.apple.finder NewWindowTarget -string "PfLo"
	defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

	echo -e "\tShowing Hard Drives on Desktop..."
	#defaults -currentHost write com.apple.finder ShowHardDrivesOnDesktop -bool YES

	echo -e "\tShowing Servers on Desktop..."
	#defaults -currentHost write com.apple.finder ShowMountedServersOnDesktop -bool YES
	
	echo -e "\tShowing External Hard Drives on Desktop..."
	defaults -currentHost write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES
	
	echo -e "\tShowing removeable media on Desktop..."
	defaults -currentHost write com.apple.finder ShowRemovableMediaOnDesktop -bool YES

	echo -e "\tSetting Finder to column view..."
	defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

	echo -e "\tSetting Finder to search the current folder..."
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

	echo -e "\tShowing status bar..."
	defaults write com.apple.finder ShowStatusBar -bool true

	echo -e "\tShowing path bar..."
	defaults write com.apple.finder ShowPathbar -bool true

	echo -e "\tShowing POSIX path bar..."
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

	echo -e "\tEnabling QuickLook text-selection..."
	defaults write com.apple.finder QLEnableTextSelection -bool true

	echo -e "\tEnabling QuickLook x-ray vision..."
	defaults write com.apple.finder QLEnableXRayFolders -bool true

	echo -e "\tMaking Finder animations faster..."
	defaults write com.apple.finder DisableAllAnimations -bool true

	echo -e "\tShowing all file extensions..."
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
	
	# Expand the following File Info panes:
	echo -e "\tShowing General, Open with, and Sharing & Permissions on the Get Info window..."
	defaults write com.apple.finder FXInfoPanesExpanded -dict \
		General -bool true \
		OpenWith -bool true \
		Privileges -bool true

	echo -e "\tEnabling Airdrop over Ethernet..."
	defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
	
	echo -e "\tRemoving duplicates in the 'Open With' menu..."
	/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
	
	echo -e "\tDeath to network .DS_Stores..."
	defaults write com.apple.desktopservices DSDontWriteNetworkStores true

	echo -e "\tMaking window animations faster..."
	defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
	defaults write com.apple.finder DisableAllAnimations -bool true

	echo -e "\tMaking QuickLook animation faster..."
	defaults write -g QLPanelAnimationDuration -float 0

	echo -e "\tMaking the ~/Library folder visible for ${HOME}..."
	chflags nohidden ~/Library/
	}

#######################	
function dockSettings()
	{
	echo "******Deploying Dock settings******"

	echo "**---------------DOCK--------"
	
	echo -e "\tMaking spaces static..."
	defaults write com.apple.dock mru-spaces -bool false
	
	echo -e "\tSetting the icon size of Dock items to 36 pixels for optimal size..."
	sudo defaults write com.apple.dock tilesize -int 36

	echo -e "\tMaking hidden apps translucent..."
	defaults write com.apple.dock showhidden -bool true

	echo -e "\tRemoving dock auto hide delay..."
	defaults write com.apple.dock autohide-delay -float 0

	echo -e "\tMaking dock faster..."
	defaults write com.apple.dock autohide-time-modifier -float 0

	echo -e "\tMaking Mission Control faster..."
	defaults write com.apple.dock expose-animation-duration -float 0

	echo -e "\tEnabling spring-loading for all dock apps..."
	defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
	
	echo -e "\tMaking maximize/minimize to scale mode..."
	defaults write com.apple.dock mineffect -string "scale"

	#echo -e "\tSetting top-left corner to Mission Control..."
	#defaults write com.apple.dock wvous-tl-corner -int 2		# Mission Control
	#defaults write com.apple.dock wvous-tl-modifier -int 0

	#echo -e "\tSetting top-right corner to Notification Center..."
	#defaults write com.apple.dock wvous-tr-corner -int 12		# Notification Center
	#defaults write com.apple.dock wvous-tr-modifier -int 0

	#echo -e "\tSetting bottom-left corner to Show Desktop..."
	#defaults write com.apple.dock wvous-bl-corner -int 4		# Show Desktop
	#defaults write com.apple.dock wvous-bl-modifier -int 0

	#echo -e "\tSetting bottom-right corner to Launchpad..."
	#defaults write com.apple.dock wvous-br-corner -int 11		# Launchpad
	#defaults write com.apple.dock wvous-br-modifier -int 0
	
	brew install dockutil
	brew linkapps
	dockutil --remove all
	dockutil --add ~/Applications/iTerm.app
	dockutil --add /Applications/Launchpad.app
	#dockutil --add /Applications/App\ Store.app
	dockutil --add ~/Applications/Google\ Chrome.app 
	dockutil --add ~/Applications/Spotify.app 
	dockutil --add ~/Applications/Steam.app
	dockutil --add ~/Applications/VLC.app	
	dockutil --add ~/Applications/Plex\ Home\ Theater.app
	dockutil --add ~/Applications/Evernote.app
	dockutil --add ~/Applications/Sublime\ Text.app
	dockutil --add ~/Applications/TextMate.app
	dockutil --add ~/Applications/Spyder.app
	dockutil --add ~/Applications/PyCharm\ CE.app
	dockutil --add ~/Applications/RStudio.app
	dockutil --add /Applications/Designer.app
	dockutil --add ~/Applications/GitHub.app
	dockutil --add ~/Applications/Mou.app
	dockutil --add ~/Applications/texmaker.app
	dockutil --add ~/Applications/Dash.app
	#dockutil --add /Applications/Utilities/Activity\ Monitor.app
	dockutil --add '~/Downloads' --view grid --display folder --allhomes --section others
	}
	
########################
function otherSettings()
	{
	echo "******Deploying misc. settings******"

	echo "**------------MISC---------"

	echo -e "\tDisabling Dashboard..."
	defaults write com.apple.dashboard mcx-disabled -boolean YES
	
	echo -e "\tDisabling Notificaiton Center..."
	launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

	echo -e "\tDisabling iCloud as the default save location..."
	defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

	#----------------------#
	# Volume Related
	#----------------------#
	echo -e "\tDisabling volume change feedback..."
	defaults write -g com.apple.sound.beep.feedback -int 0

	echo -e "\tDisabling Apple Chime on boot..."
	sudo nvram SystemAudioVolume=" "

	#----------------------#
	# Safari Related
	#----------------------#	
	echo -e "\tMaking Safari search banners using Contains instead of Starts With..."
	defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
	
	echo -e "\tSetting default Safari Webpage..."
	defaults write com.apple.Safari HomePage -string "https://www.google.com"

	echo -e "\tIncreasing sound quality of Bluetooth and headphones..."
	defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

	echo -e "\tAllow text selection in quick look/preview in finder by default..."
	sudo defaults write com.apple.finder QLEnableTextSelection -bool true

	#----------------------#
	# Symbolic Links
	#----------------------#
	echo -e "\tMaking symbolic link to airport utility..."
	sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport

	echo -e "\tMaking symbolic link to Wireless Diagnostics utility..."
	sudo ln -s /System/Library/CoreServices/Applications/Wireless\ Diagnostics.app /Applications/Utilities/Wireless\ Diagnostics.app

	echo -e "\tMaking symbolic link to Network utility..."
	sudo ln -s /System/Library/CoreServices/Applications/Network\ Utility.app /Applications/Utilities/Network\ Utility.app 

	echo -e "\tMaking symbolic link to Screen Sharing utility..."
	sudo ln -s /System/Library/CoreServices/Applications/Screen\ Sharing.app /Applications/Screen\ Sharing.app 	
	
	#----------------------#
	# Hosts File
	#----------------------#
	echo -e "\tAppending hosts file..."
	sudo bash -c 'echo -e "192.168.1.12\ttower\n" >> /private/etc/hosts'
	
	#----------------------#
	# TextEdit
	#----------------------#
	echo -e "\tUse plain text mode for new TextEdit documents..."
	sudo defaults write com.apple.TextEdit RichText -int 0
	
	echo -e "\tOpen and save files as UTF-8 in TextEdit..."
	defaults write com.apple.TextEdit PlainTextEncoding -int 4
	defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4	
	
	#----------------------#
	# Terminal
	#----------------------#
	#Improving bash history...
	echo -e "\tImproving bash history..."
	echo "HISTTIMEFORMAT='Y-%m-%d %T'" > ~/.bash_profile
	echo "HISTFILESIZE=65535" >> ~/.bash_profile
	echo "export PROMPT_COMMAND='history -a'" >> ~/.bash_profile
	source ~/.bash_profile

	# Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default
	defaults write com.apple.terminal StringEncodings -array 4
	defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
	defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

	# New tabs open with Default Working Directory
	defaults write com.apple.Terminal NewTabWorkingDirectoryBehavior -bool true	
	
	#----------------------#
	# iTerm 2
	#----------------------#
	# Don’t display the annoying prompt when quitting iTerm
	defaults write com.googlecode.iterm2 PromptOnQuit -bool false	
	}
	
##################################
function activityMonitorSettings()
	{
	echo "******Deploying Activity Monitor settings******"

	echo "**------------ACTIVITY MONITOR---------"

	echo -e "\tSetting the Dock icon to show CPU usage..."
	defaults write com.apple.ActivityMonitor IconType -int 5

	echo -e "\tShowing all processes by default..."
	defaults write com.apple.ActivityMonitor ShowCategory -int 0

	echo -e "\tAdding the % CPU column to the Disk and Network tabs..."
	defaults write com.apple.ActivityMonitor "UserColumnsPerTab v4.0" -dict \
	    '0' '( Command, CPUUsage, CPUTime, Threads, IdleWakeUps, PID, UID )' \
	    '1' '( Command, anonymousMemory, Threads, Ports, PID, UID, ResidentSize )' \
	    '2' '( Command, PowerScore, 12HRPower, AppSleep, graphicCard, UID )' \
	    '3' '( Command, bytesWritten, bytesRead, Architecture, PID, UID, CPUUsage )' \
	    '4' '( Command, txBytes, rxBytes, txPackets, rxPackets, PID, UID, CPUUsage )'

	echo -e "\tSort by CPU usage in Disk and Network tabs..."
	defaults write com.apple.ActivityMonitor UserColumnSortPerTab -dict \
	    '0' '{ direction = 0; sort = CPUUsage; }' \
	    '1' '{ direction = 0; sort = ResidentSize; }' \
	    '2' '{ direction = 0; sort = 12HRPower; }' \
	    '3' '{ direction = 0; sort = CPUUsage; }' \
	    '4' '{ direction = 0; sort = CPUUsage; }'	
	}
	
###############################
function yosemiteSpecific()
	{
	echo -e "\tEnabling dark mode..."
	sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark	
	}
	
#################
function configurePython()
	{
	#install miniconda
	echo -e "\tDownloading/Installing Miniconda"
	cd ~/
	wget http://repo.continuum.io/miniconda/Miniconda-3.7.0-MacOSX-x86_64.sh
	bash Miniconda-3.7.0-MacOSX-x86_64.sh
	rm Miniconda-3.7.0-MacOSX-x86_64.sh

	#echo export PATH='$HOME/miniconda/bin:$PATH' >> ~/.bash_profile
	source ~/.bash_profile
	
	echo -e "\tUpdating miniconda"
	conda update conda --yes
	conda install binstar --yes
	
	#this guy has a bunch of packages I want
	conda config --add channels asmeurer

	echo -e "\tInstalling bulk of packages"
	conda install numpy --yes
	conda install scipy --yes
	conda install pandas --yes
	conda install pymc --yes
	conda install matplotlib --yes
	conda install seaborn --yes
	conda install mayavi --yes
	conda install ipython --yes
	conda install ipython-qtconsole --yes
	conda install ipython-notebook --yes
	conda install sqlite --yes
	conda install scikit-learn --yes
	conda install pycrypto --yes
	conda install sip --yes
	
	#GUI Libraries
	conda install pyqt5 --yes
	conda install pyside --yes
	
	#bokeh is a modern visualization library targeting web browsers
	conda install bokeh --yes
	
	#contains pygame package
	conda config --add channels quasiben
	conda install pygame --yes
	
	#adding the embedding of R code to iPython-Notebook
	conda config --add channels xbsd
	conda install rpy2 --yes
	#to run R code first run: %load_ext rpy2.ipython
	
	#install pip and pip-tools
	conda install pip --yes
	pip install pip-tools

	#physics simulations
	brew install chipmunk
	pip install pymunk

	#installing compilers
	pip install pyinstaller
	pip install cx_Freeze
	
	#Installing spyder dependencies
	echo -e "\tInstalling Spyder dependencies"
	conda install sphinx --yes
	conda install rope --yes
	conda install pyflakes --yes
	conda install pylint --yes
	conda install psutil --yes
	
	#tidying up
	echo -e "\tUpdating Conda"
	conda update --all
	
	echo -e "\tCleaning Up..."
	conda clean -ilt --yes
	}

############
function setupzsh()
	{
	#installing zsh
	brew install zsh

	#run the zsh setup script (syntax error within bash)
	zsh zshSetup.sh
	}
	
function downloads()
	{
	#Solorized themes...
	echo -e "\tDownloading Solorized Themes..."
	curl -o ~/Downloads/solarized.zip http://ethanschoonover.com/solarized/files/solarized.zip
		
	#TextMate and Sublime Text Themes
	echo -e "\tDownloading Textmate and Sublime Themes..."
	git clone https://github.com/s2k/Close-to-the-Sea ~/Downloads/Themes/TextMate/Close-to-the-Sea
	git clone https://github.com/squidfunk/textmate-themes/*.tmTheme ~/Downloads/Theme/TextMate/shipwreck
	git clone https://github.com/nikeee/Visual-Studio-Dark ~/Downloads/Themes/TextMate/Visual-Studio
		
	#Solorized Spyder Themes
	echo -e "\tDownloading Solorized Spyder Theme"
	git clone https://github.com/pshchelo/spyder-color-solarized ~/Downloads/Themes/Spyder/Solorized
		
	#pycharm editor colors and placing them in correct place...
	echo -e "\tCloning PyCharm Themes..."
	git clone git://github.com/d1ffuz0r/pycharm-themes.git ~/GitHub/pycharm-themes
	mv ~/GitHub/pycharm-themes/colors/*.icls ~/Library/Preferences/PyCharm30/colors
	rm -rf ~/GitHub/pycharm-themes
		
	#Panda Cookbook
	echo -e "\tCloning pandas-cookbook"
	git clone https://github.com/jvns/pandas-cookbook ~/GitHub/pandas-cookbook
		
	#Probabilistic Programming and Bayesian Methods for Hackers
	echo -e "\tCloning Probabilistic Programming and Bayesian Methods for Hackers"
	git clone https://github.com/CamDavidsonPilon/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers ~/GitHub/probabilistic-programming-and-bayesian-methods-for-hackers
		
	#100 Python Projects
	echo -e "\tCloning 100-Projects"
	git clone https://github.com/karan/Projects ~/GitHub/100-projects
		
	#Python Guide
	echo -e "\tCloning Python Guide"
	git clone https://github.com/kennethreitz/python-guide ~/GitHub/python-guide
		
	#ipython cookbook
	echo -e "\tCloning iPython Cookbook"
	git clone https://github.com/ipython-books/cookbook-code ~/GitHub/ipython-cookbook
		
	#numpy cookbook
	echo -e "\tCloning NumPy Cookbook"
	git clone https://github.com/rlabbe/numpy-cookbook ~/GitHub/numpy-cookbook
		
	#learn data science
	echo -e "\tCloning Learn-Data-Science"
	git clone https://github.com/nborwankar/LearnDataScience ~/GitHub/learn-data-science
		
	#brew cask
	echo -e "\tCloning homebrew-cask"
	git clone https://github.com/j9ac9k/homebrew-cask ~/GitHub/homebrew-cask
		
	cd ~/GitHub/homebrew-cask
	git remote add upstream https://github.com/caskroom/homebrew-cask.git
	git fetch upstream
	}	
#------------------------------		
#-------BEGIN SCRIPT-----------
#------------------------------	
systemSettings
otherSettings
finderSettings
installHomeBrew
installEssentialApps
yosemiteSpecific
quickLookPlugins
resetQuickLook
activityMonitorSettings
dockSettings
safariSettings
configurePython
downloads
setupzsh

echo "******COMPLETE******"
echo -e "\n\n*********************************"
echo -e "\n\nReboot now to apply all settings."
echo -e "\n\n*********************************"