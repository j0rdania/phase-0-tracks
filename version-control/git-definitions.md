# Git Definitions

**Instructions: ** Define each of the following Git concepts.
very small change here!

* What is version control?  Why is it useful?
Version control allows us to keep different versions of our code. It gives us the ability to restore to a previous version, to track changes (what changes were made, when, and by whom), and to allow concurrent development with later merging of new coding efforts.

* What is a branch and why would you use one?
A branch is a pointer to a commit. It allows a developer to add a new feature without fear of contaminating the master copy. There is a snapshot of the code at the time the branch was created, and then whenever that developer makes a commit, there is a new savepoint that developer can go back to, if necessary. Finally, when the change is complete, it can be merged back into the master copy. The feature might also be discarded and never merged back into the master.

* What is a commit? What makes a good commit message?
A commit occurs when a developer has done a unit of work and wants to create a savepoint that could be rolled back to, if necessary. A good commit message will describe what changes were made in this unit of work.

* What is a merge conflict?
A merge conflict can occur if two developers make changes to the same line of a file or if a file is deleted when another developer is trying to access it. Since you can have multiple developers working on a file at the same time, it is possible they might step on each other's toes between the time of the branch and the time of the merge.