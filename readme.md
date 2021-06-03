# Generating Overlay

<ol>
<li>Clone the [NEORV32 repo](https://github.com/stnolting/neorv32) to get the latest RTL</li>
<li>Open/create a Vivado project to add the overlay to</li>
<li>Add the contents of block_parts to this project</li>
<li>Run overlay_project/rv32i_overlay.tcl using the source command in vivado</li>
<li>Right click on the created block diagram, select "Create HDL wrapper" and follow the wizard</li>
<li>The overlay should now be created</il>
</ol>
