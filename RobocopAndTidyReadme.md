# Robocop

- Robocop is a tool that performs static code analysis of Robot Framework code.
- It uses official Robot Framework parsing API to parse files and run number of checks, looking for potential errors or violations to code quality standards.
- Hosted on Github
- Requirements Python 3.6+ and Robot Framework 3.2.2+
- Can be configured to your needs
- https://robocop.readthedocs.io/en/stable/index.html#

Original RoboCop - a fictional cybernetic police officer - was following 3 prime directives which also drive the progress of Robocop linter:

## First Directive: Serve the public trust

Which lies behind the creation of the project - to serve developers and testers as a tool to build applications they can trust

## Second Directive: Protect the innocent

The innocent testers and developers have no intention to produce ugly code but sometimes, you know, it just happens, so Robocop is there to protect them

## Third Directive: Uphold the law

Following the coding guidelines established in the project are something very important to keep the code clean, readable and understandable by others and Robocop can help to uphold the law

### To run Robocop on this repo

robocop -A robocop.cfg

Configurations are in robocop.cfg file.

# Tidy

- Robotidy is a tool for autoformatting Robot Framework code.
- It is spiritual descendant of Robot Framework’s internal robot.tidy package.
- Can be configured to your needs
- Can be run automatically or manually
- https://robotidy.readthedocs.io/en/stable/index.html

### To run Tidy

robotidy .

Runs Tidy on all files in this repo.
