package com.fk.searchAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.SQL.Save;
import com.fk.bean.SQL.SaveSql;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.dao.resources.ResourcesDao;
import com.opensymphony.xwork2.ActionSupport;

public class SearchOfResourcesAdvanced_center extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private Page_center page;
	private int typeerror;
	private String searchWord1 = null;
	private String searchWord2 = null;
	private String searchWord3 = null;
	private String[] searchWords = null;
	private String section1 = null;
	private String section2 = null;
	private String section3 = null;
	private String[] sections = null;
	private String boolean1 = null;
	private String boolean2 = null;
	private String[] booleans = null;
	private String startYear = null;
	private String endYear = null;
	private String ftype = null;
	private List<String> tag_list;
	public List<String> getTag_list() {
		return tag_list;
	}
	public void setTag_list(List<String> tag_list) {
		this.tag_list = tag_list;
	}
	public String getStartYear() {
		return startYear;
	}
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	public String getEndYear() {
		return endYear;
	}
	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public String getSearchWord1() {
		return searchWord1;
	}
	public void setSearchWord1(String searchWord1) {
		this.searchWord1 = searchWord1;
	}
	public String getSearchWord2() {
		return searchWord2;
	}
	public void setSearchWord2(String searchWord2) {
		this.searchWord2 = searchWord2;
	}
	public String getSearchWord3() {
		return searchWord3;
	}
	public void setSearchWord3(String searchWord3) {
		this.searchWord3 = searchWord3;
	}
	public String[] getSearchWords() {
		return searchWords;
	}
	public void setSearchWords(String[] searchWords) {
		this.searchWords = searchWords;
	}
	public String getSection1() {
		return section1;
	}
	public void setSection1(String section1) {
		this.section1 = section1;
	}
	public String getSection2() {
		return section2;
	}
	public void setSection2(String section2) {
		this.section2 = section2;
	}
	public String getSection3() {
		return section3;
	}
	public void setSection3(String section3) {
		this.section3 = section3;
	}
	public String[] getSections() {
		return sections;
	}
	public void setSections(String[] sections) {
		this.sections = sections;
	}
	public String getBoolean1() {
		return boolean1;
	}
	public void setBoolean1(String boolean1) {
		this.boolean1 = boolean1;
	}
	public String getBoolean2() {
		return boolean2;
	}
	public void setBoolean2(String boolean2) {
		this.boolean2 = boolean2;
	}
	public String[] getBooleans() {
		return booleans;
	}
	public void setBooleans(String[] booleans) {
		this.booleans = booleans;
	}
	public Page_center getPage() {
		return page;
	}
	public void setPage(Page_center page) {
		this.page = page;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public int getTypeerror() {
		return typeerror;
	}
	public void setTypeerror(int typeerror) {
		this.typeerror = typeerror;
	}
	public String execute() throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			this.setTypeerror(20);
			return "USERERROR";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer sb = new StringBuffer();
		String[] str = new String[13];
		int cou = 0;
		sb.append("select * from file where uid=? and ");
		sb.append(section1+" like ? ");
		str[cou++] = "%"+searchWord1+"%";
		if(!searchWord2.equals("")){
			if(boolean1.equals("NOT")){
				sb.append("and ");
				sb.append(section2+" not like ? ");
				str[cou++] = "%"+searchWord2+"%";
			}
			else{
				sb.append(boolean1+" ");
				sb.append(section2+" like ? ");
				str[cou++] = "%"+searchWord2+"%";
			}
		}
		if(!searchWord3.equals("")){
			if(boolean2.equals("NOT")){
				sb.append("and ");
				sb.append(section3+" not like ? ");
				str[cou++] = "%"+searchWord3+"%";
			}else{
				sb.append(boolean2+" ");
				sb.append(section3+" like ? ");
				str[cou++] = "%"+searchWord3+"%";
			}
		}
		if(searchWords != null){
			for(int i=0;i<searchWords.length;i++){
				if(!searchWords[i].equals("")){
					if(booleans[i].equals("NOT")){
						sb.append("and ");
						sb.append(sections[i]+" not like ? ");
						str[cou++] = "%"+searchWords[i]+"%";
					}else{
						sb.append(booleans[i] + " ");
						sb.append(sections[i]+" like ? ");
						str[cou++] = "%"+searchWords[i]+"%";
					}
				}
			}
		}
		System.out.println(sb.toString());
		if(Integer.parseInt(startYear)==1969 && Integer.parseInt(endYear)==2016 && Integer.parseInt(ftype)== -1){
			ResourcesDao dao = new ResourcesDao();
			request.getSession().setAttribute("sql1", sb.toString());
			request.getSession().setAttribute("str1", str);
			request.getSession().setAttribute("cou1", cou);
			page = dao.getSearchResources(sb.toString(), str,cou, 1, user.getUid());
		}else{
			sb.append(" and uploadtime >= ? and uploadtime <= ? and ftypeid = ?");
			str[cou++] = startYear+"-01-01 00:00:00";
			str[cou++] = endYear + "-12-31 00:00:00";
			str[cou++] = ftype;
			ResourcesDao dao = new ResourcesDao();
			request.getSession().setAttribute("sql", sb.toString());
			request.getSession().setAttribute("str", str);
			request.getSession().setAttribute("cou", cou);
			page = dao.getSearchResources(sb.toString(), str,cou, 1, user.getUid());
		}
		CenterDao centerDao = new CenterDao();
		tag_list = centerDao.getTag_list(user.getUid());
		return SUCCESS;
	}
}
