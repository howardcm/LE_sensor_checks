# run-current-data.R
# Ask the user where the Dropbox folder is and run the qmd file
# If on GitHub Actions, use the testing folder
# BBL September 2025

library(quarto)

if(Sys.getenv("CI") == "") {
  # Normal usage
    message("Please select any file in Dropbox top level")
    DROPBOX <- dirname(file.choose())
    SITES <- readline("Sites to plot:") # Enter LE or DLG
} else {
  # Running on GitHub Actions
  message("Running on GitHub Actions!")
  DROPBOX <- "./testing/"
  SITES <- "TESTING"
}

system.time({quarto_render("current-data-rbp.qmd", 
              execute_params = list(DROPBOX = DROPBOX, SITES = SITES))})
                                                        
message("All done")


#current-data-rbp/LE-20250904 
#after running LE save it in LE-checks
#after running DLG save it in DLG-checks
 
