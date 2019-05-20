# git-remove-submodule
Due to how git remove submodule takes a lot of work,<br>
I wrote this script which modified from [here](https://gist.github.com/sharplet/6289697).<br>
After running this script, you need to commit the changes by yourself.

## Usage
```bash

bash <(curl -fsSL https://raw.githubusercontent.com/h1karxii/git-remove-submodule/master/git_remove_submodule.sh) SUBMODULE_NAME

```

## What if I want to do it myself ?
If you want to remove git submodule by yourself,<br>
you must follow below steps:
```bash
git config -f .gitmodules --remove-section "submodule.SUBMODULE_NAME"
git add .gitmodules
git config -f .git/config --remove-section "submodule.SUBMODULE_NAME"
git rm -f "SUBMODULE_NAME"
rm -rf .git/modules/SUBMODULE_NAME
rm -rf "SUBMODULE_NAME"
```

or faster way below:
```bash
git submodule deinit -f "SUBMODULE_NAME"
git rm -f "SUBMODULE_NAME"
rm -rf .git/modules/SUBMODULE_NAME
```

## Reference
[myusuf3/delete_git_submodule.md](https://gist.github.com/myusuf3/7f645819ded92bda6677)

[sharplet/git-remove-submodule](https://gist.github.com/sharplet/6289697)

[twtrubiks/Git-Tutorials](https://github.com/twtrubiks/Git-Tutorials/blob/master/git_submodule_turorial.md)