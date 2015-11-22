/*
	This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

	N.B.  the above text was copied from http://www.gnu.org/licenses/gpl.html
	unmodified. I have not attached a copy of the GNU license to the source...

    Copyright (C) 2012 Timo Rantalainen
*/
/*
	Direct linear transformation (DLT) sample, written by Timo Rantalainen tjrantal@gmail.com.
	Depends on Jama library http://math.nist.gov/javanumerics/jama/
	compile javac Sample3D.java
	execute java Sample3D
*/

package timo.home;

import Jama.*;
import timo.home.dlt.*;
import timo.home.imagePanel.*;
import timo.home.utils.*;

import java.util.Vector;
import java.awt.*;
import java.awt.image.*;
import java.io.*;
import javax.imageio.*;
import javax.swing.*;

public class Sample3D extends JFrame{
	/*Constructor*/
	public Sample3D(String title){
		super(title);
		setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		//Read digitized data
		CSVReader[] cr = new CSVReader[2];
	 	cr[0] = new CSVReader("octaveTest/GoPro0093.xls","\t");
		cr[1] = new CSVReader("octaveTest/GoPro0099.xls","\t");
		//Add images
		JComponent cp = new JPanel();
		ImagePanel[] ip = new ImagePanel[2];
		ip[0] = loadImage("octaveTest/GOPR0093.JPG");
		ip[1] = loadImage("octaveTest/GOPR0099.JPG");
		for (int i =0;i<ip.length;++i){
			ip[i].plotCoordinates(getCoords(cr[i]));
			cp.add(ip[i]);
		}
		cp.setOpaque(true); // must be opaque	
		setContentPane(cp);
		pack();
	        setVisible(true);
	}

	private double[][] getCoords(CSVReader cr){
		double[][] temp = new double[cr.data.size()-1][2];
		for (int i = 1; i< cr.data.size();++i){
			for (int j = 1; j< cr.data.get(i).size();++j){
				temp[i-1][j-1] = Double.parseDouble(cr.data.get(i).get(j));
			}
		}
		return temp;
	} 
	private ImagePanel loadImage(String fileName){
		BufferedImage img = null;
		try {
		    img = ImageIO.read(new File(fileName));
		} catch (IOException e) {System.out.println("Couldn't read image");}
		ImagePanel photo = new ImagePanel(img);
		photo.setOpaque(true);
		return photo;
	}
	/*Main to get things going*/	
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Runnable(){
      			public void run(){
        			Sample3D mainClass = new Sample3D("Sample 3d");
        		}
    		});
  	}
	
}