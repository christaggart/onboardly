#!/bin/bash
# This shell script was created at solowizard.com
#
# Usage:
#   Running the script remotely:
#     bash < <(curl -s http://www.solowizard.com/soloist_scripts/14hr0a.sh )
#   Running the script if you have downloaded it:
#     ./14hr0a.sh
#
# http://github.com/tommyh/solo_wizard
# (c) 2012, Tom Hallett
# This script may be freely distributed under the MIT license.

pushd `pwd`
if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
#- pivotal_workstation::alfred
- pivotal_workstation::bash_path_order
- pivotal_workstation::bash_profile-aliases
- pivotal_workstation::bash_profile-better_history
- pivotal_workstation::bash_profile-ctrl-o
- pivotal_workstation::bash_profile-git_completion
- pivotal_workstation::bash_profile-no_sudo_gem_install
- pivotal_workstation::bash_profile-ps1
#- pivotal_workstation::chrome
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::defaults_fast_key_repeat_rate
#- pivotal_workstation::dropbox
#- pivotal_workstation::firefox
- pivotal_workstation::flycut
- pivotal_workstation::function_keys
- pivotal_workstation::gem_no_rdoc_no_ri
#- pivotal_workstation::git
#- pivotal_workstation::github_for_mac
#- pivotal_workstation::git_config_global_defaults
- pivotal_workstation::global_environment_variables
#- pivotal_workstation::homebrew
- pivotal_workstation::increase_shared_memory
#- pivotal_workstation::inputrc
- pivotal_workstation::iterm2
#- pivotal_workstation::keyboard_preferences
#- pivotal_workstation::locate_on
- pivotal_workstation::menubar_preferences
- pivotal_workstation::osx_updates
#- pivotal_workstation::propane
- pivotal_workstation::rvm
#- pivotal_workstation::sshd_on
#- pivotal_workstation::unix_essentials
- pivotal_workstation::user_owns_usr_local
- pivotal_workstation::vagrant
- pivotal_workstation::vim
- pivotal_workstation::virtualbox
EOF
if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/christaggart/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
soloist
popd