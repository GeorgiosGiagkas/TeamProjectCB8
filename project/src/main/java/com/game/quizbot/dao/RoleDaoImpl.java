package com.game.quizbot.dao;

import com.game.quizbot.model.Role;
import com.game.quizbot.repositories.RoleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleDaoImpl implements RoleDao{

    @Autowired
    RoleRepo roleRepo;

    @Override
    public Role getRoleByRoleName(String roleName) {
        Role roleByRoleName = roleRepo.getRoleByRoleName(roleName);
        return roleByRoleName;
    }
}
