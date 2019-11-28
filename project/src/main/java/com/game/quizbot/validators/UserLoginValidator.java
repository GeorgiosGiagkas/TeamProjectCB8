package com.game.quizbot.validators;

import com.game.quizbot.dao.UserDao;
import com.game.quizbot.dto.UserDto;
import com.game.quizbot.model.User;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import javax.servlet.http.HttpSession;
import java.util.regex.Pattern;

@Component
public class UserLoginValidator implements Validator {

    @Autowired
    UserDao userDao;

    @Autowired
    HttpSession session;

    @Override
    public boolean supports(Class<?> type) {
        return UserDto.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        UserDto userDto = (UserDto) o;

        // Check field "userNickname" of LoginForm
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userNickname", "userNickname.required");

        // Check field "userPassword" of LoginForm
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPassword", "userPassword.required");

        // Check username/password combination of LoginForm
        User dbUser = userDao.getUserByNickname(userDto.getUserNickname());
        if (userDto.getUserNickname() != null && dbUser != null) {
            if (!(BCrypt.checkpw(userDto.getUserPassword(), dbUser.getUserPassword()))) {
                errors.rejectValue("userPassword", "loginError.notExists");
            }
        } else if (dbUser == null){
            errors.rejectValue("userPassword", "loginError.notExists");
        }

    }


}
