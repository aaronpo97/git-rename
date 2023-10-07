#!/bin/bash

# Check if git is installed
if ! [ -x "$(command -v git)" ]; then
    echo "Error: git is not installed." >&2
    exit 1
fi

# Check if the user wants to continue, convert answer to lowercase.
read -p "Would you like to rename a branch? (y/n) " -n 1 -r answer
if [[ $(echo "$answer" | tr '[:upper:]' '[:lower:]') != "y" ]]; then
    echo "Exiting..."
    exit 0
fi

# Get the old and new branch names
read -p "Enter the old branch name: " -r old_name
read -p "Enter the new branch name: " -r new_name

# Check if a branch with the old and new names already exist.
if ! git show-ref --quiet refs/heads/"$old_name"; then
    echo "Error: branch '$old_name' does not exist." >&2
    exit 1
fi

if git show-ref --quiet refs/heads/"$new_name"; then
    echo "Error: branch '$new_name' already exists." >&2
    exit 1
fi

# Check if the old branch exists on remote, if not, rename local branch only then exit.
if ! git show-ref --quiet refs/remotes/origin/"$old_name"; then
    echo "Does not exist on remote, renaming local branch only."

    # Rename the local branch to the new name
    git branch -m "$old_name" "$new_name"
    exit 0
fi

# Rename the local branch to the new name
git branch -m "$old_name" "$new_name"

# Delete the old branch on remote - where <remote> is, for example, origin
git push origin --delete "$old_name"

# Prevent git from using the old name when pushing in the next step.
# Otherwise, git will use the old upstream name instead of <new_name>.
git branch --unset-upstream "$new_name"

# Push the new branch to remote
git push origin "$new_name"

# Reset the upstream branch for the new_name local branch
git push origin -u "$new_name"
