package com.neu.me;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.neu.me.dao.HerbsDao;
import com.neu.me.exception.UserException;

import com.neu.me.pojo.Herbs;
import com.neu.me.validator.HerbValidator;



@Controller
@RequestMapping("/*herb.htm")
public class HerbController {
	
	@Autowired
	@Qualifier("herbDao")
	HerbsDao herbDao;

	@Autowired
	@Qualifier("regHerbValidator")
	HerbValidator herbValidator;
	
	@InitBinder
	private void initBinder(WebDataBinder binder){
		binder.setValidator(herbValidator);
	} 

	
	@RequestMapping(value="Allherb.htm",method = RequestMethod.GET) 
    public ModelAndView guestherbPage(HttpServletRequest request, HttpServletResponse response){ 
   
		System.out.println("inside allherb .htm method");
		ModelAndView mv = new ModelAndView();
		List<Herbs> herbList =herbDao.getAll();	
		
		if(herbList == null)
		{
			 mv.addObject("nodata", "No Data Found");
		}
		else
		{
			mv.addObject("herbList", herbList);
		}
		System.out.println("all herb is showing");
		HttpSession session = request.getSession(false);
		if(session !=null)
		{
			String role = (String)session.getAttribute("role");
			if(role.equalsIgnoreCase("user"))
			{
				mv.addObject("task","seeherb");
				mv.setViewName("user/userHome");
			}
			else if(role.equalsIgnoreCase("expert"))
			{
				mv.addObject("task","viewherb");
				mv.setViewName("expert/expertHome");
			}
		}
		else
		{
			mv.addObject("task","viewherb");
		
			mv.setViewName("guest");
		}
	        return mv;
    }
	@RequestMapping(value = "/addherb.htm", method = RequestMethod.GET)
	public ModelAndView home(@ModelAttribute("herb")Herbs herbs, BindingResult result) {
		System.out.println("inside her get");
		ModelAndView mv = new ModelAndView();
		List<Herbs> herbList =herbDao.getAll();
		mv.addObject("task","addherb");
		mv.addObject("herbList",herbList);
		mv.setViewName("admin/adminHome");
		return mv;
	}
	
	@RequestMapping(value = "/deleteherb.htm", method = RequestMethod.POST)
	public void deleteHerb(HttpServletRequest request) {
	//	ModelAndView mv = new ModelAndView();
		try
		{
			System.out.println("inside delete");
			String herbid = request.getParameter("herbid");
			System.out.println("herbid" + herbid);
			Herbs herb = herbDao.get(Integer.parseInt(herbid));
			herbDao.delete(herb);
		//mv.addObject("task","addCat");void
		
		//mv.addObject("message","");
		}
		catch(UserException e)
		{
			System.out.println("numberformat exception");
		}
		//mv.setViewName("admin/adminHome");
		//return mv;
	}
	
	
	@RequestMapping(value = "/addherb.htm", method = RequestMethod.POST)
	public ModelAndView catform(@ModelAttribute("herb")Herbs herb, BindingResult result, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("inside herb post"+herb.getHerbName());
		ModelAndView mv = new ModelAndView();
		herbValidator.validate(herb, result);
    	if(result.hasErrors()){
    	System.out.println("error found");
    		
    	}
    	else
    	{	
    		List<Herbs> herblist = null;
    		
    		try
    		{
    			
    			File file;
    	        String check = File.separator; //Checking if system is linux based or windows based by checking seprator used.
    	        String path =  getClass().getResource("/").getPath().replace("WEB-INF/classes","resources/images/herbs/");
    	        String fileurl = "";
    	        if(herb.getHerbImage() !=null)
    	        {
    	            fileurl = System.currentTimeMillis() + herb.getHerbImage().getOriginalFilename();
    	            file = new File(path+fileurl);
    	            System.out.println("path:" + path+fileurl);
    	           // String context = getServletContext().getContextPath();
    	          //  System.out.println("context" +context);
    	        }
    	        else
    	        {
    	        	fileurl = System.currentTimeMillis() + "noimage.jpg";
    	            file = new File(path+fileurl);
    	            System.out.println("path:" + path+fileurl);
    	        }
    	        herb.getHerbImage().transferTo(file);
	            herb.setImageName(fileurl);
	        
			herbDao.create(herb);
			herblist = herbDao.getAll();
		
			mv.addObject("message","Herb Added Successfully");
			mv.addObject("herbList",herblist);
		
	    
    		}
    		catch(UserException e)
    		{
    			
    			
    			mv.addObject("message","Herb Already Exist");
    			mv.addObject("herbList",herblist);
    			
    			System.out.println("error");
    		}
    	}
    	mv.addObject("task","addherb");
    	mv.setViewName("admin/adminHome");
		return mv;
	}
	
	@RequestMapping(value = "/editherb.htm", method = RequestMethod.POST)
	public ModelAndView catedit(@ModelAttribute("herb")Herbs herb, BindingResult result, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		herbValidator.validate(herb, result);
    	if(result.hasErrors()){
    	System.out.println("error found");
    	//	  mv.addObject("error","Invalid Credential");
	    	  
    		
    	}
    	else
    	{	
    		String herbid = request.getParameter("herbid");
    		List<Herbs> herblist = null;
    		try
    		{
    			Herbs herbs = herbDao.get(Integer.parseInt(herbid));
    			herbs.setDescription(herb.getDescription());
    			herbs.setHerbName(herb.getHerbName());
    			herbs.setImageName(herb.getImageName());
    			herbs.setScientificname(herb.getScientificname());
    			herbDao.update(herbs);
    			herblist = herbDao.getAll();
    			
    			mv.addObject("message","Herb updated Successfully");
    			mv.addObject("herbList",herblist);

    		}
    		catch(UserException e)
    		{
    			
    			
    			mv.addObject("message","Herb Already Exist");
    			mv.addObject("herbList",herblist);
    			
    			System.out.println("error");
    		}
    	}
    	mv.addObject("task","addherb");
    	mv.setViewName("admin/adminHome");
		return mv;
	}
}
