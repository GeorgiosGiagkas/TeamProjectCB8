package com.game.quizbot.services.game;

import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.services.questions.QuestionBundleAssembler;

import java.util.List;



public class QuestionPackHandler implements GameObserver {

    private GameStateSubject gameStateSubject;
    private List<QuestionPackDto> bundle ;
    private int round;
    private int categoryId;
    private int userId;
    private  QuestionPackDto questionPackDto;
    private QuestionBundleAssembler assembler;

    public QuestionPackHandler() {
        assembler= new QuestionBundleAssembler();
    }

    @Override
    public  void update() {


        this.round = gameStateSubject.getRound();
        this.userId = gameStateSubject.getUserId();
        this.categoryId= gameStateSubject.getCategoryId();

        assembler.setUserId(userId);
        assembler.setCategoryId(categoryId);
        if(bundle == null){

            bundle = assembler.getWeightedQuestionBundle();

            gameStateSubject.setTotalRounds(bundle.size());
        }

        setQuestionPackDto();


    }

    public void setQuestionPackDto(){

        if((round-1) < bundle.size()){
            this.questionPackDto = bundle.get(round-1);
        }else{
            //empty pack
            this.questionPackDto= new QuestionPackDto();
            this.questionPackDto.setQuestionId(0);
            gameStateSubject.setRecordStateActive(false);
        }
        gameStateSubject.setQuestionPackDto(this.questionPackDto);
    }

    public QuestionPackDto getQuestionPackDto(){
        return  this.getQuestionPackDto();
    }

    @Override
    public void setGameStateSubject(GameStateSubject gameStateSubject) {
        this.gameStateSubject = gameStateSubject;
    }

    @Override
    public GameStateSubject getGameStateSubject() {
        return gameStateSubject;
    }
}
