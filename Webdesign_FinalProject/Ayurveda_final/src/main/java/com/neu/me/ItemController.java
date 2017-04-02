package com.neu.me;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.neu.me.dao.CommentDao;
import com.neu.me.dao.HerbsDao;
import com.neu.me.dao.ItemsDao;
import com.neu.me.dao.LikeDao;
import com.neu.me.dao.SubCategoryDao;
import com.neu.me.dao.UserDao;
import com.neu.me.exception.UserException;
import com.neu.me.pojo.Category;
import com.neu.me.pojo.Comments;
import com.neu.me.pojo.FAQ;
import com.neu.me.pojo.Herbs;
import com.neu.me.pojo.Items;
import com.neu.me.pojo.Like;
import com.neu.me.pojo.SubCategory;
import com.neu.me.pojo.UserAccount;

@Controller
@RequestMapping("/*Items.htm")
public class ItemController {

	@Autowired
	@Qualifier("itemDao")
	ItemsDao itemDao;
	
	@Autowired
	@Qualifier("subcatDao")
	SubCategoryDao subcatDao;
	
	@Autowired
	@Qualifier("herbDao")
	HerbsDao herbDao;
	
	
	@Autowired
	@Qualifier("userDao")
	UserDao userDao;
	
	@Autowired
	@Qualifier("likeDao")
	LikeDao likeDao;
	
	@Autowired
	@Qualifier("commentDao")
	CommentDao commentDao;
	
