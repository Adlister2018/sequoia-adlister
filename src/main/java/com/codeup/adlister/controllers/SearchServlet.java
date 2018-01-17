import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        if (input != null) {
            //Search for ads from a user input
            request.setAttribute("ads", DaoFactory.getAdsDao().search(input));
            request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
        }else {
            response.sendRedirect("/");
        }
    }
}

