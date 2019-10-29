package com.game.quizbot.dao;

import com.game.quizbot.model.Role;

public interface RoleDao {

    Role getRoleByRoleName(String roleName);
}
