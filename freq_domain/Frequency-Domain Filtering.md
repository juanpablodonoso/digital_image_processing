# FREQUENCY-DOMAIN FILTERING

[TOC]



## NOTES

* The mathematical foundation of frequency-domain techniques is the [convolution theorem](https://en.wikipedia.org/wiki/Convolution_theorem) to apply a filter to an original image in the frequency-domain 

### Fourier Transform 

* The main mathematical tool used to obtain the 2D frequency domain of a digital image is [Fourier Transform](http://cns-alumni.bu.edu/~slehar/fourier/fourier.html)
* The resulting image is in Fourier domain (frequency -domain) from spacial domain 
* 2D Fourier Transform is implemented by function `fft2` in MATLAB 
* `fftshow` to vie the results of `fft2`

### Low-pass filters

* Attenuate hight-frequency components of the Fourier Transform 
* Leave the low-frequency unchanged
* **Effect**: Controled degree of blurring

### High-pass filters

* Attenuate low-frequency components of Fourier Transform
* Enhancing hight-frequency or leave them unchange)
* **Effect**: Controled degree of sharpening

### About filters

* **Ideal Filters** - sharp transition from passband to stopban 
* **Gaussian filters** - smooth transition from passband to stopband
* **Butterworth filters** - allow  to choose their order (shape of the transition) and control how close to an ideal filter the should be. 

 

## FOURIER TRANSFORM 

### Fourier Transform MATLAB 

## LOW-PASS FILTERING

### Ideal LPF MATLAB 

### Gaussian LPF MATLAB 





### Hight-passl 

- Attenuate the low-frequency components of the Fourier Transform of an image
- Enhancing hight-frequency components or leaving them unchanged
- Overall effect : 



$$
H_h(u,v) = a+bH(u,v)
$$
