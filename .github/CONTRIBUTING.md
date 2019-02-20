# Contributing

Contributions are welcome. I accept pull requests on [GitHub][].

This project adheres to a [Contributor Code of Conduct][]. By participating in
this project and its community, you are expected to uphold this code.


## Communication Channels

You can find help and discussion in the following places:

* GitHub Issues: <https://github.com/ramsey/docker-pennmush/issues>


## Reporting Bugs

Bugs are tracked in the project's [issue tracker][issues].

When submitting a bug report, please include enough information to reproduce the
bug. A good bug report includes the following sections:

* Expected outcome
* Actual outcome
* Steps to reproduce, including sample code
* Any other information that will help debug and reproduce the issue, including
  stack traces, system/environment information, and screenshots

**Please do not include passwords or any personally identifiable information in
your bug report and sample code.**


## Fixing Bugs

I welcome pull requests to fix bugs!

If you see a bug report that you'd like to fix, please feel free to do so.
Following the directions and guidelines described in the "Adding New Features"
section below, you may create bugfix branches and send pull requests.


## Adding New Features

If you have an idea for a new feature, it's a good idea to check out the
[issues][] or active [pull requests][] first to see if the feature is already
being worked on. If not, feel free to submit an issue first, asking whether the
feature is beneficial to the project. This will save you from doing a lot of
development work only to have your feature rejected. I don't enjoy rejecting
your hard work, but some features just don't fit with the goals of the project.

When you do begin working on your feature, here are some guidelines to consider:

* Your pull request description should clearly detail the changes you have made.
  I will use this description to update the CHANGELOG. If there is no
  description or it does not adequately describe your feature, I will ask you
  to update the description.
* **Use topic/feature branches.** Please do not ask to pull from your master
  branch.
  * For more information, see "[Understanding the GitHub flow][gh-flow]."
* **Submit one feature per pull request.** If you have multiple features you
  wish to submit, please break them up into separate pull requests.
* **Write good commit messages.** Make sure each individual commit in your pull
  request is meaningful. If you had to make multiple intermediate commits while
  developing, please squash them before submitting.
  * For more information, see "[How to Write a Git Commit Message][git-commit]."


## Building

To build the image, run the following Docker command:

``` bash
docker build -t yourname/pennmush:tagname .
```


[github]: https://github.com/ramsey/docker-pennmush
[contributor code of conduct]: https://github.com/ramsey/docker-pennmush/blob/master/.github/CODE_OF_CONDUCT.md
[issues]: https://github.com/ramsey/docker-pennmush/issues
[pull requests]: https://github.com/ramsey/docker-pennmush/pulls
[gh-flow]: https://guides.github.com/introduction/flow/
[git-commit]: https://chris.beams.io/posts/git-commit/
