

# High-pass-FIR-16-TAP-implementation-using-VHDL

This project implements a 16-tap High Pass FIR filter (and its transposed form) using VHDL. First, we design the filter with Matlab.

![image](https://github.com/user-attachments/assets/76f462a9-f5ef-4c1e-8991-a889306366d0)

## Table of Contents
- [Direct Form of FIR Filter Implementation](#direct-form-of-fir-filter-implementation)
  - [Theoretical Filter Designing](#theoretical-filter-designing)
  - [Implementation with VHDL](#implementation-with-vhdl)
  - [Empirical Results](#empirical-results)
- [Transpose Form of FIR Filter](#transpose-form-of-fir-filter)
  - [Theoretical Filter Designing](#theoretical-filter-designing-1)
  - [Implementation with VHDL](#implementation-with-vhdl-1)
  - [Empirical Results](#empirical-results-1)
- [Maximum Frequency Comparison between Two Methods](#maximum-frequency-comparison-between-two-methods)

## Direct Form of FIR Filter Implementation

### Theoretical Filter Designing
The direct form FIR filter design involves multiplying filter coefficients by the input signal and summing the results. The filter is designed to pass frequencies above 70 Hz, with a stop frequency of 45 Hz and a pass frequency of 60 Hz, sampled at 500 Hz.

### Implementation with VHDL
The VHDL implementation uses 8-bit input data and produces a 22-bit output. Due to the antisymmetric properties of the FIR filter coefficients, only half of the coefficients are calculated, optimizing the design.

### Empirical Results
The empirical results, saved in `output.txt`, match the theoretical design, demonstrating effective high-frequency filtering as shown in the FFT analysis.


![image](https://github.com/user-attachments/assets/2ce95550-5a82-4d8d-aa05-4dc10b068695)


## Transpose Form of FIR Filter

### Theoretical Filter Designing
The transposed form of the FIR filter involves reversing the order of input and output compared to the direct form.

### Implementation with VHDL
In the VHDL implementation, the input data remains 8-bit, but the output is expanded to 33-bit due to additional bit generation in each step of the summation.

### Empirical Results
The empirical results for the transposed form, analyzed using MATLAB, show a similar high-pass filtering performance with slight differences compared to the direct form.

## Maximum Frequency Comparison between Two Methods
The maximum frequency for the transposed FIR filter implementation is 327.04 MHz, indicating a higher speed compared to the direct form. This demonstrates the efficiency gain by using the transposed method for FIR filter implementation.
![image](https://github.com/user-attachments/assets/ab6736c0-e613-4a23-9296-7db9efd3e095)

## 👩‍🏫 About the Instructor

I am Mehran Tamjidi, a passionate educator and researcher in the field of machine learning and artificial intelligence. This repository is a part of my efforts to provide comprehensive and practical knowledge to students and enthusiasts.

## 📫 Contact

Feel free to reach out if you have any questions or suggestions:
- **Email**: mehrant.0611@gmail.com
- **GitHub**: [shining0611armor](https://github.com/shining0611armor)

## 📝 License

This project is licensed under the MIT License. See the LICENSE file for details.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Happy Learning! 😊
