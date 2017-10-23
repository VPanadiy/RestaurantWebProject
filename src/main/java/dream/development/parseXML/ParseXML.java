package dream.development.parseXML;

import dream.development.model.objects.Currency;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ParseXML extends DefaultHandler {

    private boolean bDate = false;
    private boolean bCode = false;
    private boolean bChar = false;
    private boolean bSize = false;
    private boolean bName = false;
    private boolean bRate = false;
    private boolean bChange = false;
    private Currency currency = new Currency();
    private List<Currency> currencyList = new ArrayList<>();

    @Override
    public void startElement(
            String uri, String localName, String qName, Attributes attributes)
            throws SAXException {

        if (qName.equalsIgnoreCase("date")) {
            bDate = true;
        } else if (qName.equalsIgnoreCase("code")) {
            bCode = true;
        } else if (qName.equalsIgnoreCase("char3")) {
            bChar = true;
        } else if (qName.equalsIgnoreCase("size")) {
            bSize = true;
        } else if (qName.equalsIgnoreCase("name")) {
            bName = true;
        } else if (qName.equalsIgnoreCase("rate")) {
            bRate = true;
        } else if (qName.equalsIgnoreCase("change")) {
            bChange = true;
        }
    }

    @Override
    public void endElement(String uri,
                           String localName, String qName) throws SAXException {
//        Add end string for console output:
//        if (qName.equalsIgnoreCase("item")) {
//            System.out.println("End Element :" + qName);
//        }
    }

    @Override
    public void characters(char ch[], int start, int length) throws SAXException {

        if (bDate) {
//            For printing in console use next (for example):
//            System.out.println("Date: " + new String(ch, start, length));
            bDate = false;
            String currencyDate = new String(ch, start, length);
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            try {
                currency.setDate(format.parse(currencyDate));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else if (bCode) {
            bCode = false;
            currency.setCode(Integer.parseInt(new String(ch, start, length)));
        } else if (bChar) {
            bChar = false;
            currency.setChars(new String(ch, start, length));
        } else if (bSize) {
            bSize = false;
            currency.setSize(Integer.parseInt(new String(ch, start, length)));
        } else if (bName) {
            bName = false;
            currency.setName(new String(ch, start, length));
        } else if (bRate) {
            bRate = false;
            currency.setRate(Float.parseFloat(new String(ch, start, length)));
        } else if (bChange) {
            bChange = false;
            currency.setChange(Float.parseFloat(new String(ch, start, length)));
            currencyList.add(currency);
            currency = new Currency();
        }
    }

    public List<Currency> getCurrencyList() {
        return currencyList;
    }

    public void setCurrencyList(List<Currency> currencyList) {
        this.currencyList = currencyList;
    }
}