	@RequestMapping(value = "/addItems.htm", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		try
		{
			HttpSession session = request.getSession(false);
			String role = (String)session.getAttribute("role");
			String username = (String)session.getAttribute("username");
			
			UserAccount uacc = userDao.get(username); 
			
			List<Items> itemlist = itemDao.getByPersonid(uacc.getPerson().getPersonid());
			List<SubCategory> subcatList = subcatDao.getAll();
			List<Herbs> herbList = herbDao.getAll();
			mv.addObject("task","additem");
			mv.addObject("itemlist",itemlist);
			mv.addObject("subcatList",subcatList);
			mv.addObject("herbList",herbList);
			if(role.equalsIgnoreCase("admin"))
	    		mv.setViewName("admin/adminHome");
	    	else if(role.equalsIgnoreCase("expert"))
	    		mv.setViewName("expert/expertHome");
	    	else
	    		mv.setViewName("user/userHome");
		
		}
		catch(UserException e)
		{
			mv.setViewName("home");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/commentItems.htm", method = RequestMethod.POST)
	public ModelAndView addcomment(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String userrole = null;
		try
		{
		
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("username");
		userrole = (String)session.getAttribute("role");
		String itemid = request.getParameter("itemid");
		String comment = request.getParameter("comment");
		Items item = itemDao.get(Integer.parseInt(itemid));
		UserAccount uacc = userDao.get(username);
		Comments com = new Comments(comment,item,uacc.getPerson());
		item.getComments().add(com);
		itemDao.update(item);
		List<Items> itemlist = itemDao.getAll();
		
		mv.addObject("itemlist",itemlist);
	
		
		}
		catch(UserException e)
		{
			e.printStackTrace();
			System.out.println("error adding comments");
		}
		//mv.addObject("task","additem");
		String viewname = userrole+"/"+userrole+"Home";
		mv.setViewName(viewname);
		return mv;
	}
	
	@RequestMapping(value = "/likeItems.htm", method = RequestMethod.POST)
	public void addlike(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String userrole = null;
		try
		{
			PrintWriter out = (PrintWriter)response.getWriter();
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("username");
		userrole = (String)session.getAttribute("role");
		String itemid = request.getParameter("itemid");
	
		Items item = itemDao.get(Integer.parseInt(itemid));
		UserAccount uacc = userDao.get(username);
		boolean checkitemLike = itemDao.checkLikePresent(item,uacc.getPerson());
		
		if(!checkitemLike)
		{
			System.out.println("inside check like");
			Like like = new Like(item,uacc.getPerson());
		item.getLike().add(like);
		like.setItemid(item);
		itemDao.update(item);
		out.println("Not Present");
		}
		else
		{
			Like like = likeDao.get(item, uacc.getPerson());
			likeDao.delete(like);
			//System.out.println("item likelist size"+item.getLike().size());
			Set<Like> likeset = new HashSet(); 
				likeset =	item.getLike();
			for(Like like2 : likeset)
			{
				if(like2.getLikeid() == like.getLikeid())
				{
					item.getLike().remove(like2);
				}
			}
			
			
			System.out.println("item likelist after size"+item.getLike().size());

			itemDao.update(item);
			System.out.println("inside else check like");
			out.println("Present");
		}
		
	
		
		}
		catch(UserException e)
		{
			e.printStackTrace();
			System.out.println("error adding Like");
		}
		//mv.addObject("task","additem");
		
	}

	@RequestMapping(value = "/deleteItems.htm", method = RequestMethod.POST)
	public void deleteCat(HttpServletRequest request) {
	//	ModelAndView mv = new ModelAndView();
		try
		{
			System.out.println("inside delete");
			String itemid = request.getParameter("itemid");
			System.out.println("itemid" + itemid);
			Items item = itemDao.get(Integer.parseInt(itemid));
			itemDao.delete(item);
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
	
	
	@RequestMapping(value = "/addItems.htm", method = RequestMethod.POST)
	public ModelAndView catform(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		String role = (String)session.getAttribute("role");
		String username = (String) session.getAttribute("username");
    		List<Items> itemlist = null;
    		List<SubCategory> subcatList = null;
    		List<Herbs> herbList = null;
    		try
    		{
    			String itemname = request.getParameter("itemName");
    			String subcategory = request.getParameter("subcategory");
    			String herbs = request.getParameter("herbs");
    			String description = request.getParameter("description");
    			String benifits = request.getParameter("benifits");
    			String procedure = request.getParameter("procedure");
    			
    			
    			String valitemname = itemname.replaceAll("[^\\dA-Za-z.,] ", "").replaceAll("\\s"," ").trim();
    			String valdescription = description.replaceAll("[^\\dA-Za-z.,?] ", "").replaceAll("\\s"," ").trim();
    			String valbenifits = benifits.replaceAll("[^\\dA-Za-z.,?] ", "").replaceAll("\\s"," ").trim();
    			String valprocedure = procedure.replaceAll("[^\\dA-Za-z.,?] ", "").replaceAll("\\s"," ").trim();
    			
    			SubCategory subcat = subcatDao.get(Integer.parseInt(subcategory));
    			Herbs herb = herbDao.get(Integer.parseInt(herbs));
    			UserAccount user = userDao.get(username);
    			itemDao.create(valitemname,subcat,herb,valdescription,valbenifits,valprocedure,user.getPerson().getPersonid());
    			itemlist = itemDao.getByPersonid(user.getPerson().getPersonid());
    			subcatList = subcatDao.getAll();
    			herbList = herbDao.getAll();
    			mv.addObject("message","Item Added Successfully");
    			
    			mv.addObject("itemlist",itemlist);
    			mv.addObject("subcatList",subcatList);
    			mv.addObject("herbList",herbList);
    			
    		
    		}
    		catch(UserException e)
    		{
    			
    			
    			mv.addObject("message","Item Already Exist");
    			
    			
    			System.out.println("error");
    		}
    	
    		mv.addObject("task","additem");
    		if(role.equalsIgnoreCase("admin"))
        		mv.setViewName("admin/adminHome");
        		else if(role.equalsIgnoreCase("expert"))
        			mv.setViewName("expert/expertHome");
        		else
        			mv.setViewName("user/userHome");
		return mv;
	}
	
	@RequestMapping(value = "/editItems.htm", method = RequestMethod.POST)
	public ModelAndView catedit(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String role = (String)session.getAttribute("role");
		String username = (String) session.getAttribute("username");
		ModelAndView mv = new ModelAndView();
		List<Items> itemlist = null;
		List<SubCategory> subcatList = null;
		List<Herbs> herbList = null;
    		try
    		{
    			String itemid = request.getParameter("itemId");
    			
    			String itemname = request.getParameter("itemName");
    			String subcategory = request.getParameter("subcategory");
    			String herbs = request.getParameter("herbs");
    			String description = request.getParameter("description");
    			String benifits = request.getParameter("benifits");
    			String procedure = request.getParameter("procedure");
    			
    			
    			String valitemname = itemname.replaceAll("[^\\dA-Za-z.,] ", "").replaceAll("\\s"," ").trim();
    			String valdescription = description.replaceAll("[^\\dA-Za-z.,?] ", "").replaceAll("\\s"," ").trim();
    			String valbenifits = benifits.replaceAll("[^\\dA-Za-z.,?] ", "").replaceAll("\\s"," ").trim();
    			String valprocedure = procedure.replaceAll("[^\\dA-Za-z.,?] ", "").replaceAll("\\s"," ").trim();
    			System.out.println("proceure" + valprocedure);
    			SubCategory subcat = subcatDao.get(Integer.parseInt(subcategory));
    			Herbs herb = herbDao.get(Integer.parseInt(herbs));
    			Items item = itemDao.get(Integer.parseInt(itemid));
    			item.setBenefits(valbenifits);
    			item.setDescription(valdescription);
    			item.setHerbs(herb);
    			item.setProcedurestep(valprocedure);
    			item.setSubcat(subcat);
    			item.setItemName(valitemname);
    		
    			
    			
    			itemDao.update(item);
    			UserAccount user = userDao.get(username);
    			itemlist = itemDao.getByPersonid(user.getPerson().getPersonid());
    			subcatList = subcatDao.getAll();
    			herbList = herbDao.getAll();
    			
    			
    			mv.addObject("message","Category updated Successfully");
    			mv.addObject("itemlist",itemlist);
    			mv.addObject("subcatList",subcatList);
    			mv.addObject("herbList",herbList);
    			

    		}
    		catch(UserException e)
    		{
    			
    			
    			mv.addObject("message","Item Already Exist");
    			
    			
    			System.out.println("error");
    		}
    	
    		mv.addObject("task","additem");
    		if(role.equalsIgnoreCase("admin"))
        		mv.setViewName("admin/adminHome");
        		else if(role.equalsIgnoreCase("expert"))
        			mv.setViewName("expert/expertHome");
        		else
        			mv.setViewName("user/userHome");
		return mv;
	}
	
	@RequestMapping(value = "/deleteCommentItems.htm", method = RequestMethod.POST)
	public void deleteComment(HttpServletRequest request) {
	//	ModelAndView mv = new ModelAndView();
		try
		{
			System.out.println("inside delete comment");
			String commentid = request.getParameter("commentid");
			System.out.println("commentid" + commentid);
			Comments comment = commentDao.getById(Integer.parseInt(commentid));
			commentDao.delete(comment);
			
			
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
}
