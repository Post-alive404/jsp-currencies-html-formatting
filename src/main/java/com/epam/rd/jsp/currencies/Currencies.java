package com.epam.rd.jsp.currencies;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Collection;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

public class Currencies {
    private Map<String, BigDecimal> curs = new TreeMap<>();

    public void addCurrency(String currency, BigDecimal weight) {
        curs.put(currency, weight);
    }

    public Collection<String> getCurrencies() {
        return curs.keySet().stream().sorted().collect(Collectors.toList());
    }

    public Map<String, BigDecimal> getExchangeRates(String referenceCurrency) {
        Map<String, BigDecimal> refCurs = new TreeMap<>();
        BigDecimal refCurrency = curs.get(referenceCurrency);
        curs.forEach((key, value) -> refCurs.put(key, refCurrency.divide(value, 5, RoundingMode.HALF_UP)));
        return refCurs;
    }

    public BigDecimal convert(BigDecimal amount, String sourceCurrency, String targetCurrency) {
        BigDecimal sourceWeight = curs.get(sourceCurrency);
        BigDecimal targetWeight = curs.get(targetCurrency);
        return (sourceWeight.divide(targetWeight, 100, RoundingMode.HALF_UP).multiply(amount))
                .setScale(5, RoundingMode.HALF_UP);
    }
}
