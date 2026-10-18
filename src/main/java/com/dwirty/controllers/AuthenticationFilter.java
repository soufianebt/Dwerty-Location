package com.dwirty.controllers;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        String path = request.getServletPath();
        boolean privatePage = path.equals("/CreateOffre") || path.equals("/ShowOffres")
                || path.equals("/ModifieOffre") || path.startsWith("/creer_offre")
                || path.equals("/modifieoffre.jsp") || path.equals("/showoffre.jsp");
        if (privatePage && (session == null || session.getAttribute("iduser") == null)) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        if (privatePage) {
            response.setHeader("Cache-Control", "no-store");
        }
        if (session != null) {
            request.setAttribute("useremail", session.getAttribute("useremail"));
        }
        if ((path.equals("/CreateOffre") || path.equals("/ModifieOffre") || path.startsWith("/creer_offre")
                || path.equals("/modifieoffre.jsp")) && !Boolean.TRUE.equals(session.getAttribute("owner"))) {
            request.setAttribute("message", "La publication est reservee aux comptes proprietaires.");
            request.getRequestDispatcher("/showoffre.jsp").forward(request, response);
            return;
        }
        chain.doFilter(request, response);
    }
}