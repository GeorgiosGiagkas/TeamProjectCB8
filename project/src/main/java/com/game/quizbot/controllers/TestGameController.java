package com.game.quizbot.controllers;

import com.game.quizbot.dto.AnswerDto;
import com.game.quizbot.dto.QuestionPackDto;
import com.game.quizbot.dto.QuestionPacksCreator;
import com.game.quizbot.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
public class TestGameController {

    @Autowired
    QuestionPacksCreator creator;

    @GetMapping("/test-main-game")
    public ModelAndView testMainGame(ModelAndView mv,HttpSession session){
        int selectedAvatarId = ((UserDto) session.getAttribute("login-user")).getSelectedAvatarId();
        mv.addObject("selectedAvatarId",selectedAvatarId);
        mv.setViewName("main-game");
        return mv;
    }

    @ResponseBody
    @GetMapping("/test-creator-question")
    public List<QuestionPackDto> testCreatorQuestion(){
        return creator.getQuestions(Arrays.asList(1,2,3,4,5));
    }

    @ResponseBody
    @GetMapping("/test-creator-answer")
    public List<AnswerDto> testCreatorAnswer(){
        return creator.getAnswersBasedOnQuestionId(Arrays.asList(1,2,3,4,5));
    }

    @ResponseBody
    @GetMapping("/test-question")
    public List<QuestionPackDto> testQuestion(){
        List<QuestionPackDto> qs = new ArrayList<>();
        AnswerDto a = new AnswerDto();
        QuestionPackDto  q= new QuestionPackDto();
        qs.add(q);
        q.addAnswer(a);
        return  qs;
    }



    @ResponseBody
    @GetMapping("/test-creator")
    public List<QuestionPackDto> testAssembler(){
        List<QuestionPackDto> bundle = creator.getQuestions(Arrays.asList(5,1,6,2,10,2,9,3,8,7));
        List<AnswerDto> answers = creator.getAnswersBasedOnQuestionId(Arrays.asList(5,1,6,2,10,2,9,3,8,7));
        bundle.forEach((q)->{
            List<AnswerDto> answerList = answers.stream().filter((a)->a.getQuestionId()==q.getQuestionId()).collect(Collectors.toList());
            q.setAnswersDto(answerList);
        });
        return bundle;
    }

}
