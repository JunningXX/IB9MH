# This is the example file for README.md 

This is the first exercise for IB9MH. 

Now I add some changes to this file. 

I added this line using me local computer on RStudio

## How to specifically link your RStudio to GitHub:

### Preperations on GitHub side
1. You need to have a GitHub account
2. Create a repository on GitHub 
3. Give your repository a name and a description such as"IB9MH" and "Lecture material for IB9MH"
4.Make it go public
5. Initialize this repository with: Add a README file
6. Click on the green button says "<> Code"
7. Copy a URL to your clipborad
*8. you should also have a personal access token for HTTPS (For details please look https://happygitwithr.com/https-pat)


### Preperations on RStudio
1. In RStudio, start a new Project:
  File > New Project > Version Control > Git. In “Repository URL”, paste the URL of your new GitHub repository. It will be something like this https://github.com/JunningXX/IM9MH.git.
  Accept the default project directory name, e.g. "IB9MH", which coincides with the GitHub repo name.
  ALWAYS make sure you remember where the project will be saved locally!
  I suggest you check “Open in new session”, as that’s what you’ll usually do in real life.
  Click “Create Project”.

Now, you should find yourself in a new local RStudio Project that represents your IB9MH repo on GitHub. This should download the README.md file from GitHub. Look in RStudio’s file browser pane for the README.md file.

2. Make local changes, save, commit

From RStudio, modify the README.md file, e.g., by adding the line “This is a line from RStudio”. Save your changes.

Commit these changes to your local repo. How?

From RStudio:

Click the “Git” tab in the upper right pane.
Check “Staged” box for README.md. (If you do not have this, make sure to save README.md first)
If you’re not already in the Git pop-up, click “Commit”.
Type a message in “Commit message”, such as “Commit from RStudio”.
Click “Commit”.

3. Push your local changes online to GitHub

Click the green “Push” button to send your local changes to GitHub.

You should not experience a credential challenge. In this step, you will be asked to enter your GitHub username and password. You should use the access token as a password. For detail see: https://happygitwithr.com/push-pull-github#push-pull-github 

4. Confirm the local change propagated to the GitHub remote

Go back to the browser. I assume we’re still viewing your new GitHub repo.

Refresh.

You should see the new “This is a line from RStudio” in the README.

If you click on “commits”, you should see one with the message “Commit from RStudio”.

If you have made it this far, you are DONE with setup. Congratulations!

# Some commonly used GitHub instructions

cd name of your repo -> select specific working directory on GitHub

ls -> list all files with the repo

git add . -> save everything 

git clone -> copy repo from GitHub to your local computer manually

git commit -> update changes with a comment

git pull/push -> update from website to local/update from local to website

For more commands please view: https://www.atlassian.com/git/glossary#commands

# One last thing
Let now write something and try to pull it from RStudio.


I added a line here on my laptop.


