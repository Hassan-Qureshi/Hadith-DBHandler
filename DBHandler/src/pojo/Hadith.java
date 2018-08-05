package pojo;

public class Hadith {

	private String id;
	private String hadithData;
	private String hadithDataArabic;
	private String hadithReference;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHadithData() {
		return hadithData;
	}

	public void setHadithData(String hadithData) {
		this.hadithData = hadithData;
	}

	public String getHadithDataArabic() {
		return hadithDataArabic;
	}

	public void setHadithDataArabic(String hadithDataArabic) {
		this.hadithDataArabic = hadithDataArabic;
	}

	public String getHadithReference() {
		return hadithReference;
	}

	public void setHadithReference(String hadithReference) {
		this.hadithReference = hadithReference;
	}

	@Override
	public String toString() {

		return "ID: " + id + " Hadith: " + hadithData + " Arabaic Text: " + hadithDataArabic + " Hadith Reference: "
				+ hadithReference;
	}

}
