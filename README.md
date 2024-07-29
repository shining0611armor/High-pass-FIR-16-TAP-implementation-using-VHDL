
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>High Pass FIR (16 TAP) Implementation using VHDL</title>
</head>
<body>
    <h1>High Pass FIR (16 TAP) Implementation using VHDL</h1>

    <h2>Table of Contents</h2>
    <ul>
        <li><a href="#direct-form-of-fir-filter-implementation">Direct Form of FIR Filter Implementation</a>
            <ul>
                <li><a href="#theoretical-filter-designing">Theoretical Filter Designing</a></li>
                <li><a href="#implementation-with-vhdl">Implementation with VHDL</a></li>
                <li><a href="#empirical-results">Empirical Results</a></li>
            </ul>
        </li>
        <li><a href="#transpose-form-of-fir-filter">Transpose Form of FIR Filter</a>
            <ul>
                <li><a href="#theoretical-filter-designing-1">Theoretical Filter Designing</a></li>
                <li><a href="#implementation-with-vhdl-1">Implementation with VHDL</a></li>
                <li><a href="#empirical-results-1">Empirical Results</a></li>
            </ul>
        </li>
        <li><a href="#maximum-frequency-comparison-between-two-methods">Maximum Frequency Comparison between Two Methods</a></li>
    </ul>

    <h2 id="direct-form-of-fir-filter-implementation">Direct Form of FIR Filter Implementation</h2>

    <h3 id="theoretical-filter-designing">Theoretical Filter Designing</h3>
    <p>The direct form FIR filter design involves multiplying filter coefficients by the input signal and summing the results. The filter is designed to pass frequencies above 70 Hz, with a stop frequency of 45 Hz and a pass frequency of 60 Hz, sampled at 500 Hz.</p>

    <h3 id="implementation-with-vhdl">Implementation with VHDL</h3>
    <p>The VHDL implementation uses 8-bit input data and produces a 22-bit output. Due to the antisymmetric properties of the FIR filter coefficients, only half of the coefficients are calculated, optimizing the design.</p>

    <h3 id="empirical-results">Empirical Results</h3>
    <p>The empirical results, saved in <code>output.txt</code>, match the theoretical design, demonstrating effective high-frequency filtering as shown in the FFT analysis.</p>

    <h2 id="transpose-form-of-fir-filter">Transpose Form of FIR Filter</h2>

    <h3 id="theoretical-filter-designing-1">Theoretical Filter Designing</h3>
    <p>The transposed form of the FIR filter involves reversing the order of input and output compared to the direct form.</p>

    <h3 id="implementation-with-vhdl-1">Implementation with VHDL</h3>
    <p>In the VHDL implementation, the input data remains 8-bit, but the output is expanded to 33-bit due to additional bit generation in each step of the summation.</p>

    <h3 id="empirical-results-1">Empirical Results</h3>
    <p>The empirical results for the transposed form, analyzed using MATLAB, show a similar high-pass filtering performance with slight differences compared to the direct form.</p>

    <h2 id="maximum-frequency-comparison-between-two-methods">Maximum Frequency Comparison between Two Methods</h2>
    <p>The maximum frequency for the transposed FIR filter implementation is 327.04 MHz, indicating a higher speed compared to the direct form. This demonstrates the efficiency gain by using the transposed method for FIR filter implementation.</p>
</body>
</html>


# High-pass-FIR-16-TAP-implementation-using-VHDL
This project implements a 16-tap High Pass FIR filter (and it's transposed) using VHDL. First we design the filter with Matlab.

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
