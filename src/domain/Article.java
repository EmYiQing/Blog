package domain;

public class Article {
	private Long article_id;
	private String title;
	private String summary;
	private Integer read_count;
	private Integer comment_count;
	private Integer up_count;
	private String create_time;
	private Articletype article_type;
	private String article_detail;
	private User author;
	private String author_id;
	private String article_type_id;
	
	
	
	public String getArticle_type_id() {
		return article_type_id;
	}

	public void setArticle_type_id(String article_type_id) {
		this.article_type_id = article_type_id;
	}

	public String getArticle_detail() {
		return article_detail;
	}

	public void setArticle_detail(String article_detail) {
		this.article_detail = article_detail;
	}

	public String getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}

	public Long getArticle_id() {
		return article_id;
	}

	public void setArticle_id(Long article_id) {
		this.article_id = article_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Integer getRead_count() {
		return read_count;
	}

	public void setRead_count(Integer read_count) {
		this.read_count = read_count;
	}

	public Integer getComment_count() {
		return comment_count;
	}

	public void setComment_count(Integer comment_count) {
		this.comment_count = comment_count;
	}

	public Integer getUp_count() {
		return up_count;
	}

	public void setUp_count(Integer up_count) {
		this.up_count = up_count;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public Articletype getArticle_type() {
		return article_type;
	}

	public void setArticle_type(Articletype article_type) {
		this.article_type = article_type;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

}
