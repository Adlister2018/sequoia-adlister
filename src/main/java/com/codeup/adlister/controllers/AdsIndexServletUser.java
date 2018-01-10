package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet(name = "controllers.AdsIndexServletUser", urlPatterns = "/ads/profileAds")
@WebServlet(name = "controllers.AdsIndexServletUser", urlPatterns = "/ads/profileAds")
public class AdsIndexServletUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        User user;

        if (request.getParameter("id") != null) {

            Long id = Long.parseLong(request.getParameter("id"));
            user = DaoFactory.getUsersDao().findById(id);

        } else {

            user = (User) request.getSession().getAttribute("user");
        }



        List<Ad> userAds = DaoFactory.getAdsDao().userAds(user.getId());

        for(Ad ad : userAds) {
            System.out.println("---");
            System.out.println("  id#" + ad.getId());
            System.out.println("  title: " + ad.getTitle());
        }

        request.setAttribute("userAds", userAds);

        request.getRequestDispatcher("/WEB-INF/ads/profileAds.jsp").forward(request, response);
    }
}
