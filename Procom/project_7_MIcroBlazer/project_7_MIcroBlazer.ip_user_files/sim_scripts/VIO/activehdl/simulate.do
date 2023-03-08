onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+VIO -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.VIO xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {VIO.udo}

run -all

endsim

quit -force
