.data
a: .word 2048

.text
li a0,1024 #size=1024
li a1,2 #step=2
li a2,4 #reps=10
li a3,1 #option=1

jal a_array

li a0,10
ecall

a_array:

la s0,a
add s1,s0,a0
slli t1,a1,2

loop1:
beq a3,x0,stzero
lb t0,0(s0)
addi t0,t0,1
sb t0,0(s0)

j loop2
stzero:
sb x0,0(s0)
loop2:
add s0,s0,t1
blt s0,s1,loop1
addi a2,a2,-1
bgtz a2, a_array
jr ra
