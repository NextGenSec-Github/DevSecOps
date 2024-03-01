#!/bin/bash

# GitHub Commands Reference

# Clone a repository
git clone <repository_URL>

# Initialize a new Git repository
git init

# Set user name
git config --global user.name 'Your Name'

# Set email address
git config --global user.email 'your.email@example.com'

# View Git configuration
git config --list

# Check repository status
git status

# Add changes to the staging area
git add <file>

# Commit changes to the repository
git commit -m 'Commit message'

# Push changes to remote repository
git push

# Create a new branch
git branch <branch_name>

# Switch to a branch
git checkout <branch_name>

# Merge branches
git merge <branch_name>

# Fetch changes from remote repository
git fetch

# Pull changes from remote repository
git pull

# Create a pull request
# - Push changes to a branch
# - Go to GitHub and create a pull request

# Discard changes in working directory
git checkout -- <file>

# Unstage changes
git reset HEAD <file>

# Undo last commit
git reset HEAD^

# View commit history
git log

# View changes made in a specific commit
git show <commit_hash>

# Add remote repository
git remote add <remote_name> <repository_URL>

# View remote repositories
git remote -v

# Remove remote repository
git remote rm <remote_name>

# Conclusion
echo "For more information, refer to the official GitHub documentation: https://docs.github.com/en/get-started"

exit 0
