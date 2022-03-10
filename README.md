# THE-OPPENHEIMER-PROJECT

## Table of Contents

* [Introduction](#introduction)
* [Technologies](#technologies)
* [Prerequisite](#prerequisite)
* [Scope of functionalities](#scope)
* [Examples of how to run](#howtorun)
* [Screenshots](#screenshots)
* [Project Status](#projectstatus)

## Introduction

This Oppenheimer project demonstrates some of the Acceptance Criterias mentioned for the User Stories for **"THE OPPENHEIMER PROJECT"**.

The user stories tested are present in the "NPHC Quality Engineer Assignment v1.3.pdf" file attached to this repository.

## Technologies

Project is created with:
* Python 3.9.10
* Robot Framework 4.1.3
* Visual Studio IDE / PyCharm or can use any IDE of your choice which supports Python with Robot Framework extensions for execution
* Webdrivers - currently tested on Chrome

## Prerequisite

### Run

The instructions to run the app are present here:

[http://tiny.cc/oppenheimerprojectdev](http://tiny.cc/oppenheimerprojectdev)

## Scope of functionalities

Functional and Non-Functional Tests

## Examples of how to run

### Example 1

Execute all user stories at once


```
robot -d results/Oppenheimer_Project_SummaryReport --variable BROWSER:Chrome --name Oppenheimer_Project_SummaryReport tests
```

### Example 2

Execute each user story seperately and you can also use --timestampoutputs to generate reports with timestamp included

```
robot -d results/UserStory1 --variable BROWSER:Chrome --name UserStory1 --timestampoutputs tests/userStory1.robot
robot -d results/UserStory2 --variable BROWSER:Chrome --name UserStory2 --timestampoutputs tests/userStory2.robot
robot -d results/UserStory3 --variable BROWSER:Chrome --name UserStory3 --timestampoutputs tests/userStory3.robot
robot -d results/UserStory4 --variable BROWSER:Chrome --name UserStory4 --timestampoutputs tests/userStory4.robot
robot -d results/UserStory5 --variable BROWSER:Chrome --name UserStory5 --timestampoutputs tests/userStory5.robot
```

## Screenshots
<img width="857" alt="Screenshot 2022-03-10 at 5 26 10 PM" src="https://user-images.githubusercontent.com/99182721/157636566-67a53ba7-57fb-4f8a-bcc5-84c8015c1446.png">
<img width="919" alt="Screenshot 2022-03-10 at 5 25 33 PM" src="https://user-images.githubusercontent.com/99182721/157636581-b8c16ffa-b414-47d4-bc87-cb91cbcd28c5.png">


## Project Status

There are a lot of enhancements that need to be done for this project. This is in progress.
Many negative test cases need to be covered.

