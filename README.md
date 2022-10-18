# Robot Framework Workshop created by Niki Ahlskog

Most of this readme is copied from Google sheets so the instructions might have little problems here and there as the original slides include pictures. Any kind of feedback is much appreciated.

# What is required

Robot Framework is written with Python, so Python is required. Windows natively doesn’t have Python so it needs to be installed.
Recommended way to use Python is with Python Version Management tool. With version manager it is possible to switch between Python versions easily. We are going to use Pyenv for windows.
Browser driver. Selenium library needs driver to control browser. Chrome has chromium driver and Firefox geckodriver
Driver needs to be in system path in order for Selenium to use it
SeleniumLibrary is a web testing library for Robot Framework. SeleniumLibrary uses the Selenium WebDriver modules internally to control a web browser.

# Part 2. Install tools

These instructions are for Windows with Powershell and may require admin rights.

1. Install latest Python from https://www.python.org/downloads/
2. Install pyenv with pip (pip comes with basic python install) https://github.com/pyenv-win/pyenv-win
3. Install Python version >=3.10.6
4. Install Chrome and optional Firefox driver from
   https://chromedriver.chromium.org/downloads
   https://github.com/mozilla/geckodriver/releases
5. Add driver to system path and verify it is working with chromedriver -v

pyenv install -l (lists versions available to install, install latest)
pyenv install 3.11.0b5
pyenv local 3.11.0b5 (use local version, or global pyenv global)
pyenv version (show what version is used)

Verify setup is working:
python —version
chromedriver —version
pip —version
pyenv —version

These should return a version if it is working and installed

# Part 3. Configure project

1. Start by creating new folder for your tests: for example tests, robottests, autotests, robot etc. And open it with your preferred editor.
2. Create new file “requirements.txt” in this file we will specify project dependencies
3. Next install packages from PyPi (Python package registry)
   pip install robotframework
   pip install robotframework-seleniumlibrary
   pip freeze > requirements.txt (this will add all packages in the environment)
4. Test that robot is installed by running robot --version (should return version)

# Libraries

We are going to use two libraries previously installed. Firstly Robot Framework builtIn library, keywords available at https://robotframework.org/robotframework/latest/libraries/BuiltIn.html

And mostly SeleniumLibrary keywords available at https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

It is useful to keep at least SeleniumLibrary docs open while developing test cases

# Using Robot Framework selectors from SeleniumLibrary

Robot Framework uses web selectors from SeleniumLibrary to select and use web elements. https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

Strategy Match based on Example
id Element id. id:example
name name attribute. name:example
identifier Either id or name. identifier:example
class Element class. class:example
tag Tag name. tag:div
xpath XPath expression. xpath://div[@id="example"]
css CSS selector. css:div#example
dom DOM expression. dom:document.images[5]
link Exact text a link has. link:The example
partial link Partial link text. partial link:he ex
sizzle Sizzle selector deprecated. sizzle:div.example
data Element data-\* attribute data:id:my_id
jquery jQuery expression. jquery:div.example
default Keyword specific default behavior. default:example

# Project start

Create new file “resource.robot” and paste in code from template.robot or use it as base file

# Running tests

Add .gitignore and add “results”
Try running the test from command line “robot -d results .” Command “robot” initiates Robot Framework, “-d” gives directory name for test results and dot . at the end means all tests available from where the command is run recursively.
Now test should execute, it will open Verkkokauppa.com, verify the page is open and close browser. Test results are generated.

# **pycache**

This damn folder is created every time we run Python code. When you run a program in Python, the interpreter compiles it to bytecode first (this is an oversimplification) and stores it in the **pycache** folder. If you look in there you will find a bunch of files sharing the names of the .py files in your project's folder, only their extensions will be either .pyc or .pyo. These are bytecode-compiled and optimized bytecode-compiled versions of your program's files, respectively.
As a programmer, you can largely just ignore it... All it does is make your program start a little faster. When your scripts change, they will be recompiled, and if you delete the files or the whole folder and run your program again, they will reappear (unless you specifically suppress that behavior).

Remove all **pycache** folders from project. Now let’s use Vscode to ignore the files.
Create .vscode folder
add settings.json file
Copy paste settings:

{
"files.exclude": {
"\*\*/**pycache**": true
}
}

Next time you run Robot **pycache** folders should not be generated. If you are using different editor than vscode, you have to find a way to ignore these files or just leave them in place and trust the gitignore file setup earlier.

