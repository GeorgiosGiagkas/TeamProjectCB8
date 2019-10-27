package com.game.quizbot.services.game;

public interface GameObserver {
    public  void update();
    public GameStateSubject getGameStateSubject();
    public void setGameStateSubject(GameStateSubject gameStateSubject);
}
