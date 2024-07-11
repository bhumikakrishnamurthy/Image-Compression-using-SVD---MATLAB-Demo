  Image-Compression-using-SVD---MATLAB-Demo

This MATLAB script demonstrates image compression using Singular Value Decomposition (SVD). It reads an image file, decomposes it into its RGB color channels, compresses each channel by truncating singular values, and then reconstructs the compressed image.



Usage
    Clone Repository:
      
                git clone https://github.com/your-username/your-repository.git

  Run MATLAB Script:
            Open MATLAB.
            Navigate to the directory where Math_Image.m is located.
            Run the script by typing Math_Image in the MATLAB command window.

   Project Overview
                 Input Image:
                                 The script reads an example image (ImageProcessed.png) for demonstration.
                                 You can replace yeno2.png with your own image file by modifying the openImage function call.
                Parameters:
                                  imageWidth and imageHeight define the dimensions of the image.
                                  singularValuesLimit determines the number of singular values retained during compression.
                Compression Process:
                       Step 1: Reading the Image
                                 Uses openImage function to read and load the image into MATLAB.
                       Step 2: Compression
                                 Decomposes each color channel (Red, Green, Blue) using SVD.
                                 Truncates singular values beyond singularValuesLimit to compress the data.
                                 Reconstructs the compressed image using the retained singular values.
                       Step 3: Display and Metrics
                                  Displays the original and compressed images using MATLAB's imshow.
                                  Calculates and prints the original size, compressed size, compression ratio, and other metrics.
                            
   Example Output
              Original Image:Original_Image.png
              Compressed Image:Compressed_Image.png


   Notes
         Ensure MATLAB is installed and accessible from your command line or IDE.
         Adjust imageWidth, imageHeight, and singularValuesLimit as needed for your specific image and compression requirements.

