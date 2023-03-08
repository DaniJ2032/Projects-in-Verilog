onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib VIO_opt

do {wave.do}

view wave
view structure
view signals

do {VIO.udo}

run -all

quit -force
