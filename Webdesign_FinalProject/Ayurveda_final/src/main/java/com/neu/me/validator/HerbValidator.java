package com.neu.me.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.neu.me.pojo.Herbs;





public class HerbValidator implements Validator {

	private static final String IMAGE_PATTERN = "([^\\s]+(\\.(?i)(jpg|png|gif|bmp))$)";
    public boolean supports(Class aClass)
    {
        return aClass.equals(Herbs.class);
    }

    public void validate(Object obj, Errors errors)
    {
    	Pattern pattern = Pattern.compile(IMAGE_PATTERN);
        Matcher matcher;
        MultipartFile herbImage;
    	
        Herbs herb = (Herbs) obj;
        String herbname = herb.getHerbName();
        
        String scienname = herb.getScientificname();
        String desc = herb.getDescription();
        String valherbname = herbname.replaceAll("[^\\dA-Za-z] ", "").replaceAll("\\s"," ").trim();
        
        String valscienname = scienname.replaceAll("[^\\dA-Za-z] ", "").replaceAll("\\s"," ").trim();
        String valdesc = desc.replaceAll("[^\\dA-Za-z] ", "").replaceAll("\\s"," ").trim();
        System.out.println("replace invalid character from herbs");
        herb.setHerbName(valherbname);
        
        herb.setScientificname(valscienname);
        herb.setDescription(valdesc);
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "herbName", "error.invalid.herbname", "Herb name Required");
      
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "scientificname", "error.invalid.scienname", "Scientific name name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "error.invalid.desc", "Description name Required");
        try
        {
        	if(herb.getHerbImage() != null)
        	{
        		herbImage = herb.getHerbImage();
        		matcher = pattern.matcher(herbImage.getOriginalFilename());
        
        		if(0 == herbImage.getSize()) {
	        		errors.rejectValue("herbImage","Test","File is empty");
	        	}
	        	if(!matcher.matches()) {
	        		errors.rejectValue("herbImage","Test","Invalid Image Format");
	        	}
	        
	        	if(2000000 < herbImage.getSize()) {
	             errors.rejectValue("herbImage","Test","File size is over 2mb !");
	        	}
        	}
        }
        catch(Exception e)
        {
        	System.out.println("inside exception");
        	errors.rejectValue("herbImage","Test","File is empty");
        }
        
    }
}
