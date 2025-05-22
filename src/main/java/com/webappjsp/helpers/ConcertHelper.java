package com.webappjsp.helpers;

public class ConcertHelper {

    // Helper function to truncate text by word count
    public static String truncateWords(String text, int limit) {
        if (text == null) return "";
        String[] words = text.split("\\s+");
        if (words.length > limit) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < limit; i++) {
                sb.append(words[i]).append(" ");
            }
            return sb.toString().trim() + "...";
        } else {
            return text;
        }
    }

    // You can add other view-related helper methods here later
} 