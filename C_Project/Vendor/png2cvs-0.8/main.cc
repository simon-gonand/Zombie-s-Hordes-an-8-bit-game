/*
  (c) 2005-2007 Philipp Klaus Krause philipp@colecovision.eu

  This program is free software; you can redistribute it and/or modify it
  under the terms of the GNU General Public License as published by the
  Free Software Foundation; either version 2, or (at your option) any
  later version.
   
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
   
  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

*/

#include <iostream>
#include <string>
#include <fstream>
#include <map>
#include <set>
#include <utility>

#include <stdlib.h>
#include <math.h>

#include <png.h>

void usage(void)
{
  std::cerr
		<< '\n' << PACKAGE << ' ' << PACKAGE_VERSION << " (c) 2003-2016 Philipp Klaus Krause " << PACKAGE_BUGREPORT
		<< "\nCreates ColecoVision sprite data from .png image files."
		<< "\nUsage: png2cvs [--xoffset x ] [--yoffset y] [--outfile file] [--verbose] [--big] [--binary] file\n"
		<< "\n--xoffset and --yoffset give an offset into the image file."
		<< "\n--big: Create 16x16 sprites instead of 8x8."
		<< "\n--outfile: Specify output file."
		<< "\n--verbose: Verbose output."
		<< "\n--binary: Output binary file instead of C source.\n";
}

