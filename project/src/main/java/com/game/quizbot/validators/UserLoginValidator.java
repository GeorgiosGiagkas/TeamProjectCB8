package com.game.quizbot.validators;

import com.game.quizbot.dao.UserDao;
import com.game.quizbot.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class UserLoginValidator implements Validator {

    @Autowired
    UserDao userDao;

    @Override
    public boolean supports(Class<?> type) {
        return User.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User u = (User) o;

        // Check field "userNickname" of LoginForm
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userNickname", "userNickname.required");
        if (u.getUserNickname().length() < 6) {
            errors.rejectValue("userNickname", "userNickname.minLength");
        } else if (u.getUserNickname().length() > 15) {
            errors.rejectValue("userNickname", "userNickname.maxLength");
        }
        Pattern digitLetterPattern = Pattern.compile("(?=.*?[0-9])(?=.*?[A-Za-z]).+");
        if (!(digitLetterPattern.matcher(u.getUserNickname()).matches())) {
            errors.rejectValue("userNickname", "userNickname.digitLetterPattern");
        }
        if (u.getUserNickname().contains(" ")) {
            errors.rejectValue("userNickname", "userNickname.whiteSpacePattern");
        }

        // Check field "userPassword" of LoginForm
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPassword", "userPassword.required");
        if (u.getUserPassword().length() < 6) {
            errors.rejectValue("userPassword", "userPassword.minLength");
        } else if (u.getUserPassword().length() > 60) {
            errors.rejectValue("userPassword", "userPassword.maxLength");
        }
        Pattern digitLetterSpecialCharPattern = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$");
        if (!(digitLetterSpecialCharPattern.matcher(u.getUserPassword()).matches())) {
            errors.rejectValue("userPassword", "userPassword.digitLetterSpecialCharPattern");
        }
        if (u.getUserPassword().contains(" ")) {
            errors.rejectValue("userPassword", "userPassword.whiteSpacePattern");
        }

        // Check username/password combination of LoginForm
        if(!userDao.checkUserByPassword(u)){
            errors.rejectValue("userPassword", "loginError.notExists");
        }
    }



}
