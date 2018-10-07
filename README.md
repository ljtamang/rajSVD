# rajSVD
Given few set of images, this project intelligently generates entirely new possible images using  [Reduced Singular Value Decomposition(SVD)](https://github.com/ljtamang/rajSVD/blob/master/reduced_SVD_slide.pdf).  The code implementation is in matlab.

## Practical use case
**Input:** Hey software, last night a robbery has occurred at Store A. Luckily we have image of person from video surveillance and unfortunately he has mask on face. In morning, we have a suspect in our custody and here is his image. Can you please verify whether this suspect one wearing mask in surveillance system?

**Output:** (yes/no)

## Approach
For the purpose of simplicity, I will just use 3 images and gray scale images.

  1.	Given image I1, I2 and I3, create data matrix A where each column of represents single image data.
  2.	Apply reduced singular value decomposition(SVD) to obtain basis U that spans the data of image.
  3.	Randomly generate coefficients c1, c2 and c3. Create new linear combination L = c1 * m1 + c2 * u2 + c3 * u3, where u1,         u2 and u3 are column of U. The L is the new image data.
  4.	You can create any number of possible images by repeating process 3.

## Files
**matlab.m :** Source code.

**image1.jpg, image2.jpg, image3.jpg :**  Input images under different light illuminations.
**simulated_image1.jpg, simulated_image2.jpg,….simulated_image6.jpg :** Output images of the program.
**reduced_svd.pdf :**  [Slide with SVD algorithm](https://github.com/ljtamang/rajSVD/blob/master/reduced_SVD_slide.pdf).

