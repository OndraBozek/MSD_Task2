*** Settings ***
Documentation                   This test is about adding most expesive items to the basket in e-shop.
Resource                        ../Resources/TestSteps.robot

*** Test Cases ***
Add two most expensive items to the basket at my favorite e-shop

    Start TestCase
    Specific Section
    Most Expensive
    Put To Basket
    Show Basket
    Finish TestCase
