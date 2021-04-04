*** Settings ***
Documentation                   This test is about adding most expesive items to the basket in e-shop.
Library                         SeleniumLibrary

*** Variables ***

*** Test Cases ***
Open browser and load e-shop page

    open browser                https://www.dos-mundos.cz/  chrome
    wait until page contains    E-shop
    maximize browser window

Go to specific section

    click link                  /kava/
    wait until page contains    E-shop
    click link                  /kurzy/
    wait until page contains    Kurzy a poukazy

Go to the most expensive items

    click element               //*[@id="category-header"]/form/fieldset/label[3]
    sleep                       1s

Put two most expensive items to basket

    click element               //*[@id="products"]/div[1]/div/div/div[2]/div/div[2]/form/button
    wait until page contains    Přidáno do košíku
    click element               //*[@id="cboxClose"]

    click element               //*[@id="products"]/div[2]/div/div/div[2]/div/div[2]/form/button
    wait until page contains    Přidáno do košíku
    click element               //*[@id="cboxClose"]
    sleep                       2s

Show basket

    click element               //*[@id="header"]/div/div[1]/div[2]/a/span[2]

    #Sleep for manual verify of basket
    sleep                       10s


Closing browser

    close browser