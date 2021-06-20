
mkdir build
cd build

git clone https://github.com/Microsoft/vcpkg.git vcpkg.windows

cd vcpkg.windows
git checkout 2021.04.30
call bootstrap-vcpkg.bat


vcpkg.exe install stb:x64-windows-static

cd ..
cd ..

exit /b