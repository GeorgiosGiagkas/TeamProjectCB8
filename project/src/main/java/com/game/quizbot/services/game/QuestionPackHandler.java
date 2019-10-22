package com.game.quizbot.services.game;

import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.services.questions.QuestionBundleAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class QuestionPackHandler implements GameObserver {

    private GameStateSubject gameStateSubject;
    private List<QuestionPackDto> bundle ;
    private int round;
    private int categoryId;
    private int userId;
    private  QuestionPackDto questionPackDto;

    @Autowired
    QuestionBundleAssembler assembler;

    @Override
    public void update() {
        this.round = gameStateSubject.getRound();
        this.userId = gameStateSubject.getUserId();
        this.categoryId= gameStateSubject.getCategoryId();

        if(bundle == null){
            bundle = assembler.getWeightedQuestionBundle();
        }
    }

    public QuestionPackDto getQuestionPackDto(){
        return  bundle.get(round);
    }

    public void setGameStateSubject(GameStateSubject gameStateSubject) {
        this.gameStateSubject = gameStateSubject;
    }
}
