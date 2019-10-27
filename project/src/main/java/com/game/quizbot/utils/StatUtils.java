package com.game.quizbot.utils;

public class StatUtils {

    private static double sigmoid(int x, int y){
        return 1/(1 + Math.exp((x - y)/2));
    }

    public static double calculateWeight(int correct){
        int responseRange = 5;
        int incorrect = responseRange - correct;

        return round(sigmoid(correct, incorrect));
    }

    private static double round(double a){
        return Math.round(a * 100.0) / 100.0;
    }

    public static int randomWithRange(int min, int max) {
        int range = (max - min);
        return (int)(Math.random() * range) + min;
    }


}
