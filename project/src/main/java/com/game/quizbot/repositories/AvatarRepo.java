package com.game.quizbot.repositories;

import com.game.quizbot.model.Avatar;
import com.game.quizbot.model.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface AvatarRepo extends PagingAndSortingRepository<Avatar,Integer> {

    @Query("SELECT a from Avatar a WHERE a.avatarName=?1")
    Avatar getAvatarByAvatarName(String avatarName);

    @Query("SELECT a FROM Avatar a")
    Iterable<Avatar> getAllAvatars();

    @Query("SELECT a from Avatar a WHERE a.avatarId = ?1")
    Avatar getAvatarById(int id);

    @Query("SELECT a.avatarId FROM Avatar a, UserAvatar ua WHERE ua.userId.userId =?1 AND ua.avatarId.avatarId = a.avatarId")
    Iterable<Integer> getAllOwnedAvatarsByUserId(int id);

    @Query("SELECT a FROM Avatar a")
    Page<Avatar> getAllAvatarsByPageNo(@Param("pageNo") int somethingelseid, Pageable pageable);

    @Query(value = "SELECT COUNT(*) FROM avatar;", nativeQuery = true)
    int getAvatarCount();



}
