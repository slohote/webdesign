package com.neu.me.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.neu.me.pojo.UserAccount;


public class LoginValidator implements Validator {

    public boolean supports(Class aClass)
    {
        return aClass.equals(UserAccount.class);
    }

    public void validate(Object obj, Errors errors)
    {
    	System.out.println("inside validator");
        UserAccount userAccount = (UserAccount) obj;
     
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "error.invalid.user", "User Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.invalid.password", "Password Required");
        
    }
}
