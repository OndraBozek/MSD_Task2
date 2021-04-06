*** Settings ***
Library                                 SeleniumLibrary

*** Variables ***

${browser}=                             chrome

*** Keywords ***

Start TestCase
    open browser                        https://www.dos-mundos.cz/  ${browser}
    wait until page contains            E-shop
    maximize browser window

Specific Section
    click link                          /kava/
    wait until page contains            E-shop
    click link                          /kurzy/
    wait until page contains            Kurzy a poukazy

Most Expensive
    click element                       //*[@id="category-header"]/form/fieldset/label[3]
    wait until element is visible       //*[@id="products"]/div[1]/div/div/div[2]/div/div[2]/form/button

Put To Basket
    click element                       //*[@id="products"]/div[1]/div/div/div[2]/div/div[2]/form/button
    wait until page contains            Přidáno do košíku
    click element                       //*[@id="cboxClose"]
    click element                       //*[@id="products"]/div[2]/div/div/div[2]/div/div[2]/form/button
    wait until page contains            Přidáno do košíku
    click element                       //*[@id="cboxClose"]

Show Basket
    #Sleep cause of green popup, which is closed after 4 seconds
    sleep                               4s
    click element                       //*[@id="header"]/div/div[1]/div[2]/a/span[2]
    #Sleep for manual verify of basket
    sleep                               10s

Finish TestCase
    close browser