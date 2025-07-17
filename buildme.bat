SET PATH=%PATH%;C:\opt\apps\mingw64\bin;

SET SOURCE=libqrencode

copy Makefile  %SOURCE%

cd %SOURCE%

mingw32-make clean
mingw32-make -j8

copy *.a ..
copy *.lib ..

cd ..