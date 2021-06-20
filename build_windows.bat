cd build
mkdir windows

cd ..

cmake -S . -B ./build/windows -D VCPKG_TARGET_TRIPLET=x64-windows-static -D CMAKE_TOOLCHAIN_FILE=../vcpkg.windows/scripts/buildsystems/vcpkg.cmake -G"Visual Studio 16 2019" -A"x64" 
cd build
cd windows

msbuild learn_vulkan.sln /t:Rebuild /p:Configuration=Release

cd ..
cd ..
pause