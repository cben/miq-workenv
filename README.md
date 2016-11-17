# My [ManageIQ][1] working environment

Of little interest but Version control ALL the things!

I use multiple branches checked out below ~/miq/ using "git worktree", configured to use separate databases.
I have a manageiq checkout at ~/miq/MAINTREE and this repo at ~/miq/WORKENV;
MKBRANCH script run from any existing manageiq checkout creates a new one.

To remove a checkout, `rm -rf` it then:

    git worktree prune -v

[1]: https://github.com/ManageIQ/manageiq

## License: Apache 2.0
http://www.apache.org/licenses/LICENSE-2.0
