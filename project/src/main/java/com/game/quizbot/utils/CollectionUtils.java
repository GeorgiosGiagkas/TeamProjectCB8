package com.game.quizbot.utils;

import java.util.ArrayList;
import java.util.Collection;

public class CollectionUtils {

    public static <T> Collection<T>
    getCollectionFromIteralbe(Iterable<T> itr)
    {
        // Create an empty Collection to hold the result
        Collection<T> cltn = new ArrayList<T>();

        // Iterate through the iterable to
        // add each element into the collection
        for (T t : itr)
            cltn.add(t);

        // Return the converted collection
        return cltn;
    }
}
