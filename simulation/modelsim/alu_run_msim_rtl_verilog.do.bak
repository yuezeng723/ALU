transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/fa.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/rca.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/csa.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/mux_2to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/subtract.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/sll.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/sra.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/and_for_alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/or_for_alu.v}

vlog -vlog01compat -work work +incdir+C:/Users/zeng/Desktop/Project\ Files {C:/Users/zeng/Desktop/Project Files/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
