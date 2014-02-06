Weigh Anchor: Deploy a Server and App Code Lab
==============
[![Build Status](https://drone.io/github.com/dart-lang/deploy-codelab/status.png)](https://drone.io/github.com/dart-lang/deploy-codelab/latest)

This is a small Dart sample used by the new
[Weigh Anchor: Deploy a Server and App][codelab] code lab.

Repo and testing
----------------

Currently, drone.io tests only whether the .dart files under web/ pass static analysis (dartanalyzer). We could do real unit testing, and we could do better with HTML samples.

Project structure
-----------------

**web/:**
        Code samples used by the client-side application to deploy.

**bin/:**
        Basic static file server.

**README.md:**
        This file.

**runtests.sh:**
  BASH script that runs dartanalyzer on all Dart source files in the web directory.


[codelab]: https://www.dartlang.org/codelabs/deploy/