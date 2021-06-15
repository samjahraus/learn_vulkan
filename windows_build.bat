rmdir build

mkdir build
cd build
mkdir windows

cd ..

cmake -S . -B ./build/windows -G"Visual Studio 16 2019" -A"x64"
cd build
cd windows

msbuild learn_vulkan.sln /t:Rebuild /p:Configuration=Release
cd ..
cd ..
pause