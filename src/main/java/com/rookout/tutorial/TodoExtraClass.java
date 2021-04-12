package com.rookout.tutorial;

/**
 * Tdo Storage (in memory list that implements Interface TodoRecord Storage).
 */
public class TodoExtraClass {
    private int count;

    private static TodoExtraClass instance = new TodoExtraClass();

    public static TodoExtraClass getInstance() {
        return instance;
    }

    private TodoExtraClass() {
        this.count = 1;
    }

    public int getCount() {
        return this.count;
    }
}
