package dream.development.model.objects;

import java.util.Date;

public class Currency {

    private Date date;
    private int code;
    private String chars;
    private int size;
    private String name;
    private float rate;
    private float change;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getChars() {
        return chars;
    }

    public void setChars(String chars) {
        this.chars = chars;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public float getChange() {
        return change;
    }

    public void setChange(float change) {
        this.change = change;
    }

    @Override
    public String toString() {
        return "Currency{" +
                "date=" + date +
                ", code=" + code +
                ", chars='" + chars + '\'' +
                ", size=" + size +
                ", name='" + name + '\'' +
                ", rate=" + rate +
                ", change=" + change +
                '}';
    }
}
