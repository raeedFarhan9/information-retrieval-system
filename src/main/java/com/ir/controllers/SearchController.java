package com.ir.controllers;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ir.domain.Launcher;
import com.ir.domain.resultDTO;


@Controller
public class SearchController {
   
    @RequestMapping("/search")
    public String search(){
        return "searchForm";
    }

    @RequestMapping(value = "/results", method = {RequestMethod.POST, RequestMethod.GET})
    public String search(@RequestParam String query, Model model) throws IOException{

    	Launcher launcher = new Launcher();
    	List<resultDTO> rDto = launcher.searchh(query);
    	model.addAttribute("resultList", rDto);

       return "searchForm";
    }    
}
