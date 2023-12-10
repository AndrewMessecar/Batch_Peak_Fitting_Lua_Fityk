-- Andrew S. Messecar, 2023

function Import_and_Fit_Spectra_From_Folder( Folder_Directory , File_Path )

   local p = io.popen('find "' .. Folder_Directory .. '" -type f')  --Open directory look for files, save data in p. By giving '-type f' as parameter, it returns all files.     
   for file in p:lines() do                         --Loop through all files
      -- print(file)
      F:execute("@0 < " .. file) -- Imports a single spectrum into Fityk.
      F:execute("@0: info title >> " .. File_Path) -- Writes the name of the file to the output Tab-Separated Value (TSV) file.
      F:execute("@0: guess Linear; fit") -- Initializes and fits a linear background to the imported spectrum.
      F:execute("@0: A = x > 370 and x < 430") -- Designates the active area for peak fitting to be between 370 and 430 inverse centimeters (cm^-1)
      F:execute("@0: delete(not a)") -- Deletes the inactive area of the spectrum where peaks are not being fitted.
      F:execute("@0: guess Lorentzian") -- Initializes three Lorentzian profiles within the active area.
      F:execute("@0: guess Lorentzian")
      F:execute("@0: guess Lorentzian")
      F:execute("@0: fit") -- Fits the three Lorentzian profiles and linear background to the active area.
      F:execute("@0: info peaks >> " .. File_Path) -- Writes parameters of the fitted linear background and three Lorentzian profiles to the output.
      F:execute("delete @0") -- Deletes the spectrum and its fitted features before reiterating the loop and loading the next spectrum.
   end
end

Folder_Path = --File path to local directory where the spectra .txt files of interest are stored.

Output_File = --Complete file path including the name of the Tab-Separated Value (.tsv) file where the output of the Fityk batch processing will be written.

Import_and_Fit_Spectra_From_Folder( Folder_Path , Output_File )

print("Batch Processing Is Now Complete")

