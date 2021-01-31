/*
  (c) 2003-2010 Philipp Klaus Krause philipp@colecovision.eu, pkk@spth.de.

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

#include <string>
#include <iostream>
#include <fstream>
#include <utility>
#include <math.h>
#include <sys/types.h>
#include <stdint.h>
#include <string.h>
#include <png.h>

double palette[16][4] = {{0, 0, 0, 0}, {0, 0, 0, 7}, {1, 6, 1, 7}, {3, 7, 3, 7}, {1, 1, 7, 7}, {2, 3, 7, 7}, {5, 1, 1, 7}, {2, 6, 7, 7}, {7, 1, 1, 7}, {7, 3, 3, 7}, {6, 6, 1, 7}, {6, 6, 4, 7}, {1, 4, 1, 7}, {6, 2, 5, 7}, {5, 5, 5, 7}, {7, 7, 7, 7}}; // Colecovision RGBA palette.

class output
{
public:
	output(std::ostream& o);
	~output(void);
	void set_binary(bool b);
	void set_name(const std::string& n);
	void write(uint8_t b);
private:
	std::ostream *out;
	bool binary;
	std::string name;
	bool started;
};

output::output(std::ostream& o)
{
	out = &o;
	binary = false;
	name = "data";
	started = false;
}

output::~output(void)
{
	if(!binary)
		(*out) << "};\n";
}

void output::set_binary(bool b)
{
	binary = b;
}

void output::set_name(const std::string& n)
{
	name = n;
}

void output::write(uint8_t b)
{
	if(!started)
	{
		if(!binary)
		{
			(*out) << "const unsigned char " << name << "[] = {";
			out->setf(std::ios_base::hex, std::ios_base::basefield);
			out->setf(std::ios_base::showbase);
		}
		
	}

	if(!binary)
	{	
		if(started)
			(*out) << ", ";
		(*out) << int(b);
	}
	else
		out->put(b);

	started = true;
}

// Convert 8 RGB pixels (one row of character).
inline void rgba2sms(const void *in, u_int8_t *pattern)
{
	double row[8][4];
	unsigned int matches[8];

	for(unsigned int i = 0; i < 8; i++)  // Conversion to 9 bit color.
	{
		row[i][0] = double(((u_int8_t *)in)[i * 4 + 0]) / 36.43;
		row[i][1] = double(((u_int8_t *)in)[i * 4 + 1]) / 36.43;
		row[i][2] = double(((u_int8_t *)in)[i * 4 + 2]) / 36.43;
		row[i][3] = double(((u_int8_t *)in)[i * 4 + 3]) / 36.43;
	}

	// Find best-matchig color in palette for each pixel in row.
	for(unsigned int k = 0; k < 8; k++)
	{
		double dists[16];

		for(unsigned int i = 0; i < 16; i++)
		{
			dists[i] = 0;
			dists[i] += fabs(palette[i][0] - row[k][0]);
			dists[i] += fabs(palette[i][1] - row[k][1]);
			dists[i] += fabs(palette[i][2] - row[k][2]);
			dists[i] += fabs(palette[i][3] - row[k][3]) * 8.0;
		}

		unsigned int i;
		for(i = 1, matches[k] = 0; i < 16; i++)
			if (dists[i] < dists[matches[k]])
				matches[k] = i;
	}

	memset(pattern, 0, 4);
	for(unsigned int i = 0; i < 4; i++)
		for(unsigned int k = 0; k < 8; k++)
			if(matches[k] & (1 << i))
				pattern[i] |= (1 << ( 7 - k));
}

// Convert 8 RGB pixels (one row of character).
inline void rgb2sms(const void *in, u_int8_t *pattern)
{
	double row[8][3];
	unsigned int matches[8];

	for(unsigned int i = 0; i < 8; i++)  // Conversion to 9 bit color.
	{
		row[i][0] = double(((u_int8_t *)in)[i * 3 + 0]) / 36.43;
		row[i][1] = double(((u_int8_t *)in)[i * 3 + 1]) / 36.43;
		row[i][2] = double(((u_int8_t *)in)[i * 3 + 2]) / 36.43;
	}

	// Find best-matchig color in palette for each pixel in row.
	for(unsigned int k = 0; k < 8; k++)
	{
		double dists[16];

		for(unsigned int i = 1; i < 16; i++)
		{
			dists[i] = 0;
			dists[i] += fabs(palette[i][0] - row[k][0]);
			dists[i] += fabs(palette[i][1] - row[k][1]);
			dists[i] += fabs(palette[i][2] - row[k][2]);
		}

		unsigned int i;
		for(i = 2, matches[k] = 1; i < 16; i++)
			if (dists[i] < dists[matches[k]])
				matches[k] = i;
	}

	memset(pattern, 0, 4);
	for(unsigned int i = 0; i < 4; i++)
		for(unsigned int k = 0; k < 8; k++)
			if(matches[k] & (1 << i))
				pattern[i] |= (1 << ( 7 - k));
}

// Convert 8 RGBA pixels (one row of character).
inline void rgba2cv(const void *in, u_int8_t *pattern, u_int8_t *color)
{
	float row[8][4];
	for(unsigned int i = 0; i < 8; i++)  // Conversion to 9 bit color + 1 bit alpha mask.
	{
		row[i][0] = double(((u_int8_t *)in)[i * 4 + 0]) / 36.43;
		row[i][1] = double(((u_int8_t *)in)[i * 4 + 1]) / 36.43;
		row[i][2] = double(((u_int8_t *)in)[i * 4 + 2]) / 36.43;
		row[i][3] = double(((u_int8_t *)in)[i * 4 + 3]) / 36.43;
	}

	double dist[16][16];

	// Find best two colors
	// Calculate differences
	for(unsigned int i = 0; i < 16; i++)
	{
		for(unsigned int j = 0; j < 16; j++)
		{
			dist[i][j] = 0;
			for(unsigned int k = 0; k < 8; k++)
			{
				if((palette[i][3] != 0) && (palette[j][3] != 0) || (row[k][3] != 0))
				{
					dist[i][j] += std::min(fabs(palette[i][0] - row[k][0]), fabs(palette[j][0] - row[k][0]));
					dist[i][j] += std::min(fabs(palette[i][1] - row[k][1]), fabs(palette[j][1] - row[k][1]));
					dist[i][j] += std::min(fabs(palette[i][2] - row[k][2]), fabs(palette[j][2] - row[k][2]));
				}
				dist[i][j] += std::min(fabs(palette[i][3] - row[k][3]), fabs(palette[j][3] - row[k][3]));
			}
		}
	}

  for(float fd = 0.0f;; fd+= 0.1f)
  {
    for(unsigned int j = 0; j < 16; j++)
      for(unsigned int l = 0; l < 16; l++)
        if(dist[j][l] <= fd)  // Best match
        {
          *color = ((j << 4) + l);
          *pattern = 0;
          for(unsigned int k = 0; k < 8; k++)
          {
            (*pattern) <<= 1;
            double dist1 = 0, dist2 = 0;
            dist1 += fabs(palette[j][0] - row[k][0]);
            dist2 += fabs(palette[l][0] - row[k][0]);
            dist1 += fabs(palette[j][1] - row[k][1]);
            dist2 += fabs(palette[l][1] - row[k][1]);
            dist1 += fabs(palette[j][2] - row[k][2]);
            dist2 += fabs(palette[l][2] - row[k][2]);
			dist1 += fabs(palette[j][2] - row[k][2]) * 8.0;
            dist2 += fabs(palette[l][2] - row[k][2]) * 8.0;
            if(dist1 <= dist2) (*pattern)++;     
          }
          return;
        }
  }
  return;
}

// Convert 8 RGB pixels (one row of character).
inline void rgb2cv(const void *in, u_int8_t *pattern, u_int8_t *color)
{
	static unsigned int oj = 1, ol = 1;	// Try to reuse old color combination to optimize output for compression.
	static u_int8_t opattern;	// Try to reuse old pattern to optimize output for compression.

	unsigned int j, l;
	double row[8][3];
	for(unsigned int i = 0; i < 8; i++)  // Conversion to 9 bit color.
	{
		row[i][0] = double(((u_int8_t *)in)[i * 3 + 0]) / 36.43;
		row[i][1] = double(((u_int8_t *)in)[i * 3 + 1]) / 36.43;
		row[i][2] = double(((u_int8_t *)in)[i * 3 + 2]) / 36.43;
	}

	double dist[16][16];

	// Find best two colors
	// Calculate differences
	for(unsigned int i = 1; i < 16; i++)
		for(j = 1; j < 16; j++)
		{
			dist[i][j] = 0;
			for(unsigned int k = 0; k < 8; k++)
			{
				double d0 = 0.0, d1 = 0.0;
				d0 += fabs(palette[i][0] - row[k][0]);
				d1 += fabs(palette[j][0] - row[k][0]);
				d0 += fabs(palette[i][1] - row[k][1]) * 1.5;
				d1 += fabs(palette[j][1] - row[k][1]) * 1.5;
				d0 += fabs(palette[i][2] - row[k][2]);
				d1 += fabs(palette[j][2] - row[k][2]);
				dist[i][j] += std::min(d0, d1);
			}
		}

	for(float fd = 0;;fd += 0.025f)
	{
		if(dist[oj][ol] <= fd)  // Try old combination first to optimize output for compression.
		{
			j = oj;
			l = ol;
			goto done;
		}

		for(j = 1; j < 16; j++)
			for(l = 1; l < 16; l++)
				if(dist[j][l] <= fd)  // Best match
					goto done;
	}
done:
	*pattern = 0;

	for(unsigned int k = 0; k < 8; k++)
	{
		(*pattern) <<= 1;
		double dist1 = 0.0, dist2 = 0.0;
		dist1 += fabs(palette[j][0] - row[k][0]);
		dist2 += fabs(palette[l][0] - row[k][0]);
		dist1 += fabs(palette[j][1] - row[k][1]);
		dist2 += fabs(palette[l][1] - row[k][1]);
		dist1 += fabs(palette[j][2] - row[k][2]);
		dist2 += fabs(palette[l][2] - row[k][2]);
		if(dist1 <= dist2) (*pattern)++;
	}

	if(*pattern == (uint8_t)(~opattern) && (oj != j || ol != l))
	{
		int tmp;
		*pattern = opattern;
		tmp = j;
		j = l;
		l = tmp;
	}
	*color = (j << 4) + l;
	oj = j;
	ol = l;
	opattern = *pattern;

	return;
}

inline void rgba2bw(const void *in, u_int8_t *pattern)
{
}

inline void rgb2bw(const void *in, u_int8_t *pattern)
{
}

void usage(void)
{
	std::cerr
		<< '\n' << PACKAGE << ' ' << PACKAGE_VERSION << " (c) 2003-2016 Philipp Klaus Krause " << PACKAGE_BUGREPORT
		<< "\nUsage: png2cv [-b][--binary][--monochrome][--verbose] file\n"
		<< "\n-b, --binary: binary output instead of C source."
		<< "\n--bitmap: Generate data for bitmap mode (default)."
		<< "\n--bitmap-text: Generate data for bitmap text mode."
		<< "\n--4: Generate data for mode 4 (SMS)."
		<< "\n--verbose: Verbose output.\n";
	std::cerr << "The --bitmap-text option is currently broken!\n";
}

int main(int argc, char** argv)
{
	std::string ifile, patternofile, colorofile;
	bool binary = false;
	bool color = true;
	bool verbose = false;
	bool mode4 = false;

	int i;

	if(argc == 1)
	{
		std::cerr << "Too few arguments.\n";
		usage();
		return(-1);
	}

  for(i = 1; i < argc - 1; i++)
  {
		std::string stra = argv[i];
		if(stra == "-b")
			binary = true;
		else if(stra == "--binary")
			binary = true;
		else if(stra == "--bitmap")
			color = true;
		else if(stra == "--bitmap-text")
			color = false;
		else if(stra == "--4")
			mode4 = true;
		else if(stra == "--verbose")
			verbose = true;
		else
		{
			usage();
			return(-1);
		}
  }
  
  ifile = argv[argc - 1];

  patternofile = ifile;
  colorofile = ifile;
  if(binary)
  {
    patternofile += mode4 ? ".pattern4.bin" : ".pattern.bin";
    colorofile += ".color.bin"; 
  }
  else
  {
    patternofile += mode4 ? ".pattern4.c" : ".pattern.c";
    colorofile += ".color.c";
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
    std::cerr << "File not found.\n";
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

  if((width % 8) || (height % 8))
  {
    delete[] image_data;
    std::cerr << "Width and height must be multiples of 8.";
    return(-1);
  }

  u_int8_t cvimage[4];
  u_int8_t cvcolor;
  std::ofstream patterno;
  std::ofstream coloro;

  patterno.open(patternofile.c_str(), std::ios::out | std::ios::trunc);
  if(color && !mode4) coloro.open(colorofile.c_str(), std::ios::out | std::ios::trunc);

	output *patternout;
	output *colorout;
	{
		patternout = new output(patterno);
		patternout->set_name("pattern");
		patternout->set_binary(binary);
	}
	if(color && !mode4)
	{
		colorout = new output(coloro);
		colorout->set_name("color");
		colorout->set_binary(binary);
	}
  if(verbose)
  {
    std::cout << "Converting " << width << "x" << height << " " << ((colortype == PNG_COLOR_TYPE_RGBA || colortype == PNG_COLOR_TYPE_GRAY_ALPHA) ? "RGBA" : "RGB") << " image.\n";
    std::cout << "A . for every Colecovision character line written.\n";
    std::cout.flush();
  }
	int j, k;
	for(i = 0; i < int(height) / 8; i++)
		for(j = 0; j < int(width) / 8; j++)
		{
			for(k = 0; k < 8; k++)
			{
				if(mode4)
				{
					if(colortype == PNG_COLOR_TYPE_RGBA || colortype == PNG_COLOR_TYPE_GRAY_ALPHA) // RGBA
						rgba2sms(&(image_data[(i * 8 * width + j * 8 + k * width) * 4]), cvimage);
					else  // RGB
						rgb2sms(&(image_data[(i * 8 * width + j * 8 + k * width) * 3]), cvimage);
				}
				else if(color)
				{
					if(colortype == PNG_COLOR_TYPE_RGBA || colortype == PNG_COLOR_TYPE_GRAY_ALPHA) // RGBA
						rgba2cv(&(image_data[(i * 8 * width + j * 8 + k * width) * 4]), cvimage, &cvcolor);
					else  // RGB
						rgb2cv(&(image_data[(i * 8 * width + j * 8 + k * width) * 3]), cvimage, &cvcolor);
				}
				else
 				{
					if(colortype == PNG_COLOR_TYPE_RGBA || colortype == PNG_COLOR_TYPE_GRAY_ALPHA) // RGBA
						rgba2bw(&(image_data[(i * 8 * width + j * 8 + k * width) * 4]), cvimage);
 					else  // RGB
						rgb2bw(&(image_data[(i * 8 * width + j * 8 + k * width) * 3]), cvimage);
				}

				if(!mode4)
					patternout->write(*cvimage);
				else
					for(int i = 0; i < 4; i++)
						patternout->write(cvimage[i]);

				if(color && !mode4)
					colorout->write(cvcolor);
			}
			if(verbose)
			{
				std::cout << '.';
				std::cout.flush();
			}
		}

	delete patternout;
	if(color && !mode4)
		delete colorout;
	patterno.close();
	if(color && !mode4)
		coloro.close();
	if(verbose) std::cout << "\ndone.\n";

	delete[] image_data;

	return(0);
}

