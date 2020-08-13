Instruction to obtain source code:

git clone https://github.com/jpcima/tunefish.git
cd tunefish
git submodule update --init --recursive

Instructions to build LV2:

make -C src/tunefish4/Builds/LinuxMakefile CONFIG=Release
cp src/tunefish4/Builds/LinuxMakefile/build/Tunefish4.so lv2/Tunefish4.lv2/
