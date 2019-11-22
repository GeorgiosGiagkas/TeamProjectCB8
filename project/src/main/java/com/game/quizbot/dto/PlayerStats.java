package com.game.quizbot.dto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Component
public class PlayerStats {

    @Autowired
    EntityManager entityManager;

    public List<PlayerStatsDto> getList(int userId){
        List<PlayerStatsDto> playerStatDtos =
                entityManager.createQuery("select  new com.game.quizbot.dto.PlayerStatsDto(" +
                        " uh.category.categoryId, uh.category.categoryName, uh.highscore) from UserHighscore uh where uh.user.userId =:userId",PlayerStatsDto.class)
                        .setParameter("userId", userId).getResultList();
        return playerStatDtos;
    }

    public List<PlayerHighscoreStatsDto> getUsersHighscore(int categoryId){
        List<PlayerHighscoreStatsDto> players =
                entityManager.createQuery("select new com.game.quizbot.dto.PlayerHighscoreStatsDto(uh.user.userId,uh.highscore) from UserHighscore uh where uh.category.categoryId =:categoryId",PlayerHighscoreStatsDto.class)
                        .setParameter("categoryId",categoryId).getResultList();
        return players;

    }

    public List<PlayerStatsDto> getFullList(int userId){
        List<PlayerStatsDto> playerStatDtos = getList(userId);
        playerStatDtos.forEach(ps->{
            List<PlayerHighscoreStatsDto> players = getUsersHighscore(ps.getCategoryId());
            Collections.sort(players,(o1, o2) -> o2.getHighscore()-o1.getHighscore());
            for(int i=0;i<players.size();i++){
                if(players.get(i).getUserId()==userId){
                    ps.setPosition(i+1);
                }
            }
        });
        return playerStatDtos;
    }
}
