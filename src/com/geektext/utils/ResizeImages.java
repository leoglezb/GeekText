package com.geektext.utils;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import com.geektext.form.Picture;
import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;
 
public class ResizeImages {
 
	private static final int IMG_WIDTH = 100;
	private static final int IMG_HEIGHT = 100;
	private static String stError = "*error";
 
	public static void main(String [] args){
 
	try{
 
		BufferedImage originalImage = ImageIO.read(new File("c:\\image\\mkyong.jpg"));
		int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
 
		BufferedImage resizeImageJpg = resizeImage(originalImage, type, 100, 100, 0, 0);
		ImageIO.write(resizeImageJpg, "jpg", new File("c:\\image\\mkyong_jpg.jpg")); 
 
		BufferedImage resizeImagePng = resizeImage(originalImage, type, 100, 100, 0 , 0);
		ImageIO.write(resizeImagePng, "png", new File("c:\\image\\mkyong_png.jpg")); 
 
		BufferedImage resizeImageHintJpg = resizeImageWithHint(originalImage, type, 100, 100);
		ImageIO.write(resizeImageHintJpg, "jpg", new File("c:\\image\\mkyong_hint_jpg.jpg")); 
 
		BufferedImage resizeImageHintPng = resizeImageWithHint(originalImage, type, 100, 100);
		ImageIO.write(resizeImageHintPng, "png", new File("c:\\image\\mkyong_hint_png.jpg")); 
 
	}catch(IOException e){
		e.printStackTrace();
	}
 
    }
	public Picture createThumbImg(File f){
		Picture picture = new Picture();
		try{
			BufferedImage originalImage = ImageIO.read(f);
			int height= originalImage.getHeight();
			int width = originalImage.getWidth();
			float factor = (float)height/width;
			if (width>144){
				width=144;
			}
			height = (int)(width*factor);
			if (height>200){
				height=200;
				width=(int)(height/factor);
			}
			int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
			BufferedImage resizeImage = resizeImageWithMortennobel(originalImage, type, width, height);
			String filename = f.getName();
			String path = f.getAbsolutePath();
			path = path.substring(0, path.indexOf(filename));
			String fname = filename.substring(0,filename.lastIndexOf("."));
			String extension = filename.substring(filename.lastIndexOf("."));
			f = new File(path+fname+"-thumb.jpg");			
			ImageIO.write(resizeImage, "jpg", f);
			picture.setFile(f.getName());
			picture.setWidth(width);
			picture.setHeight(height);
		}catch(IOException e){
			e.printStackTrace();
		}
		return picture;			
	}

	public Picture createProfileImgTemp(File f){
		Picture picture = new Picture();
		try{
			BufferedImage originalImage = ImageIO.read(f);
			int height= originalImage.getHeight();
			int width = originalImage.getWidth();
			float factor = (float)height/width;
			if (width>500){
				width=500;
			}
			height = (int)(width*factor);
			if (height>500){
				height=500;
				width=(int)(height/factor);
			}
			int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
			BufferedImage resizeImage = resizeImageWithMortennobel(originalImage, type, width, height);
			String filename = f.getName();
			String path = f.getAbsolutePath();
			path = path.substring(0, path.indexOf(filename));
			String fname = filename.substring(0,filename.lastIndexOf("."));
			f = new File(path+fname+"-temp.jpg");			
			ImageIO.write(resizeImage, "jpg", f);
			picture.setFile(f.getName());
			picture.setWidth(width);
			picture.setHeight(height);
		}catch(IOException e){
			e.printStackTrace();
		}
		return picture;			
	}
	
	public void createProfileImg(File f, int w, int h, int x1, int y1, int x2, int y2){
		try{
			BufferedImage originalImage = ImageIO.read(f);
			BufferedImage subImage = originalImage.getSubimage(x1, y1, w, h);
			String filename = f.getName();
			String path = f.getAbsolutePath();
			path = path.substring(0, path.indexOf(filename));
			String fname = filename.substring(0,filename.lastIndexOf("-"));
			f = new File(path+fname+"-profile.jpg");			
			ImageIO.write(subImage, "jpg", f);

			int height= subImage.getHeight();
			int width = subImage.getWidth();
			float factor = (float)height/width;
			if (height>50){
				height=50;
				width=(int)(height/factor);
			}
			
			int type = subImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : subImage.getType();
			BufferedImage resizeImage = resizeImageWithMortennobel(subImage, type, width, height);
			filename = f.getName();
			f = new File(path+fname+"-ico.jpg");			
			ImageIO.write(resizeImage, "jpg", f);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	public Picture createIconoImg(File f){
		Picture picture = new Picture();
		try{
			BufferedImage originalImage = ImageIO.read(f);
			int height= originalImage.getHeight();
			int width = originalImage.getWidth();
			float factor = (float)height/width;
			if (height>50){
				height=50;
				width=(int)(height/factor);
			}
			int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
			BufferedImage resizeImage = resizeImageWithMortennobel(originalImage, type, width, height);
			String filename = f.getName();
			String path = f.getAbsolutePath();
			path = path.substring(0, path.indexOf(filename));
			String fname = filename.substring(0,filename.lastIndexOf("."));
			String extension = filename.substring(filename.lastIndexOf("."));
			f = new File(path+fname+"-ico.jpg");			
			ImageIO.write(resizeImage, "jpg", f);
			picture.setFile(f.getName());
			picture.setWidth(width);
			picture.setHeight(height);
		}catch(IOException e){
			e.printStackTrace();
		}
		return picture;			
	}
	
    private static BufferedImage resizeImageWithMortennobel(BufferedImage originalImage, int type, int x, int y){	
		ResampleOp  resampleOp = new ResampleOp (x,y);
		resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Normal);
		BufferedImage rescaledImage = resampleOp.filter(originalImage, null);
		return rescaledImage;
    }	
	
    private static BufferedImage resizeImage(BufferedImage originalImage, int type, int x1, int y1, int width, int height){
	BufferedImage resizedImage = new BufferedImage(width, height, type);
	Graphics2D g = resizedImage.createGraphics();
	g.drawImage(originalImage, x1, y1, width, height, null);
	g.dispose();
 	return resizedImage;
    }
    
    
    private static BufferedImage resizeImageWithHint(BufferedImage originalImage, int type, int width, int height){
 
	BufferedImage resizedImage = new BufferedImage(width, height, type);
	Graphics2D g = resizedImage.createGraphics();
	g.drawImage(originalImage, 0, 0, width, height, null);
	g.dispose();	
	g.setComposite(AlphaComposite.Src);
	
	g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
	RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	g.setRenderingHint(RenderingHints.KEY_RENDERING,
	RenderingHints.VALUE_RENDER_QUALITY);
	g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
	RenderingHints.VALUE_ANTIALIAS_ON);
 
	return resizedImage;
    }	
}