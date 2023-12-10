Andrew S. Messecar, 2023

This Lua script was developed to facilitate the batch processing of large amounts of Raman spectra acquired of molybdenum disulfide (MoS2) samples through the Fityk open-source peak fitting software. The script does not require the installation of LuaRocks or any additional Lua packages, but it does require both Lua 5 and Fityk to be locally installed.

Before the script can be used, it needs to be edited to designate (1) the local directory in which the .txt spectra files to be processed are currently located and (2) the file path (including the name) of the Tab-Separated Value (TSV) file where the user desires the output of the fitting process to be written.

With the above two modifications made, the script can be used by opening a terminal, changing the directory to the folder where the script is currently saved, and executing the command "cfityk Fityk_MoS2_Raman_Spectra_Batch_Analysis.lua". The script will execute via Fityk in "headless" mode in the terminal window.

The program currently initializes and then fits a linear background as well as three (3) Lorentzian profiles to the portion of the Raman spectra located between 370 and 430 inverse centimeters. By modifying the script, this specified active area can be altered or removed entirely. Additionally, the number and nature of the peak profiles to be fit to the data can be changed. These modifications can allow this script to be used to batch process spectral data characteristic of additional systems of interest to the user.

Reference

Wojdyr, M. (2010). Fityk: a general-purpose peak fitting program. J. Appl. Cryst. 43, 1126-1128. https://doi.org/10.1107/S0021889810030499
