package model;

public class MakeColorPalette {
	//ベースカラー、テーマからアソート・アクセントを取得
    public ColorPalette make(String baseColor, String baseName, int theme, String[] data, int index) {
        //返り値: ColorPalette
        ColorPalette cp = new ColorPalette();
        
        //選ばれたベースカラー番号(int index)とテーマ番号(int theme)からdata配列のポインタ(int型)を作る
        int pointer = index*12 + theme*4;
        
        String assortColor, assortName, accentColor, accentName;
        assortColor = data[pointer];
        assortName = data[pointer+1];
        accentColor = data[pointer+2];
        accentName = data[pointer+3];
        
        cp.setBaseColor(baseColor);
        cp.setBaseName(baseName);
        cp.setAssortColor(assortColor);
        cp.setAssorrtName(assortName);
        cp.setAccentColor(accentColor);
        cp.setAccentName(accentName);
        //cp.setTheme(theme);
        return cp;
    }
}
