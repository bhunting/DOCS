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

The following command causes feature brach to track origin/master - not sure that's what we want
  * `git checkout -b TR-0001-new-feature origin/master`

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

  * `git commit -a -m"TR-0001-new-feature`
  * `git push origin master`

Delete unused branches

  * `git branch -D TR-0001-new-feature`
  * `git push origin --delete TR-0001-new-feature`




