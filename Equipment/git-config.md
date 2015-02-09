#Recommended git config stuff

##Dealing with firewall

 * `git config --global url.https://.insteadOf git://`

##Pushing only feature changes, and only on current branch

This should no longer be an issue if we update to version 1.7.11 or later. See http://stackoverflow.com/a/10829461/1858225

 * `git config --global push.default upstream`
