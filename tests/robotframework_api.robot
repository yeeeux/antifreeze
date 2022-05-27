*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}  https://robotframework.org/
${browser}  firefox
${RobotframeworkTitle}   Robot Framework
${SharedMessage}   Link copied to clipboard!
*** Test Cases ***

Check RobotFramework Title
    [Documentation]  Check site title.
    [Tags]  TITLE
    [Timeout]  1 minutes
    [Setup]  Open Roboframework
    Check Title
    sleep  2

    [Teardown]  Close Browser

Check navigation bar buttons
    [Documentation]  Check all buttons in navigation bar.
    [Tags]  NAVIGATION_BAR
    [Timeout]  1 minutes
    [Setup]  Open Roboframework
    click button   go-to-Getting started
    sleep  2
    click button   go-to-Resources
    sleep  2
    click button   go-to-Community
    sleep  2
    click button   go-to-Development
    sleep  2
    click button   Docs
    sleep  2
    click button   External sites
    sleep  2
    [Teardown]  Close Browser

Check Getting started tabs
    [Documentation]  Check all tabs in getting started view.
    [Tags]  GETTING_STARTED
    [Timeout]  1 minutes
    [Setup]  Open Roboframework
    click button   go-to-Getting started
    sleep  2
    click button   Editor
    sleep  2
    click button   Install
    sleep  2
    click button   Learn
    sleep  2
    [Teardown]  Close Browser


Check Resources tabs
    [Documentation]  Check all tabs in Resources view.
    [Tags]  RESOURCES
    [Timeout]  1 minutes
    [Setup]  Open Roboframework
    click button   go-to-Resources
    sleep  2
    click button   Libraries
    sleep  2
    click button   Built-in
    sleep  2
    click button   Tools
    sleep  2
    [Teardown]  Close Browser


Check editor
    [Documentation]  Check code editor buttons.
    [Tags]  EDITOR GETTING_STARTED
    [Timeout]  1 minutes
    [Setup]  Open Roboframework
    click button   go-to-Getting started
    sleep  2
    click button   Editor
    sleep  2
    click button   Simple Example
    sleep  2
    click button   Share
    sleep  2
    Check Shared Message
    click button   5.0.1
    sleep  2
    click button   5.0.1
    sleep  2
    click button   TestSuite.robot
    sleep  2
    click button   keywords.resource
    sleep  2
    click button   CustomLibrary.py
    sleep  2
    click button   Run
    sleep  2
    [Teardown]  Close Browser


*** Keywords ***
Open Roboframework
    Open Browser  ${url}  ${browser}
    maximize browser window

sleep
    [Arguments]  ${time}
    BuiltIn.Sleep  ${time}

Check Title
    title should be   ${RobotframeworkTitle}

Check Shared Message
    Element Text Should Be  class=copy-message      ${SharedMessage}
