#!/bin/zsh
# by Feng Zhu (fengzhu@ucar.edu)

# Define color codes
RESET='\033[0m'      # Reset color
GREEN='\033[1;32m'   # Success (Green)
YELLOW='\033[1;33m'  # Warning (Yellow)
RED='\033[1;31m'     # Error (Red)
BLUE='\033[1;34m'    # Hint (Blue)

# Print success message (Green)
print_success() {
  echo -e "${GREEN}$@${RESET}"
}

# Print warning message (Yellow)
print_warning() {
  echo -e "${YELLOW}$@${RESET}"
}

# Print error message (Red)
print_error() {
  echo -e "${RED}$@${RESET}"
}

# Print hint message (Blue)
print_hint() {
  echo -e "${BLUE}$@${RESET}"
}