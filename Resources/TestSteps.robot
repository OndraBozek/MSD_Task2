*** Settings ***
Library                                 SeleniumLibrary

*** Variables ***

${BROWSER}                              chrome
${ESHOP_LABEL}                          E-shop
${ESHOP_LINK}                           /kava/
${CATEGORY_LINK}                        /kurzy/
${CATEGORY_LABEL}                       Kurzy a poukazy
${ORDER_ELEMENT}                        //*[@id="category-header"]/form/fieldset/label[3]
${ITEM1_ELEMENT}                        //*[@id="products"]/div[1]/div/div/div[2]/div/div[2]/form/button
${ITEM2_ELEMENT}                        //*[@id="products"]/div[2]/div/div/div[2]/div/div[2]/form/button
${ADDBASKET_LABEL}                      Přidáno do košíku
${POPUPCLOSE_ELEMENT}                   //*[@id="cboxClose"]
${BASKETBTN_ELEMENT}                    //*[@id="header"]/div/div[1]/div[2]/a/span[2]

*** Keywords ***

Start TestCase
    open browser                        https://www.dos-mundos.cz/  ${BROWSER}
    wait until page contains            ${ESHOP_LABEL}
    maximize browser window

Specific Section
    click link                          ${ESHOP_LINK}
    wait until page contains            ${ESHOP_LABEL}
    click link                          ${CATEGORY_LINK}
    wait until page contains            ${CATEGORY_LABEL}

Most Expensive
    click element                       ${ORDER_ELEMENT}
    wait until element is visible       ${ITEM1_ELEMENT}

Put To Basket
    click element                       ${ITEM1_ELEMENT}
    wait until page contains            ${ADDBASKET_LABEL}
    click element                       ${POPUPCLOSE_ELEMENT}
    click element                       ${ITEM2_ELEMENT}
    wait until page contains            ${ADDBASKET_LABEL}
    click element                       ${POPUPCLOSE_ELEMENT}

Show Basket
    #Sleep cause of green popup, which is closed after 4 seconds
    sleep                               4s
    click element                       ${BASKETBTN_ELEMENT}
    #Sleep for manual verify of basket
    sleep                               10s

Finish TestCase
    close browser