int main(int argc, char **argv)
{
	std::string ifile, ofile;
	int xoffset = 0, yoffset = 0;
	bool verbose = false;
	bool big = false;
	bool binary = false;
	unsigned int i;

	if(argc == 1)
	{
		std::cerr << "Too few arguments.\n";
		usage();
		return(-1);
	}

	for(i = 1; i < argc - 1; i++)
	{
		std::string stra = argv[i];
		if(stra == "--xoffset") xoffset = atoi(argv[++i]);
		else if(stra == "--yoffset") yoffset = atoi(argv[++i]);
		else if(stra == "--verbose") verbose = true;
		else if(stra == "--big") big = true;
		else if(stra == "--binary") binary = true;
		else if(stra == "--outfile") ofile = argv[++i];
		else
		{
			usage();
			return(-1);
		}
	}
	
	 ifile = argv[argc - 1];

	if(ofile == "")
	{
		ofile = ifile;
		ofile += ".sprite";
		if(!binary)
			ofile += ".c";
	}

	  FILE *image_file;
  unsigned char signature[8]; // PNG signature
  png_structp  png_ptr;
  png_infop info_ptr;
  png_uint_32 height;
  png_uint_32 width;
  int depth;
  int colortype;
  png_uint_32	i_png, rowbytes;

  if(!(image_file = fopen(ifile.c_str(), "rb")))
  {
    std::cerr << "Error: Could not open input file " << ifile << "\n";
    usage();
    return(-1);
  }
  if(fread(signature, 1, 8, image_file) < 8)
  {
    std::cerr << "Invalid file: " << ifile << "\n";
    usage();
    return(-1);
  }
  if(!png_check_sig(signature, 8))
  {
    std::cerr << "Not a PNG image file: " << ifile << "\n";
    usage();
    return(-1);
  }

  // initialize libpng
  png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, 0, 0, 0);
  if(!png_ptr)
  {
    std::cerr << "Out of memory.\n";
    return(-1);
  }
  info_ptr = png_create_info_struct(png_ptr);
  if(!info_ptr)
  {
    png_destroy_read_struct(&png_ptr, 0, 0);
    std::cerr << "Out of memory.\n";
    return(-1);
  }

  if(setjmp(png_jmpbuf(png_ptr)))
  {
    png_destroy_read_struct(&png_ptr, &info_ptr, 0);
    std::cerr << "libpng error.\n";
    return(-1);
  }


  png_init_io(png_ptr, image_file);
  png_set_sig_bytes(png_ptr, 8);
  png_read_info(png_ptr, info_ptr);
  png_get_IHDR(png_ptr, info_ptr, &width, &height, &depth, &colortype, 0, 0, 0);

  // Convert everything to RGB or RGBA.
  if(colortype == PNG_COLOR_TYPE_PALETTE) png_set_palette_to_rgb(png_ptr);  // Convert indexed to RGB
  if(colortype == PNG_COLOR_TYPE_GRAY && depth < 8) png_set_expand_gray_1_2_4_to_8(png_ptr); // Convert 1, 2 and 4 bit greyscale to 8 bit.
  if(png_get_valid(png_ptr, info_ptr, PNG_INFO_tRNS)) png_set_tRNS_to_alpha(png_ptr); // Convert bitmask tranparency to full Alphachannel.
  if(depth == 16) png_set_strip_16(png_ptr);  // Reduce color depth of 48 and 64 bit images.
  if(colortype == PNG_COLOR_TYPE_GRAY || colortype == PNG_COLOR_TYPE_GRAY_ALPHA) png_set_gray_to_rgb(png_ptr);  // Convert greyscale to RGB.
  
  png_read_update_info(png_ptr, info_ptr);

  png_bytep *Zeilenzeiger;
  unsigned char *image_data;
  try
  {
    try
    {
      Zeilenzeiger = new png_bytep[height];
      rowbytes = png_get_rowbytes(png_ptr, info_ptr);    
      try
      {
        image_data = new unsigned char[rowbytes * height];
      }
      catch(...)
      {
        delete[] Zeilenzeiger;
        throw;
      }
    }
    catch(...)
    {
      png_destroy_read_struct(&png_ptr, &info_ptr, 0);
      throw;
    }
  }
  catch(std::bad_alloc)
  {
    std::cerr << "Out of memory.";
    return(-1);
  }
  catch(...)
  {
    std::cerr << "Unknown error";
    return(-1);
  }

  for(i_png = 0; i_png < height; ++i_png) Zeilenzeiger[i_png] = image_data + i_png * rowbytes;
  png_read_image(png_ptr, Zeilenzeiger);
  png_read_end(png_ptr, 0);
  fclose(image_file);
  delete[] Zeilenzeiger;

  if(png_ptr && info_ptr)
  {
    png_destroy_read_struct(&png_ptr, &info_ptr, 0);
    png_ptr = 0; info_ptr = 0;
  }

  if(big ? ((width % 16) || (height % 16)) : ((width % 8) || (height % 8)))
  {
    delete[] image_data;
    std::cerr << "Width and height must be multiples of " << (big ? "16" : "8");
		std::cerr << ".\n";
    return(-1);
  }
	
	std::ofstream spriteo;
	spriteo.open(ofile.c_str(), std::ios::out | std::ios::trunc);
	if(!binary)
	{
		spriteo << "#include <stdint.h>\n";
		spriteo << std::hex << std::showbase;
	}

	const double cvcols[15][3] = {{0.0, 0.0, 0.0}, {1.0, 6.0, 1.0}, {3.0, 7.0, 3.0}, {1.0, 1.0, 7.0}, {2.0, 3.0, 7.0}, {5.0, 1.0, 1.0}, {2.0, 6.0, 7.0}, {7.0, 1.0, 1.0}, {7.0, 3.0, 3.0}, {6.0, 6.0, 1.0}, {6.0, 6.0, 4.0}, {1.0, 4.0, 1.0}, {6.0, 2.0, 5.0}, {5.0, 5.0, 5.0}, {7.0, 7.0, 7.0}};
	
	std::map<int, std::set<std::pair<int, int> > > colors;
	bool alpha = (colortype == PNG_COLOR_TYPE_RGBA || colortype == PNG_COLOR_TYPE_GRAY_ALPHA);
	int x, y;
	for(x = xoffset; x < xoffset + (big ? 16 : 8); x++)
		for(y = yoffset; y < yoffset + (big ? 16 : 8); y++)
		{
			if(alpha && (image_data[(y * width + x) * (alpha ? 4 : 3) + 3] < 128))
			{
				colors[0].insert(std::pair<int, int>(x, y));
				continue;
			}
			double dist = 42.0;
			int color = 0;
			for(i = 0; i < 15; i++)
			{
				double cdist = 0.0;
				cdist += fabs(cvcols[i][0] - double(image_data[(y * width + x) * (alpha ? 4 : 3) + 0]) / 36.0);
				cdist += fabs(cvcols[i][1] - double(image_data[(y * width + x) * (alpha ? 4 : 3) + 1]) / 36.0);
				cdist += fabs(cvcols[i][2] - double(image_data[(y * width + x) * (alpha ? 4 : 3) + 2]) / 36.0);
				if(cdist < dist)
				{
					dist = cdist;
					color = i + 1;
				}
			}
			colors[color].insert(std::pair<int, int>(x - xoffset, y - yoffset));
		}
	std::map<int, std::set<std::pair<int, int> > >::iterator ci;
	bool sprite[colors.size() - 1][16][16];
	for(i = 0; i < colors.size() - 1; i++)
		for(unsigned int j = 0; j < 16; j++)
			for(unsigned int k = 0; k < 16; k++)
				sprite[i][j][k] = false;
	for(ci = colors.begin(), i = 0; ci != colors.end(); ++ci, ++i)
	{
		std::set<std::pair<int, int> >::iterator pi;
		if(ci->first == 0)
			continue;
		if(verbose)
			std::cout << "Using Colecovision color " << ci->first << ".\n";
		for(pi = ci->second.begin(); pi != ci->second.end(); ++pi)
			sprite[i - 1][pi->first][pi->second] = true;
	}
	if(!binary)
		spriteo << "const uint8_t sprite[" << colors.size() - 1<< "][" << (big ? 32 : 8) << "] = {";
	for(ci = colors.begin(), i = 0; ci != colors.end(); ++ci, ++i)
	{
		if(ci->first == 0)
			continue;
		if(!binary)
			spriteo << "{";
		for(unsigned int j = 0; j < 8; j++)
		{
			int row = 0;
			for(unsigned int k = 0; k < 8; k++)
				if(sprite[i - 1][k][j])
					row |= (1 << (7 - k));
			if(!binary)
			{
				spriteo << row;
				if(j != 7)
					spriteo << ", ";
			 }
			else
				spriteo.put(row);
		}
		if(big)
		{
			if(!binary)
				spriteo << ", ";
			for(unsigned int j = 8; j < 16; j++)
			{
				int row = 0;
				for(unsigned int k = 0; k < 8; k++)
					if(sprite[i - 1][k][j])
						row |= (1 << (7 - k));
				if(!binary)
				{
					spriteo << row;
					spriteo << ", ";
				}
				else
					spriteo.put(row);
			}
			for(unsigned int j = 0; j < 8; j++)
			{
				int row = 0;
				for(unsigned int k = 0; k < 8; k++)
					if(sprite[i - 1][k + 8][j])
						row |= (1 << (7 - k));
				if(!binary)
				{
					spriteo << row;
					spriteo << ", ";
				}
				else
					spriteo.put(row);
			}
			for(unsigned int j = 8; j < 16; j++)
			{
				int row = 0;
				for(unsigned int k = 0; k < 8; k++)
					if(sprite[i - 1][k + 8][j])
						row |= (1 << (7 - k));
				if(!binary)
				{
					spriteo << row;
					if(j != 15)
						spriteo << ", ";
				}
				else
					spriteo.put(row);
			}
		}
		if(!binary)
		{
			spriteo << "}";
			if(i < colors.size() - 1)
				spriteo << ", ";
		}
	}
	if(!binary)
		spriteo << "};\n";
}
