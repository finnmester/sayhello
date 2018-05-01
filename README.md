# R Packages CI Tutorial using diferent CI Platforms (In Progress)

## Travis

[![Build Status](https://travis-ci.org/fmmmendes/sayhello.svg?branch=master)](https://travis-ci.org/fmmmendes/sayhello)

### Travis Configuration File

```ruby
# R for travis: see documentation at https://docs.travis-ci.com/user/languages/r

language: R
sudo: false
cache: packages

r:
- 3.4
- oldrel
- release
- devel

install:
- R -e 'install.packages("devtools");devtools::install_deps(dep = T)'

script:
- R CMD build .
- R CMD check *tar.g

after_success:
  - Rscript -e 'covr::codecov()'

```

## Codeship

[ ![Codeship Status for finnmester/sayhello](https://app.codeship.com/projects/00890440-2c9f-0136-d6ba-469aefd80fef/status?branch=master)](https://app.codeship.com/projects/288041)

### Setup

```sh
R_VERSION=${R_VERSION:="3.4.1"}
R_PATH=${R_PATH:=$HOME/r}
CACHED_DOWNLOAD="${HOME}/cache/R-${R_VERSION}.tar.gz"
mkdir -p "${R_PATH}"
wget --continue --output-document "${CACHED_DOWNLOAD}" "https://cran.r-project.org/src/base/R-${R_VERSION%%.*}/R-${R_VERSION}.tar.gz"
tar -xaf "${CACHED_DOWNLOAD}" --strip-components=1 --directory "${R_PATH}"
export PATH="${R_PATH}/bin:${PATH}"
cd "${R_PATH}" || exit 1
./configure
make
# check the correct version is used
R --version | grep "${R_VERSION}"
printenv
R -e 'install.packages("devtools",repos = "https://cloud.r-project.org/")'
R -e 'install.packages("roxygen2",repos = "https://cloud.r-project.org/")'
```

### Test (using Devtools)

```sh
cd $HOME/clone
Rscript cs_check.R
```


# References

[https://www.ildiczeller.com/2017/09/17/r-pkg-check-with-docker-on-codeship/](https://www.ildiczeller.com/2017/09/17/r-pkg-check-with-docker-on-codeship/)

[https://github.com/codeship/scripts/blob/master/languages/r.sh](https://github.com/codeship/scripts/blob/master/languages/r.sh)

[https://gist.github.com/czeildi/0e0e1df12b591963e6c8d0ba4abb4826](https://gist.github.com/czeildi/0e0e1df12b591963e6c8d0ba4abb4826)
