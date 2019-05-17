#!/bin/sh
# https://github.com/h1karxii/git-remove-submodule

exit_err() {
  # http://linux.vbird.org/linux_basic/0340bashshell-scripts.php#dis3
  [ $# -gt 0 ] && echo "fatal: $*" 1>&2
  exit 1
}

# http://wanggen.myweb.hinet.net/ach4/ach4.html?MywebPageId=2019171558072762472#sed_basic
# https://blog.csdn.net/zhu_xun/article/details/24796235
# https://askubuntu.com/questions/678915/whats-the-difference-between-and-in-bash
submodule_name=$(sed 's/\/$//' <<< $1)

# https://www.opencli.com/linux/dev-null-2-and-1-meanning
# http://blog.jobbole.com/109355/
git submodule status "$submodule_name" >/dev/null 2>&1

if [ $? == 0 ]; then
  # Clear the relevant section from .git/config.
  git submodule deinit -f "$submodule_name"

  # Clear the relevant section from the .gitmodules file.
  # Remove submodule files from the working tree and from the index.
  git rm -f "$submodule_name"

  # Below step which clears the relevant section from the .gitmodules file
  # was commented because it had been merged to above step.
  # git config -f .gitmodules --remove-section "submodule.$submodule_name" 2>/dev/null

  rm -rf .git/modules/"$submodule_name"
  if [ -z "$(cat .gitmodules)" ]; then
    git rm -f .gitmodules
  fi

  echo "Remove submodule <$submodule_name> successfully!"
else
  exit_err "Submodule '$submodule_name' do not exist!"
fi

