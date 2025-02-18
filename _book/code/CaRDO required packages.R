# Authors: James Retell, Sean Fracnis, James Rene & Peter Baade
# Date: 02/2025
# Description: This script installs and loads a small number of R packages necessary to run CaRDO  

# Instructions:
# Highlight the code below (Ctrl + A) and run it by press the run button in the top right,
# or by pressing Ctrl + Enter. 

# CaRDO available here - {github link}

#------------------------------------------------------------------------------#
# This function checks for, installs and loads packages required for CaRDO.
check_install_load <- function(package_name, github_repo = NULL) {
  # Check if the package is installed
  if (!requireNamespace(package_name, quietly = TRUE)) {
    # Install the package if not already installed
    if (!is.null(github_repo)) {
      # Ensure devtools is installed
      if (!requireNamespace("devtools", quietly = TRUE)) {
        install.packages("devtools", dependencies = TRUE)
      }
      # Install the package from GitHub
      devtools::install_github(github_repo)
    } else {
      # Install the package from CRAN
      install.packages(package_name, dependencies = TRUE)
    }
    # Re-check if the installation was successful
    if (!requireNamespace(package_name, quietly = TRUE)) {
      stop(paste("Failed to install package:", package_name))
    }
  }
  # Load the package
  library(package_name, character.only = TRUE, quietly = TRUE)
  message(paste("Library", package_name, "is now loaded"))
}

#------------------------------------------------------------------------------#
# Checks for an installation of DevTools - required for compiling CaRDO from GitHub
check_install_load("devtools")

# Check for an installation of Tidyverse - data handling
check_install_load("tidyverse")

# Check for an installation of Plotly - figures
check_install_load("plotly")

# Check for an installation of markdown - methods
check_install_load("markdown")

