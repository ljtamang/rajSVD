# rajSVD
Given few set of images, this project intelligently generates entirely new possible images using  [Reduced Singular Value Decomposition(SVD)](https://github.com/ljtamang/rajSVD/blob/master/reduced_SVD_slide.pdf). The code implementation is in matlab.

**Keywords :** *Singular Value Decomposition (SVD), Matlab*

## Practical use case
**Input:** Hey program, last night somebody broke into store A. We have image of person with mask from CCTV camera. In the morning, we have got a suspect in our custody and here is his image. Now, can you please say if these two images are of the same person or not?

**Output:** yes/no.

## Approach
For the purpose of simplicity, I will just use 3 images and gray scale images.

  1.	Given image I1, I2 and I3, create data matrix **A** where each column of represents single image data.
  2.	Apply reduced singular value decomposition(SVD) to obtain basis **U** that spans the data of image.
  3.	Randomly generate coefficients c1, c2 and c3. Create new linear combination **L = c1 * m1 + c2 * u2 + c3 * u3**, where         u1, u2 and u3 are column of U. The L is the new image data.
  4.	You can create any number of possible images by repeating process 3.

## Files
matlab.m  is the Source code implemeantion.
image1.jpg, image2.jpg, image3.jpg  are input images under different light illuminations.
simulated_image1.jpg, simulated_image2.jpg,….simulated_image6.jpg are output images of the program.
reduced_svd.pdf is [slide with SVD algorithm](https://github.com/ljtamang/rajSVD/blob/master/reduced_SVD_slide.pdf).

**Acknowledgements**
Ths project is named **rajSVD** to reconize by eldest brother Raj Kumar Lama who supported me in all possible way for my study and SVD algorithm being heart of this implementaion. I would also acknowledge [Dr. Madhusudhanan Balasubramanian](https://www.computationalocularscience.com/members/), The University of memphis, who made me this algorithm crystal clear.

