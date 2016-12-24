#! /usr/bash
orgName="com.ognyanmoore.scripts"
hostName="Macbook Pro"

echo -e "\tDisabling Sleep while plugged-in..."
sudo pmset -c sleep 0

echo -e "\tConfiguring Git"
git config --global github.user j9ac9k
git config --global color.ui true
git config --global core.editor "subl -w"
git config --global push.default simple

echo -e "\tResetting QuickLook..."
# Reset QuickLook plugins
qlmanage -r
# Reload QuickLook cache
qlmanage -r cache

# Remove QuickLook plists
rm ~/Library/Preferences/com.apple.quicklookconfig.plist
rm ~/Library/Preferences/com.apple.QuickLookDaemon.plist

echo -e "\tEnabling access to assistive devices..."
sudo touch /private/var/db/.AccessibilityAPIEnabled

echo -e "\tSetting host name..."
sudo scutil --set HostName $hostName

echo -e "\tEnabling full keyboard access..."
# Enable full keyboard access (tab through all GUI buttons and fields, not just text boxes and lists)
sudo defaults write /Library/Preferences/.GlobalPreferences.plist AppleKeyboardUIMode -int 3

echo -e "\tSetting a blazingly fast keyboard repeat rate"
sudo defaults write NSGlobalDomain KeyRepeat -int 0

echo -e "\tSet a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 12

echo -e "\tTurn off keyboard illumination when computer is not used for 5 minutes"
sudo defaults write com.apple.BezelServices kDimTime -int 300

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

echo -e "\tDisabling guest account..."
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO

echo -e "\tSetting a login banner that reads: $loginWindowText..."
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist LoginwindowText "$loginWindowText"

echo -e "\tDisabling external accounts..."
# Disable external accounts (i.e. accounts stored on drives other than the boot drive.)
sudo defaults write /Library/Preferences/com.apple.loginwindow.plist EnableExternalAccounts -bool false

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

echo -e "\tMaking dock faster..."
defaults write com.apple.dock autohide-time-modifier -float 0

echo -e "\tMaking Mission Control faster..."
defaults write com.apple.dock expose-animation-duration -float 0

echo -e "\tEnabling spring-loading for all dock apps..."
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo -e "\tMaking maximize/minimize to scale mode..."
defaults write com.apple.dock mineffect -string "scale"

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

echo -e "\tAppending hosts file..."
sudo bash -c 'echo -e "192.168.1.12\tower\n" >> /private/etc/hosts'

echo -e "\tUse plain text mode for new TextEdit documents..."
sudo defaults write com.apple.TextEdit RichText -int 0

echo -e "\tOpen and save files as UTF-8 in TextEdit..."
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
