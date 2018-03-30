package domain;

public class Articletype {
	private Long article_type_id;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getArticle_type_id() {
		return article_type_id;
	}

	public void setArticle_type_id(Long article_type_id) {
		this.article_type_id = article_type_id;
	}
}