# Part 4. Exercises - Exercise 1.

Now that we have a working setup and all the basics explained create a new test or expand the first test case and do the following:

1. Open verkkokauppa.com
2. Input “776425” (iphone product code) in the search box and click search button
3. Wait until page contains Iphone in the list
4. Open Iphone from the list and verify price is 1 248,99e

Use keyword-driven syntax (quickest way to develop tests)

## Hints

using Set Selenium Speed 0.5 test case execution can be slowed down:
https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Set%20Selenium%20Speed
With Log To Console It is possible to log something to console from builtIn library https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Log%20To%20Console
To run test in new file use command robot -d results ./exercise_1.robot
To run test by name use command robot -d results -t "Find Iphone price" .

# Exercise 2.

Enhance the current Robot test to use Gherkin syntax.
Use Given, When, Then in the test case area
Move all keywords under keywords section
Create Given, when, Then counterparts in the keyword section
If necessary use And to continue test steps

Hints: Try to think what are the required steps for executing the keywords in three sentences. What is the starting point, what needs to happen and what is the outcome?

# Exercise 3 - Shellscripting

Okay we are getting the idea of Robot Framerwork. Now lets enhance the project a little bit. Robot commands can become quite long and tedious to remember. Better way to use robot is by using shellscripts.
Create new shellscript in the project root folder called “run_single_test.sh”
Add robot command inside script robot --test "$1" -d results .
By using shellscripts we can easily run tests without remembering any of the parameters. Run your test with following command ./run_single_test.sh "your test name here"
Lets extend our script to do other things as well. Add the following in the beginning of file to remove test results before running tests
rm -rf results
Next we will extend the script file to allow us run tests by file. It can be set to run tests with tags or other logic as well. Create new scripts that have simple names like “run_by_tagname”. But for now lets just keep everything in the existing script file. Add simple else if statement:

if [[$1 == ./*]];
then
robot -d results $1
else
robot --test "$1" -d results .
fi

Now execute file with test name ./run_single_test.sh "Open Browser To Page"
or with file ./run_single_test.sh ./resource.robot

# Exercise 4. - Operating system

Next we will try different library called Operating system that is built into Robot Framework.

1. Open library keyword docs https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html
2. Create new testfile and name it for example operatingsystem.robot or exercise4.robot
3. Import operating system library
4. Create test - the test should do the following
   a) Create new file example.txt That has Hello, world! inside
   b) Check that the file exists
   c) Create copy of that file in the same location, name it as copy.txt

# Exercise 5. - Custom library

Robot Framework can be easily extended with custom libraries that are written with Python.

1. Create new file Customlib.py
2. Add two functions plus and minus
3. Both Functions take two parameters and return plus or minus operation result
4. Add print before returning the sum
5. Robot Framework always uses strings so typecast values to be int type
6. Create new test for example “Execute some mathematical operations”
7. Add two keywords - Sum two numbers and Subtract two numbers
8. Add keyword parameters, for example 2 and 4
9. Import custom library Library ./Customlib.py
10. Run test and inspect the log files that should have the result inside INFO

# Exercise 6. - Variables

Robot Framework can use variables. Variables should be lowercase when passed as test parameters or local variables. If variable is written in uppercase it should be a global variable. Copy exercise 5 and let’s modify it.
Add first number as global variable and second as local variable
Add **_ Variables _** section after settings and add local variable values there
Run test and pass global variable for the robot command with –variable handle: robot -d results --variable GLOBAL_NUM1:2 --variable GLOBAL_NUM2:4 ./solutions/exercise_6.robot variable is set with NAME:value

Hints: Variables are set like ${variable} = stringvalue (notice robot syntax minimum 2 spaces after = mark)

# Exercise 7. - Variables continue

Create new file named as variablefile.py
add following variable BROWSER = "headlesschrome"
Pass the variablefile to the exercise 2 with command
robot -d results --variablefile ./variablefile.py ./exercise_2.robot

Notice how BROWSER variable is overridden from local test case variable. Also now we use native headless mode available in both Chrome and Firefox browsers.

# That’s it!

Next steps to learn:

1. Different libraries - for example requestslibrary
2. SeleniumLibrary keywords
3. How to run tests with Docker
4. Adding Robot to CI
5. Combining Robot Keywords
6. Test structure

Workshop repo with solutions available at: https://github.com/shnigi/robotworkshop
