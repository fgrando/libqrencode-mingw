SET PATH=%PATH%;C:\opt\apps\mingw64\bin;

SET SOURCE=libqrencode411-repo

git clone --branch v4.1.1 https://github.com/fukuchi/libqrencode.git %SOURCE%

copy Makefile %SOURCE%/

cd %SOURCE%

mingw32-make clean
mingw32-make -j8 

copy *.a ..
copy *.lib ..
