# JSP Currency

This task is about converting currencies.

### Currencies

- `getCurrencies` - returns all the currencies in alphabetical order.
- `getExchangeRates` - returns all the currencies in alphabetical order paired to their exchange rate to a currency
  given as param.
- `convert` - takes source and target currencies and amount of money in source currency. Returns equivalent amount in
  target currency.
- `addCurrency` - adds a currency entry: name and universal weight. This method is for initializing.


`Currencies` class is used via its child class `CurrenciesOfCurrentTestCase` that initializes itself in constructor by
adding all the currencies from current test case file.

### JSP pages
- [`currencies.jsp`](src/main/webapp/currencies.jsp) - renders a list of currencies in alphabetical order.
- [`exchangeRates.jsp`](src/main/webapp/exchangeRates.jsp) - renders a list of all the currencies in alphabetical order paired to their exchange rate to a
  currency given as a param (named "from"). Note, that a currency given as a param must be excluded from the list: it is
  the intention.
- [`convert.jsp`](src/main/webapp/convert.jsp) - renders a phrase representing conversion from given amount of money (param "amount") in source
  currency (param "from") to target currency (param "to").
  
Each JSP page must contain a header and one or several phrases.


#### HTML formatting notes
- Elements
  - Use `H1` elements for headers.
  - Use `p` element for enclosing a phrase in `convert.jsp`.
  - Use unordered lists in `currencies.jsp` and `exchangeRates.jsp`.
- Headers
  - `currencies.jsp` header text: "Currencies".
  - `exchangeRates.jsp` header text: "Exchange Rates for *source_currency*". Replace italic-styled part with an actual value.
  - `convert.jsp` header text: "Converting *source_currency* to *target_currency*". Replace italic-styled parts with actual values.
- Phrases
  - `currencies.jsp` item phrase is just name of a currency.
  - `exchangeRate.jsp` item phrase: "1 *source_currency* = *exchange_rate* *target_currency*". Replace italic-styled parts with actual values.
  - `convert.jsp` phrase: "*source amount* *source currency* = *target amount* *target currency*". Replace italic-styled parts with actual values.

#### JSP notes
- There is a `currencies` bean injected in each jsp page already. 
- `currencies` bean is request scoped. 
- JSTL tag library is injected as well.
- JSTL tags and JSP expression language instead of plain scriptlets.

#### Recommended Page style
```css
body {
    font-family: "Courier New", serif;
    font-size: 16pt;
}
```

#### Launcher
There is a [Launcher](src/main/java/com/epam/rd/jsp/currencies/Launcher.java) class.
It starts an embedded Apache Tomcat instance on `8080` port.
Current web app would be automatically deployed there.

