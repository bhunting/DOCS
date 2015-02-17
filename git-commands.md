tl;dr

Do once per feature
  * `git fetch -p`
  * `git checkout -b TR-0001-new-feature origin/master`
  * `git push origin TR-0001-new-feature`

Do once per adding new files, single or group of files
  * `git add [.][filename]`

Loop as you add to feature
  * `write code here`
  * `git commit -a -m"commit message here"`  OR   `git commit -m"commit message here" [.][filename]`
  * `git fetch --prune`
  * `git merge origin/master`
  * `git push origin TR-0001-new-feature`
  * build and run against test suite often

When feature requires discussion or is ready for integration issue a pull request on Github

When feature is ready to integrate into master
  * `git fetch --prune`
  * `git checkout TR-0001-new-feature`
  * `git rebase origin/master`
  * `git checkout master`
  * `git merge --squash TR-0001-new-feature`
  * `git commit -a -m"TR-0001-new-feature"`
  * `git push origin master`
  * `git branch -D TR-0001-new-feature`
  * `git push origin --delete TR-0001-new-feature`


---
#### Aliases

Use `git config --global alias.XX xxxxx` to create aliases.

Use `git config --global --list` to show existing global configurations, including aliases.

Alternatively open `~/.gitconfig ` in an editor and look for a section labled `[alias]`.  

Aliases are defined in `~/.gitconfig` as ` XX = xxxxx`.

##### Define interesting aliases

New Feature Branch - nfb -- fetch, checkout -b, push

Commit Feature Branch - cfb -- commit -a -m

Merge Master - mm -- fetch, merge, push

Integrate To Master - itm -- fetch, rebase, merge --squash, commit, push

Delete Feature Branch -- dfb

---

Git Process description
  * master branch is always buildable and deployable
  * Create local branches off of origin/master
  * Use descriptive names for feature branches
  * Include tracking number at the beginning of the feature branch
  * Push feature branches to remote often
  * Open a pull request at any time
  * Merge from origin/master often
  * Create a pull request before checking into master
  * Rebase feature branch off of origin/master after pull request is OK'ed
  * Merge --squash feature branch onto master
  * Push to origin/master
  * Delete old local feature branch
  * Delete old remote feature branch
  
Alternative is rebase -i off of origin/master and push directly to origin HEAD:master

Goal is to have master branch buildable and deployable at all time.  Anything checked into master must be at least reviewed and pass automated testing. 

Never create new features directly in master.
Create a feature branch for creating new assets.

Refresh the source branch, usually master, before branching
  * `git checkout master`
  * `git fetch --prune`
  * `git merge origin/master`

OR

  * `git checkout master`
  * `git pull -p`

Create a new feature branch to work the issue. Add the feature or issue tracking number to the start of the feature branch name.
  * `git checkout master`
  * `git pull -p`
  * `git checkout -b TR-0001-new-feature`

OR

  * `git fetch -p`
  * `git checkout -b TR-0001-new-feature origin/master`

> See http://www.lornajane.net/posts/2014/understanding-tracking-branches-in-git for comments on tracking branches. Setting the tracking branch sets the default push/pull tracking branch. We want to use `origin/TR-0001-new-feature` instead of `origin/master` as the remote tracking branch. 
> 
> Investigation indicates the default push schema pushes to the same named remote branch instead of the origin/master. That is if you create a branch off of origin/master
> 
> `git checkout -b TR-0001-new-feature origin/master`
> 
> and then push that new feature branch to the remote
> 
> `git push origin TR-0001-new-feature`
> 
> then the default push `git push` pushes to the same named remote branch.
> 
> Looking at http://git-scm.com/docs/git-config the default config for push is `simple`.
> 
> `git config --global push.default simple`
> 
> `git config --global push.default current`
>
> The result is that it seems to be ok to branch off of origin/master and then push the new branch to the remote. The result is simple pushes will go to the similarly named remote branch.


Immediately push the feature to github so it is visible to other developers.
  * `git push origin TR-0001-new-feature`

Create new feature while on feature branch.
  * `write code here`
  * `git add [.][filename]`
  * `git commit -a -m"commit message here"`
  * `git commit -m"commit message here" [.][filename]`


Merge feature off of master on a regular basis.
  * `git fetch --prune`
  * `git merge origin/master`

Push the feature branch to github early and often.
  * `git push origin TR-0001-new-feature`

OR

  * `git push`

Build and run automated tests regularly

When you think you are done:
  * issue a pull request on github against your pushed feature branch.

When the feature has passed review then squash and commit to master:

First update local master
  * `git checkout master`

Fetch remote to update origin/master
  * `git fetch -p`
  * `git merge origin/master`

OR

  * `git pull`

Rebase feature branch off of origin/master

  * `git checkout TR-0001-new-feature`
  * `git rebase origin/master`

Merge feature onto master

  * `git checkout master`
  * `git merge --squash TR-0001-new-feature`

  * `git commit -a -m"TR-0001-new-feature"`
  * `git push origin master`

> As an alternative you can checkout the feature branch, do an interactive rebase off of master to squash all commits and give a single commit message, then push directly to origin/master.
>
> `git checkout TR-0001-new-feature`
>
> `git fetch --prune` to update origin/master
>
> `git rebase -i origin/master`
>
> Pick and Squash as appropriate
>
> Edit commit message as appropriate
>
> `git push origin HEAD:master`


Delete unused branches

  * `git branch -D TR-0001-new-feature`
  * `git push origin --delete TR-0001-new-feature`




