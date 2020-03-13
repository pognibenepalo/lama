package th.paloit.dao;

import th.paloit.model.Word;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class LocalWordRepository {

    private static final List<Word> words = new ArrayList<> ();

    public static void save(Word word) {
        words.add(word);
    }

    public static void remove(String id) {
        Word wordToRemove = null;
        for (Word wordIterator : words ) {
            if (wordIterator.getid().equals(id)) {
                wordToRemove = wordIterator;
            }
        }
        if (wordToRemove == null) {
            return;
        }
        words.remove(wordToRemove);
    }

    public static void update(String id, Word word) {
        for (Word wordIterator : words ) {
            if (wordIterator.getid().equals(id)) {
                wordIterator.setWord(word.getWord());
                wordIterator.setDescription(word.getDescription());
                wordIterator.setQuote(word.getQuote());
                wordIterator.setUpdatedAt(Instant.now().toString());
            }
        }
    }

    public static List<Word> get() {
        if (words.isEmpty()) {
            Word word = new Word();
            word.setWord("Cat");
            word.setDescription("a small animal with fur, four legs, a tail, and claws, usually kept as a pet or for catching mice");
            word.setQuote("My cat likes dozing in front of the fire.");
            save(word);
        }
        return words;
    }
}
