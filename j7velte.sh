rm /home/jaskaran/Helios/arch/arm64/boot/Image
rm /home/jaskaran/Helios/arch/arm64/boot/Image.gz
echo "Image Directory Cleaned"
echo ""
echo "Kernel Build Started"
CR_ANDROID=n
CR_PLATFORM=7.0.0
CR_ARCH=arm64
export USE_CCACHE=1
export USE CCACHE=1
CR_DTS=arch/arm64/boot/dts
#export PLATFORM_VERSION=8.0.0    #uncomment for ANDROID OREO
#export ANDROID_MAJOR_VERSION=o   #comment Others Too
export PLATFORM_VERSION=7.0.0
export ANDROID_MAJOR_VERSION=n
export KBUILD_BUILD_USER=JaskaranSM
CR_DTSFILES="exynos7870-j7velte_sea_open_00.dtb exynos7870-j7velte_sea_open_01.dtb exynos7870-j7velte_sea_open_03.dtb"
export arm64
make j7velte_defconfig
make $CR_DTSFILES
	./scripts/dtbTool/dtbTool -o ./boot.img-dtb -d $CR_DTS/ -s 2048
	du -k "./boot.img-dtb"
echo "DTB Generated"
make j7velte_defconfig
make -j3
echo "Kernel Compiled"
