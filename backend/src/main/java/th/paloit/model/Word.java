package th.paloit.model;

import java.time.Instant;
import java.util.Date;
import java.util.UUID;

public class Word {
    private static int ID = 0;

    public String id;
    public String word;
    public String quote;
    public String description;
    public String createdAt;
    public String updatedAt;

    public Word() {
        this.id = UUID.randomUUID().toString();;
        this.setCreatedAt(Instant.now().toString());
        this.setUpdatedAt(Instant.now().toString());
    }

    public Word(String word, String quote, String description,  Date createdAt, Date updatedAt) {
        this();
        this.word = word;
        this.quote = quote;
        this.description = description;
    }

    public String getid() {
        return id;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

}
