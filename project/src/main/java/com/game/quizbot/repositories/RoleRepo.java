package com.game.quizbot.repositories;

import com.game.quizbot.model.Role;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepo extends CrudRepository<Role,Integer> {

    @Query("SELECT r from Role r WHERE r.roleName=?1")
    Role getRoleByRoleName(String roleName);
}
