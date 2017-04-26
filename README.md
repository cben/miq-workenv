# My [ManageIQ][1] working environment

Of little interest but Version control ALL the things!

I use multiple branches checked out below ~/miq/ using "git worktree", configured to use separate databases.

I have a manageiq checkout at `~/miq/MAINTREE`, some [plugins][2] checked out under `~/miq/PLUGINS/`, and this repo at `~/miq/WORKENV`.

MKBRANCH script run *from an existing manageiq worktree at ~/miq/foo*:

```
~/miq/foo (foo)$ ../WORKENV/MKBRANCH branch_name   # create from current directory's branch (foo)
```
can also follow with other params/options you'd pass to `git branch`:
```
~/miq/foo (foo)$ ../WORKENV/MKBRANCH branch_name origin/master
```

This will:

- create the manageiq branch
- create a new manageiq worktree for the new branch at `~/miq/branch_name`
- for every plugin in `~/miq/PLUGINS/*`:
  - a new branch with same name!  **This pollutes repos with mostly unused branches** but is needed for worktree.
  - a new worktree placed at `~/miq/branch_name/plugins/*`
- configure a new database name
- symlink to several other files from this dir that I want in all worktrees, notably `Gemfile.dev.rb`

My `Gemfile.dev.rb` does automatic `override_gem` for every dir under `plugins/`!

To remove a checkout, `rm -rf` it then:

    git worktree prune -v

CAUTION: after `git checkout`s, many dirs have branch != worktree's branch, and prune may delete these dirs!
I haven't figured the exact behavior yet, for now I'm just never pruning :-)

* I tried to be careful with resolving symlinks, using relative paths where possible etc.
  It's hopefully easy to tweak the directory layout, but I'm not even certain my setup reproduces from scratch on another machine :-)

[1]: https://github.com/ManageIQ/manageiq
[2]: https://github.com/ManageIQ/guides/blob/master/developer_setup/plugins.md

## License: Apache 2.0
http://www.apache.org/licenses/LICENSE-2.0
