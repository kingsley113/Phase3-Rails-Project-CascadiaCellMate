# Fallout Cell Mate - Phase 3 Rails Project README

## Description
Fallout Cell Mate is an app to track the progress of level design 'cells' during the development of the game map. (The game world is broken up into a grid and each grid is known as cell) Each cell has a page of info including general status information, progress, % complete, assigned user, etc. There is a task todo list for the cell that can be checked off or add new tasks. Game quests can also be linked to cell locations to help focus on which areas need to be prioritized to implement the quest. Finally there is a comment section where team members can add comments or notes for the cell.

The main feature of the app is the cell world map. This shows each cell at its location in the world, there are three color modes to select from, 'cell color' - this colors each cell box with whichever color is assigned to the cell. 'user color' - this colors each cell box according to its assigned user's color, making it easy to see who is working on what. Finally 'cell progress' - this colors each cell based on its % complete attribute, 0% as red and 100% as green, this provides a quick at a glance look at the overall map progress and what areas need focus.

Finally the index page shows a dashboard of several items. A pie chart shows the overall progress of all the cells, by %complete and how many are at each stage of completion. Several shortcut buttons to various parts of the app. As well as a recent cells list which shows the last several cells visited by the user, handy if you are working on a handful of cells repeatedly.

This app is based on the Ruby on Rails framework, incorporates Activerecord and sqlite3 for database management, as well as OnmiAuth authentication with Discord (as all of the team using this app is currently on Discord)

## Install Instruction
To install this app, simply follow these few steps:

Fork and download the repository
Open the package in your favorite IDE
Run the command: '$ bundle install' to install all required gems
(optional) Use the '$ rake db:reseed' command to reset the database and load some sample data
Start a local server using the thin server gem: "thin start --ssl"  
From your brower, navigate to the local address shown in the prompt.
For the first use, create a user account manually and log in or, user the discord Omniauth link to create an account to begin using the app.

## User Instructions
Creating a user account:
1. To access any part of the app, user must enter an access code provided by the team. This is to prevent unauthorized users from creating an account and accessing confidential information.
2. At the login screen, select either 'Create Account' or 'Login with Discord' and follow the prompts from either one.
3. After successful login, you will be at your user preferences page. Feel free to edit your details and select a color to change the theme of the website and the color of your cells on the map.

Home Page:
1. Select a tile to be taked to various pages of the app.
2. Select a cell from the 'recent cells' list to be taken directly to that cells details page
3. Hover over the various colors of the cell pie chart to see additional information

Cell Map:
1. The cell map has several different color modes to select from, the default is 'Cell Color' - this colors each cell with the color assigned to that cell. 'User Color' colors each cell box according to its assigned user's color. 'Cell Progress' - this colors each cell based on its % complete attribute, 0% as red and 100% as green.
2. Hover over a cell to see its title, and then select to be take to that cells detail page.

Cell Detail Page:
1. This page shows all of the available info relating to that specific cell
2. To add a task, simply typ in the form field and select 'Add Task' and it will be added to the list
3. To complete a task, simply select the checkbox to the left of the task (selecting a completed task again will mark it as incomplete again)
4. To leave a comment at the bottom, simply type in the comment field and select 'Submit'
5. You may edit your own comments but cannot edit other users comments.

Cell List Page:
1. This page is a list of all cells currently tracked in the database. 
2. Select a cell's title to view its details page
3. The search bar at the top is used for searching cell names to filter the list.
4. Select 'Create New Cell' at the top to start tracking a new cell entry

My Cells Page:
1. This page is identical to teh Cell List except that it will only show cells that are currently assigned to you

Create New Cell:
1. Fill in all of the required fields (with a *) to save the record.
2. The coordinates are to be those found within the Creation Kit game engine for that cell.
3. Select a user to assign, a region, a % complete, and a color to take full advantage of the app.

Regions:
1. This page shows all the regions in the database and how many cells fall under each one.
2. Select a region to view a list of all cells for that region, or create a new region to track

Quests:
1. This page shows all currently tracked quests
2. Select a quest to view its details or select 'Create New Quest'
3. Fill in the title at a minimum to save the record
4. Add cells to the quest as required from the list at the bottom, this can be used to track which locations the quest will take the player through.

## License
MIT open source license, Copyright 2021 Cameron Kingsley

## Contributing
If you notice a problem with the program that you believe needs improvement but you're unable to make the change yourself, you should raise a Github issue containing a clear description of the problem.

If you see an opportunity for improvement and can make the change yourself go ahead and use a typical git workflow to make it happen:

Fork this program's repository
Make the change on your fork, with descriptive commits in the standard format
Open a Pull Request against this repo
The changes will be reviewed and approved or commented in due course.
