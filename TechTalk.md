# Introduction to Robot Framework and test automation

## Agenda

What is Robot Framework
Test driven development
Gherkin syntax

# Part 1. What is Robot Framework?

Open Source, free test automation framework
Keyword-based
Created in Python
Natively extendable through libraries
Can be used for test automation and robotic process automation

# Robot Framework features

### Tabular format for test cases

Robot framework comes with a simple tabular format where the test cases are written using keywords. It is easy for a new developer to understand and write test cases.

### Keywords

Robot framework comes with built-in keywords, keywords available from the libraries like Selenium Library and Custom Keywords can be used too.

### Variables

Robot framework supports variables – scalar, list and dict. Variables in robot framework are easy to use and are of great help while writing complex test cases.

### Test Case Tagging

Robot framework allows to tag test-cases so that we can either run the tagged test-cases or skip them. Tagging helps when we want, for example run only a group of test cases.

### Reports and Logs

Robot framework provides all the details of test suite, test case execution in the form of report and logs. All the execution details of the test case are available in the log file. The details like whether the test case has failed or passed, time taken for execution, steps followed to run the test case are provided.

### Libraries

Robot framework has support for a lot of external libraries
Custom libraries can be created using Python

# Different ways of using Robot Framework

Behaviour driven (Gherkin), data driven, keyword driven…

# Variables and Tagging

Variables - Easy to create ${var}= value
Override for runtime –- variable BROWSER:chrome

Tagging
Metadata to categorize test cases
Statistics by tags collected automatically
Select test cases to be executed by tagname
Specify which test cases are considered critical

Logs and reports generated automatically

Example of test file structure

**_ Settings _**
Test Setup Setup
Resource ../resources/login_resource.robot

**_ Variables _**
${SUB}    ${ENV}/${LOCATIONSUB}#/
${USER}    ${DEFAULTUSER}
${PASSWORD} examplepassword

**_ Test Cases _**
Login to ${ENV}
[Tags] smoketest login
Login With Subscription ${USER} ${PASSWORD} ${SUB}

**_ Keywords _**
Login With Subscription
[Arguments] ${email} ${password}
Input Text class:email-field ${email}
Input Text class:password-field ${password}

# Part 3. Test driven development

Write the functional tests at the same time as the production code in each sprint - Redefine the definition of DONE (Every new feature should have at least one automated test case that is reliable)

When fixing a UI related defect, write acceptance test to reproduce the issue, then make the test pass - ATDD (bug can be found again automatically)

Stop doing this

Selector with complex xpath (This will break at some point)

//div[@class="tree"]/div[4]//div[contains(text(),'something')]/../../div[2]/div

Start doing this

When developers have local setup running, tag elements with custom attributes like “data-ta” or id=”test-button” or something like that, so it can be targeted with xpath easily

//\*[@data-ta="login-input-email"]

data-ta (ta = test automation) works pretty well in my opinion.

Every new feature should include at least one test case that is going to pass initially. Later if the test case breaks, it can be inspected if it is a bug or just a random hiccup.

This way test-case coverage slowly grows, code can be delivered with more confidence and developer happiness grows when they have the confidence.

less bugs
Testing coverage grows from time to time
faster debugging

# Part 4. Gherkin syntax

Gherkin uses a set of special keywords to give structure and meaning to executable specifications.

Given, When, Then

The use of Given keyword is to put the system in a familiar state before the user starts interacting with the system.
When the step is to define action performed by the user.
The use of Then keyword is to see the outcome after the action in when step. However, you can only verify noticeable changes.
Can be extended with keyword And
