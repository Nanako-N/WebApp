package model;

public class ColorPalette {
	private String baseColor;
    private String baseName;
    private String assortColor;
    private String assortName;
    private String accentColor;
    private String accentName;
    private String theme;

    public ColorPalette() {
    }
    public ColorPalette(String baseColor) {
        this.baseColor = baseColor;
    }
    public ColorPalette(String baseColor, String assortColor, String accentColor) {
        this.baseColor = baseColor;
        this.assortColor = assortColor;
        this.accentColor = accentColor;
    }

    //セットメソッド RGB値用と名前用の2種類用意。
    public void setBaseColor(String s) { this.baseColor = s; }
    public void setBaseName(String s) { this.baseName = s; }
    
    public void setAssortColor(String s) { this.assortColor = s; }
    public void setAssorrtName(String s) { this.assortName = s; }
    
    public void setAccentColor(String s) { this.accentColor = s; }
    public void setAccentName(String s) { this.accentName = s; }
    
    public void setTheme(String s) { this.theme = s; }
    
    //ゲットメソッド セットメソッドと同じく同じく2種類用意。
    public String getBaseColor() { return baseColor; }
    public String getBaseName() { return baseName; }
    
    public String getAssortColor() { return assortColor; }
    public String getAssortName() { return assortName; }
    
    public String getAccentColor() { return accentColor; }
    public String getAccentName() { return accentName; }
    
    public String getTheme() { return theme; }
}
