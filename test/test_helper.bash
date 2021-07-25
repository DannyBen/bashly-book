header() {
  green "\n===> $@"
}

error() {
  red "\n===> $@"
}

red() { printf "\e[31m%b\e[0m\n" "$*"; }
green() { printf "\e[32m%b\e[0m\n" "$*"; }
