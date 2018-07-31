package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import model.ColorPalette;
import model.MakeColorPalette;
import model.ReadFile;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//リクエストパラメータの取得
        request.setCharacterEncoding("UTF-8");
        String baseColor = request.getParameter("selectedBaseColor");
        String baseName = request.getParameter("selectedBaseColorName");
        String baseIndex = request.getParameter("baseColorIndex");
        String theme = request.getParameter("theme");
        
        //パターン毎のアソート・アクセント一覧ファイルの読み込み
        ServletContext context = this.getServletContext();
        String path = context.getRealPath("/WEB-INF/Color2.csv");
        ReadFile rf = new ReadFile();
        //データ数: 35色*3テーマ*4列
        int numOfData = 35*3*4;
        String[] data2 = rf.readFile(path, numOfData);
        
        // カラーパレットを作る
        MakeColorPalette mcp = new MakeColorPalette();
        int themeNumber = Integer.parseInt(theme);
        int index = Integer.parseInt(baseIndex);
        ColorPalette colorPalette = mcp.make(baseColor, baseName, themeNumber, data2, index);
        
        //リクエストスコープにカラーパレットを保存
        request.setAttribute("colorPalette", colorPalette);
        
        //フォワード
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
            dispatcher.forward(request, response);
	}

}
