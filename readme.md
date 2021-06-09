# RISCV-NEORV32 on PYNQ

This repo contains work on getting the NEORV32 soft-processor to work on Xilinx PYNQ boards.

For your first time running it please follow the subheaders in order, after each has been run once, each section can be used separately as required.

## Clone/Update NEORV32 repo
<ol>
<li>Clone/update the [NEORV32 repo](https://github.com/stnolting/neorv32) to get the latest RTL, the recommended location is just below the root of this repo (ie run the git clone at this repo's root)</li>
<li>Run block_parts/repo_rtl_conversion.py to convert the NEORV32 rtl into block diagram friendly rtl, you may need to change the repo_path variable at the start of this script so it can find  the NEORV32  rtl
</ol>

## Generating Overlay
<ol>
<li>Open/create a Vivado project to add the overlay to</li>
<li>Add the contents of block_parts to this project, use library neorv32</li>
<li>Run overlay_project/rv32i_overlay.tcl using the source command in vivado</li>
<li>Right click on the created block diagram, select "Create HDL wrapper" and follow the wizard</li>
<li>Make sure this wrapper is set as your top level module and generate bitstream</il>
<li>Once the bitstream is generated copy the .bit and .hwh files from your Vivado project to your PYNQ board, note its location for later.
Make sure they share the same filename, you might need to remove something like "_wrapper" from one of them</li>
</ol>

## Setting up programming toolchain
<ol>
<li>Download the [precompiled rv32i-2.0.0 toolchain](https://github.com/stnolting/riscv-gcc-prebuilt) provided by the developer of the NEO core, location doesn't matter</li>
<li>Add the toolchain to your path variable</li>
</ol>


## Creating a new program

<ol>
<li>Create a folder for your program.
Each program requires its own folder as the make file looks for all C files in a folder, therefore programs sharing a folder could cause issues</li>
<li>Copy the makefile from programming into your new folder. The make file assumes it is two levels below the root of this repo, If this is not the case you may need to edit the LD_SCRIPT and NEORV32_HOME variables to point to programming/neorv32.ld and the NEORV32 repo respectively</li>
<li>Now write your program</li>
</ol>

## Compiling a program

Program compilation is handled by programming/program_building.ipynb.
On opening the notebook make sure that the program_name, and program_path variables are correct for your program, then run each of the cells in order.
Once run you will have a range of generated files
<ul>
<li>,bin, the compiled program in raw binrary form, used to run your program on the PYNQ boards</li>
<li>.coe, the compiled program in coe form, used toi simulate yourt program in Vivado </li>
<li>.objdump, An object dump of your compiled program. useful for debugged</li>
</ul>

## Simulating your program

Currently there is bug with simulation, this section will be updated once it is sorted; in the meantime skip this section.

## Running your program on the PYQN board

Running programs on the PYNQ board is handled by the run_program notebook, (board_files/run_program.ipynb), it needs to be copied to and run on the PYNQ board.
Upon openning the notebook, edit overlay_path and program_name so that they point to your overlay (for Generating Overlay) and your program's ,bin (from Compiling a program) respectively.
Then run each of the cells, the cell starting with # Neo kickoff can be rerun to restart your program without having to reload the .bin into the overlay's BRAM
