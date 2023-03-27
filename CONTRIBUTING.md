# Contribution Guidelines and Workflows

## Git Workflow

1. Pick your issue
2. Checkout a new branch
3. Complete at most 1 step in the Capella Workflow below
    - Committing smaller changes is fine
    - Please don't sit on uncommitted bigger changes
4. Commit and push
5. Create a new issue
6. Start over :)

### Pick Your Issue

Go to the **[Issues](https://github.com/guorbit/obc-model/issues)** tab on GitHub, select the unassigned issue that you'd like to work on the most, and assign it to yourself.

You can also move the issue to the **To-Do** or **In Progress** column in the **[Project](https://github.com/orgs/guorbit/projects/2)**, and tick the checkboxes within the issue as you get work done.

### Checkout a new Branch

#### Local Checkout

This option creates a local branch first, then uploads it to the remote repository whenever its first new commit is pushed.

To do so, ensure you're up to date with the `main` branch by executing:

- `git checkout main`
- `git pull`

You can then create a new branch extending out from the main trunk at its latest revision by executing `git checkout -b {branch-name}`.
Check the Branch Naming Convention section below for its argument `{branch-name}`.

#### Remote Checkout

This option creates a remote branch first, then downloads it to the local repository ahead of committing to it.

To do so:

- Go under the **Code** tab on GitHub
- Press the branch icon button
- Select **View all branches**
- Press the **New branch** button
- Select `main` as the source
- Check the Branch Naming Convention section below for the branch name

Then, retrieve and move to the newly created branch by executing:

- `git fetch --all`
- `git checkout {branch-name}`

#### Branch Naming Convention

It's good practice to assign meaningful names to branches but, more importantly, branch protection rules are in place to prevent unintended changes.    
Please refer to the following format, substituting the curly braces `{}` with the appropriate contents and taking care of separating them with dashes `-`:

```git
model/{your-name}-{scenario-name(s)}
```

### Commit and Push

`git add obc-model.aird obc-model.capella`

Execute `git commit` and enter your commit message.

Due to the limited graphical capabilities of EMF Diff/Merge in Capella, it's particularly important that commit messages include a detailed description of the changes being pushed to the repository.    
Please refer to the following format, substituting the curly braces `{}` with the appropriate contents:

```git
[FEATURE] {SCENARIO NAME} @ {LEVEL}

{summary}

Add:
- [{DIAG_ID1}] {title of new diagram 1}
- [{DIAG_ID2}] {title of new diagram 2}
- ...

Change:
- [{DIAG_ID3}] {title of changed diagram 3} {detail of changes}
- [{DIAG_ID4}] {title of changed diagram 4} {detail of changes}
- ...

resolve #{ISSUE_ID1}
resolve #{ISSUE_ID2}
...
```

After this, execute `git push` to upload your changes to the shared repository on GitHub.

### Create a New Issue

Under the original issue, press the **Convert to issue** button to the right of the final checkbox to make it into a new issue.

## Capella Workflow

1. System Analysis
2. Logical Architecture
3. Physical Architecture

### System Analysis

At this stage, the system and system actors are completely opaque and can only be analysed as black-boxes; what is defined are the boundaries between them.    
For this reason, the focus at this stage is on functions which are either part of an exchange that crosses the boundaries of the system, or a generalised placeholder for more detailed functions at the Logical level.

### Logical Architecture

At this stage, the system is partially transparent, allowing the definition of boundaries between the subsystems inside it.    
Again, the focus at this stage is on functions which are either part of an exchange that crosses the boundaries of a subsystem, or a generalised placeholder for more detailed functions at the Physical level.

### Physical Architecture

At this stage, the system is completely transparent, allowing the identification of its constituting components.
Components at this level come in two kinds: *behaviours* are the subroutines realising the subsystems at the Logical level, and *nodes* are the devices running the subroutines.
Functions are allocated to behaviours, and behaviours are allocated to nodes.    
Unlike the previous stages, the focus at this stage is on elaborating functions to the maximum detail, grouping them in nested subroutines if necessary.
