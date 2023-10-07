
# Git Branch Renaming Script

This Bash script allows you to easily rename both local and remote branches in a Git repository.

## Prerequisites

- Git must be installed on your system.

## Usage

1. Clone this repository to your local machine and navigate to the directory.

    ```bash
    git clone https://github.com/aaronpo97/git-rename
    cd git-rename
    ```

2. Run the following command to make the script executable:

   ```bash
   chmod +x rename-branch.sh
   ```

3. Go to the directory containing the Git repository you want to rename a branch in.

   ```bash
   cd /path/to/repository
   ```

4. Run the script.

   ```bash
    location/of/git-rename/rename-branch.sh
    ```

5. Follow the prompts to rename a Git branch.

## Example

```bash
$ ./rename-branch.sh
Would you like to rename a branch? (y/n) y
Enter the old branch name: feature/old-feature
Enter the new branch name: feature/new-feature
Branch 'feature/old-feature' has been successfully renamed to 'feature/new-feature'.
```

## License

This script is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.

## Author

Aaron Po - [https://aaronwilliampo.com](https://aaronwilliampo.com)
