package com.game.quizbot.dto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import java.util.List;

@Component
public class PlayerStats {

    @Autowired
    EntityManager entityManager;

    public List<PlayerStatsDto> getList(int userId){
        List<PlayerStatsDto> playerStatDtos =
                entityManager.createQuery("select  new com.game.quizbot.dto.PlayerStatsDto(" +
                        " uh.category.categoryName, uh.highscore) from UserHighscore uh where uh.user.userId =:userId",PlayerStatsDto.class)
                        .setParameter("userId", userId).getResultList();
        return playerStatDtos;
    }
}
