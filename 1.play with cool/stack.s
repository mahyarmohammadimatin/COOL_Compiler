	.data
	.align	2
	.globl	class_nameTab
	.globl	Main_protObj
	.globl	Int_protObj
	.globl	String_protObj
	.globl	bool_const0
	.globl	bool_const1
	.globl	_int_tag
	.globl	_bool_tag
	.globl	_string_tag
_int_tag:
	.word	5
_bool_tag:
	.word	6
_string_tag:
	.word	7
	.globl	_MemMgr_INITIALIZER
_MemMgr_INITIALIZER:
	.word	_NoGC_Init
	.globl	_MemMgr_COLLECTOR
_MemMgr_COLLECTOR:
	.word	_NoGC_Collect
	.globl	_MemMgr_TEST
_MemMgr_TEST:
	.word	0
	.word	-1
str_const32:
	.word	7
	.word	7
	.word	String_dispTab
	.word	int_const9
	.ascii	"E_command"
	.byte	0	
	.align	2
	.word	-1
str_const31:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const7
	.ascii	"Command"
	.byte	0	
	.align	2
	.word	-1
str_const30:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"A2I"
	.byte	0	
	.align	2
	.word	-1
str_const29:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const28:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const27:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const26:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const25:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Cons"
	.byte	0	
	.align	2
	.word	-1
str_const24:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"List"
	.byte	0	
	.align	2
	.word	-1
str_const23:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const22:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const6
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const21:
	.word	7
	.word	8
	.word	String_dispTab
	.word	int_const11
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const20:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const7
	.ascii	"atoi.cl"
	.byte	0	
	.align	2
	.word	-1
str_const19:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"-"
	.byte	0	
	.align	2
	.word	-1
str_const18:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"9"
	.byte	0	
	.align	2
	.word	-1
str_const17:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"8"
	.byte	0	
	.align	2
	.word	-1
str_const16:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"7"
	.byte	0	
	.align	2
	.word	-1
str_const15:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"6"
	.byte	0	
	.align	2
	.word	-1
str_const14:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"5"
	.byte	0	
	.align	2
	.word	-1
str_const13:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"4"
	.byte	0	
	.align	2
	.word	-1
str_const12:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"3"
	.byte	0	
	.align	2
	.word	-1
str_const11:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"2"
	.byte	0	
	.align	2
	.word	-1
str_const10:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"1"
	.byte	0	
	.align	2
	.word	-1
str_const9:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"x"
	.byte	0	
	.align	2
	.word	-1
str_const8:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const2
	.ascii	"> "
	.byte	0	
	.align	2
	.word	-1
str_const7:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"s"
	.byte	0	
	.align	2
	.word	-1
str_const6:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"+"
	.byte	0	
	.align	2
	.word	-1
str_const5:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"e"
	.byte	0	
	.align	2
	.word	-1
str_const4:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"d"
	.byte	0	
	.align	2
	.word	-1
str_const3:
	.word	7
	.word	6
	.word	String_dispTab
	.word	int_const7
	.ascii	"list.cl"
	.byte	0	
	.align	2
	.word	-1
str_const2:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"\n"
	.byte	0	
	.align	2
	.word	-1
str_const1:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const0
	.byte	0	
	.align	2
	.word	-1
str_const0:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"0"
	.byte	0	
	.align	2
	.word	-1
int_const11:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	13
	.word	-1
int_const10:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	10
	.word	-1
int_const9:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	9
	.word	-1
int_const8:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	8
	.word	-1
int_const7:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	7
	.word	-1
int_const6:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	6
	.word	-1
int_const5:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	5
	.word	-1
int_const4:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	4
	.word	-1
int_const3:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	3
	.word	-1
int_const2:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	2
	.word	-1
int_const1:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	1
	.word	-1
int_const0:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
bool_const0:
	.word	6
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
bool_const1:
	.word	6
	.word	4
	.word	Bool_dispTab
	.word	1
class_nameTab:
	.word	str_const22
	.word	str_const23
	.word	str_const24
	.word	str_const25
	.word	str_const26
	.word	str_const27
	.word	str_const28
	.word	str_const29
	.word	str_const30
	.word	str_const31
	.word	str_const32
class_objTab:
	.word	Object_protObj
	.word	Object_init
	.word	IO_protObj
	.word	IO_init
	.word	List_protObj
	.word	List_init
	.word	Cons_protObj
	.word	Cons_init
	.word	Main_protObj
	.word	Main_init
	.word	Int_protObj
	.word	Int_init
	.word	Bool_protObj
	.word	Bool_init
	.word	String_protObj
	.word	String_init
	.word	A2I_protObj
	.word	A2I_init
	.word	Command_protObj
	.word	Command_init
	.word	E_command_protObj
	.word	E_command_init
Object_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
A2I_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A2I.c2i
	.word	A2I.i2c
	.word	A2I.a2i
	.word	A2I.a2i_aux
	.word	A2I.i2a
	.word	A2I.i2a_aux
Command_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A2I.c2i
	.word	A2I.i2c
	.word	A2I.a2i
	.word	A2I.a2i_aux
	.word	A2I.i2a
	.word	A2I.i2a_aux
	.word	Command.init
E_command_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A2I.c2i
	.word	A2I.i2c
	.word	A2I.a2i
	.word	A2I.a2i_aux
	.word	A2I.i2a
	.word	A2I.i2a_aux
	.word	Command.init
	.word	E_command.run_plus
	.word	E_command.run_swap
	.word	E_command.run
String_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	String.length
	.word	String.concat
	.word	String.substr
Bool_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Int_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
IO_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
Main_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	Main.main
List_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	List.isNil
	.word	List.head
	.word	List.tail
	.word	List.cons
	.word	List.print_list
Cons_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
	.word	Cons.isNil
	.word	Cons.head
	.word	Cons.tail
	.word	List.cons
	.word	List.print_list
	.word	Cons.init
	.word	-1
Object_protObj:
	.word	0
	.word	3
	.word	Object_dispTab
	.word	-1
A2I_protObj:
	.word	8
	.word	3
	.word	A2I_dispTab
	.word	-1
Command_protObj:
	.word	9
	.word	3
	.word	Command_dispTab
	.word	-1
E_command_protObj:
	.word	10
	.word	7
	.word	E_command_dispTab
	.word	str_const1
	.word	str_const1
	.word	int_const0
	.word	str_const1
	.word	-1
String_protObj:
	.word	7
	.word	5
	.word	String_dispTab
	.word	int_const0
	.word	0
	.word	-1
Bool_protObj:
	.word	6
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
Int_protObj:
	.word	5
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
IO_protObj:
	.word	1
	.word	3
	.word	IO_dispTab
	.word	-1
Main_protObj:
	.word	4
	.word	7
	.word	Main_dispTab
	.word	0
	.word	0
	.word	0
	.word	str_const1
	.word	-1
List_protObj:
	.word	2
	.word	3
	.word	List_dispTab
	.word	-1
Cons_protObj:
	.word	3
	.word	5
	.word	Cons_dispTab
	.word	str_const1
	.word	0
	.globl	heap_start
heap_start:
	.word	0
	.text
	.globl	Main_init
	.globl	Int_init
	.globl	String_init
	.globl	Bool_init
	.globl	Main.main
Object_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A2I_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Command_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	A2I_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
E_command_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Command_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
String_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Bool_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Int_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
IO_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
List_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	IO_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Cons_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	List_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A2I.c2i:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$s1 16($fp)
	la	$t2 str_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label2
	la	$a1 bool_const0
	jal	equality_test
label2:
	lw	$t1 12($a0)
	beqz	$t1 label0
	la	$a0 int_const0
	b	label1
label0:
	lw	$s1 16($fp)
	la	$t2 str_const10
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label5
	la	$a1 bool_const0
	jal	equality_test
label5:
	lw	$t1 12($a0)
	beqz	$t1 label3
	la	$a0 int_const1
	b	label4
label3:
	lw	$s1 16($fp)
	la	$t2 str_const11
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label8
	la	$a1 bool_const0
	jal	equality_test
label8:
	lw	$t1 12($a0)
	beqz	$t1 label6
	la	$a0 int_const2
	b	label7
label6:
	lw	$s1 16($fp)
	la	$t2 str_const12
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label11
	la	$a1 bool_const0
	jal	equality_test
label11:
	lw	$t1 12($a0)
	beqz	$t1 label9
	la	$a0 int_const3
	b	label10
label9:
	lw	$s1 16($fp)
	la	$t2 str_const13
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label14
	la	$a1 bool_const0
	jal	equality_test
label14:
	lw	$t1 12($a0)
	beqz	$t1 label12
	la	$a0 int_const4
	b	label13
label12:
	lw	$s1 16($fp)
	la	$t2 str_const14
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label17
	la	$a1 bool_const0
	jal	equality_test
label17:
	lw	$t1 12($a0)
	beqz	$t1 label15
	la	$a0 int_const5
	b	label16
label15:
	lw	$s1 16($fp)
	la	$t2 str_const15
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label20
	la	$a1 bool_const0
	jal	equality_test
label20:
	lw	$t1 12($a0)
	beqz	$t1 label18
	la	$a0 int_const6
	b	label19
label18:
	lw	$s1 16($fp)
	la	$t2 str_const16
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label23
	la	$a1 bool_const0
	jal	equality_test
label23:
	lw	$t1 12($a0)
	beqz	$t1 label21
	la	$a0 int_const7
	b	label22
label21:
	lw	$s1 16($fp)
	la	$t2 str_const17
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label26
	la	$a1 bool_const0
	jal	equality_test
label26:
	lw	$t1 12($a0)
	beqz	$t1 label24
	la	$a0 int_const8
	b	label25
label24:
	lw	$s1 16($fp)
	la	$t2 str_const18
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label29
	la	$a1 bool_const0
	jal	equality_test
label29:
	lw	$t1 12($a0)
	beqz	$t1 label27
	la	$a0 int_const9
	b	label28
label27:
	move	$a0 $s0
	bne	$a0 $zero label30
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label30:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 int_const0
label28:
label25:
label22:
label19:
label16:
label13:
label10:
label7:
label4:
label1:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 20
	jr	$ra	
A2I.i2c:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$s1 16($fp)
	la	$t2 int_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label33
	la	$a1 bool_const0
	jal	equality_test
label33:
	lw	$t1 12($a0)
	beqz	$t1 label31
	la	$a0 str_const0
	b	label32
label31:
	lw	$s1 16($fp)
	la	$t2 int_const1
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label36
	la	$a1 bool_const0
	jal	equality_test
label36:
	lw	$t1 12($a0)
	beqz	$t1 label34
	la	$a0 str_const10
	b	label35
label34:
	lw	$s1 16($fp)
	la	$t2 int_const2
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label39
	la	$a1 bool_const0
	jal	equality_test
label39:
	lw	$t1 12($a0)
	beqz	$t1 label37
	la	$a0 str_const11
	b	label38
label37:
	lw	$s1 16($fp)
	la	$t2 int_const3
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label42
	la	$a1 bool_const0
	jal	equality_test
label42:
	lw	$t1 12($a0)
	beqz	$t1 label40
	la	$a0 str_const12
	b	label41
label40:
	lw	$s1 16($fp)
	la	$t2 int_const4
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label45
	la	$a1 bool_const0
	jal	equality_test
label45:
	lw	$t1 12($a0)
	beqz	$t1 label43
	la	$a0 str_const13
	b	label44
label43:
	lw	$s1 16($fp)
	la	$t2 int_const5
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label48
	la	$a1 bool_const0
	jal	equality_test
label48:
	lw	$t1 12($a0)
	beqz	$t1 label46
	la	$a0 str_const14
	b	label47
label46:
	lw	$s1 16($fp)
	la	$t2 int_const6
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label51
	la	$a1 bool_const0
	jal	equality_test
label51:
	lw	$t1 12($a0)
	beqz	$t1 label49
	la	$a0 str_const15
	b	label50
label49:
	lw	$s1 16($fp)
	la	$t2 int_const7
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label54
	la	$a1 bool_const0
	jal	equality_test
label54:
	lw	$t1 12($a0)
	beqz	$t1 label52
	la	$a0 str_const16
	b	label53
label52:
	lw	$s1 16($fp)
	la	$t2 int_const8
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label57
	la	$a1 bool_const0
	jal	equality_test
label57:
	lw	$t1 12($a0)
	beqz	$t1 label55
	la	$a0 str_const17
	b	label56
label55:
	lw	$s1 16($fp)
	la	$t2 int_const9
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label60
	la	$a1 bool_const0
	jal	equality_test
label60:
	lw	$t1 12($a0)
	beqz	$t1 label58
	la	$a0 str_const18
	b	label59
label58:
	move	$a0 $s0
	bne	$a0 $zero label61
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label61:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 str_const1
label59:
label56:
label53:
label50:
label47:
label44:
label41:
label38:
label35:
label32:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 20
	jr	$ra	
A2I.a2i:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 16($fp)
	bne	$a0 $zero label65
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label65:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$s1 $a0
	la	$t2 int_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label64
	la	$a1 bool_const0
	jal	equality_test
label64:
	lw	$t1 12($a0)
	beqz	$t1 label62
	la	$a0 int_const0
	b	label63
label62:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	bne	$a0 $zero label69
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label69:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	move	$s1 $a0
	la	$t2 str_const19
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label68
	la	$a1 bool_const0
	jal	equality_test
label68:
	lw	$t1 12($a0)
	beqz	$t1 label66
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	bne	$a0 $zero label70
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label70:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$s1 $a0
	la	$a0 int_const1
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	bne	$a0 $zero label71
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label71:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label72
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label72:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	b	label67
label66:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	bne	$a0 $zero label76
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label76:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	move	$s1 $a0
	la	$t2 str_const6
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label75
	la	$a1 bool_const0
	jal	equality_test
label75:
	lw	$t1 12($a0)
	beqz	$t1 label73
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	bne	$a0 $zero label77
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label77:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$s1 $a0
	la	$a0 int_const1
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	bne	$a0 $zero label78
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label78:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label79
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label79:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
	b	label74
label73:
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label80
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label80:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
label74:
label67:
label63:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 20
	jr	$ra	
A2I.a2i_aux:
	addiu	$sp $sp -28
	sw	$fp 28($sp)
	sw	$s0 24($sp)
	sw	$ra 20($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$s1 int_const0
	lw	$a0 28($fp)
	sw	$s1 0($fp)
	bne	$a0 $zero label81
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label81:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 0($fp)
	move	$s2 $a0
	la	$s3 int_const0
label82:
	move	$s4 $s3
	lw	$t1 12($s4)
	lw	$t2 12($s2)
	la	$a0 bool_const1
	blt	$t1 $t2 label84
	la	$a0 bool_const0
label84:
	lw	$t1 12($a0)
	beq	$t1 $zero label83
	move	$s4 $s1
	la	$a0 int_const10
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s4)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	move	$s4 $a0
	sw	$s3 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 28($fp)
	sw	$s1 0($fp)
	sw	$s2 4($fp)
	sw	$s3 8($fp)
	sw	$s4 12($fp)
	bne	$a0 $zero label85
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label85:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	lw	$s1 0($fp)
	lw	$s2 4($fp)
	lw	$s3 8($fp)
	lw	$s4 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	sw	$s1 0($fp)
	sw	$s2 4($fp)
	sw	$s3 8($fp)
	sw	$s4 12($fp)
	bne	$a0 $zero label86
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label86:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$s1 0($fp)
	lw	$s2 4($fp)
	lw	$s3 8($fp)
	lw	$s4 12($fp)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s4)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	move	$s1 $a0
	move	$s4 $s3
	la	$a0 int_const1
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s4)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	move	$s3 $a0
	b	label82
label83:
	move	$a0 $zero
	move	$a0 $s1
	lw	$fp 28($sp)
	lw	$s0 24($sp)
	lw	$ra 20($sp)
	addiu	$sp $sp 32
	jr	$ra	
A2I.i2a:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$s1 16($fp)
	la	$t2 int_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label89
	la	$a1 bool_const0
	jal	equality_test
label89:
	lw	$t1 12($a0)
	beqz	$t1 label87
	la	$a0 str_const0
	b	label88
label87:
	la	$s1 int_const0
	lw	$a0 16($fp)
	lw	$t1 12($s1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label92
	la	$a0 bool_const0
label92:
	lw	$t1 12($a0)
	beqz	$t1 label90
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label93
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label93:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	b	label91
label90:
	lw	$s1 16($fp)
	la	$a0 int_const1
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label94
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label94:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const19
	bne	$a0 $zero label95
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label95:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
label91:
label88:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 20
	jr	$ra	
A2I.i2a_aux:
	addiu	$sp $sp -24
	sw	$fp 24($sp)
	sw	$s0 20($sp)
	sw	$ra 16($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$s1 24($fp)
	la	$t2 int_const0
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label98
	la	$a1 bool_const0
	jal	equality_test
label98:
	lw	$t1 12($a0)
	beqz	$t1 label96
	la	$a0 str_const1
	b	label97
label96:
	lw	$s1 24($fp)
	la	$a0 int_const10
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	move	$s1 $a0
	lw	$s2 24($fp)
	move	$s3 $s1
	la	$a0 int_const10
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s3)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s2)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	sw	$s1 0($fp)
	bne	$a0 $zero label99
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label99:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	lw	$s1 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	sw	$s1 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	sw	$s1 0($fp)
	bne	$a0 $zero label100
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label100:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	lw	$s1 0($fp)
	sw	$s1 0($fp)
	bne	$a0 $zero label101
	la	$a0 str_const20
	li	$t1 1
	jal	_dispatch_abort
label101:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	lw	$s1 0($fp)
label97:
	lw	$fp 24($sp)
	lw	$s0 20($sp)
	lw	$ra 16($sp)
	addiu	$sp $sp 28
	jr	$ra	
Command.init:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$s1 20($fp)
	la	$t2 str_const4
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label104
	la	$a1 bool_const0
	jal	equality_test
label104:
	lw	$t1 12($a0)
	beqz	$t1 label102
	lw	$a0 16($fp)
	bne	$a0 $zero label105
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label105:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	lw	$a0 16($fp)
	b	label103
label102:
	lw	$s1 20($fp)
	la	$t2 str_const5
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label108
	la	$a1 bool_const0
	jal	equality_test
label108:
	lw	$t1 12($a0)
	beqz	$t1 label106
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 E_command_protObj
	jal	Object.copy
	jal	E_command_init
	bne	$a0 $zero label109
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label109:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	b	label107
label106:
	lw	$a0 20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	bne	$a0 $zero label110
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label110:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
label107:
label103:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 24
	jr	$ra	
E_command.run_plus:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 16($fp)
	bne	$a0 $zero label111
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label111:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 12($s0)
	lw	$a0 16($fp)
	bne	$a0 $zero label112
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label112:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label113
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label113:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 16($s0)
	lw	$a0 16($fp)
	bne	$a0 $zero label114
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label114:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label115
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label115:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 16($fp)
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label116
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label116:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	move	$s1 $a0
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	sw	$s1 0($fp)
	bne	$a0 $zero label117
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label117:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	lw	$s1 0($fp)
	jal	Object.copy
	lw	$t2 12($a0)
	lw	$t1 12($s1)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 20($s0)
	lw	$a0 20($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label118
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label118:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	bne	$a0 $zero label119
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label119:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 16($fp)
	lw	$a0 16($fp)
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 20
	jr	$ra	
E_command.run_swap:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 12($fp)
	bne	$a0 $zero label120
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label120:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 12($s0)
	lw	$a0 12($fp)
	bne	$a0 $zero label121
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label121:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label122
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label122:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 16($s0)
	lw	$a0 12($fp)
	bne	$a0 $zero label123
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label123:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label124
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label124:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 12($fp)
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 12($fp)
	bne	$a0 $zero label125
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label125:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	bne	$a0 $zero label126
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label126:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	sw	$a0 12($fp)
	lw	$a0 12($fp)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
E_command.run:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 16($fp)
	bne	$a0 $zero label130
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label130:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	move	$s1 $a0
	la	$t2 str_const6
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label129
	la	$a1 bool_const0
	jal	equality_test
label129:
	lw	$t1 12($a0)
	beqz	$t1 label127
	lw	$a0 16($fp)
	bne	$a0 $zero label131
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label131:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label132
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label132:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	b	label128
label127:
	lw	$a0 16($fp)
	bne	$a0 $zero label136
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label136:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	move	$s1 $a0
	la	$t2 str_const7
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label135
	la	$a1 bool_const0
	jal	equality_test
label135:
	lw	$t1 12($a0)
	beqz	$t1 label133
	lw	$a0 16($fp)
	bne	$a0 $zero label137
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label137:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label138
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label138:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	b	label134
label133:
	lw	$a0 16($fp)
label134:
label128:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 20
	jr	$ra	
Main.main:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 List_protObj
	jal	Object.copy
	jal	List_init
	sw	$a0 16($s0)
	la	$a0 str_const8
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label139
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label139:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label140
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label140:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 24($s0)
label141:
	lw	$s1 24($s0)
	la	$t2 str_const9
	move	$t1 $s1
	la	$a0 bool_const1
	beq	$t1 $t2 label144
	la	$a1 bool_const0
	jal	equality_test
label144:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label143
	la	$a0 bool_const0
label143:
	lw	$t1 12($a0)
	beq	$t1 $zero label142
	lw	$a0 24($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($s0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Command_protObj
	jal	Object.copy
	jal	Command_init
	bne	$a0 $zero label145
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label145:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	sw	$a0 20($s0)
	lw	$a0 20($s0)
	sw	$a0 16($s0)
	la	$a0 str_const8
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label146
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label146:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label147
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label147:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 24($s0)
	b	label141
label142:
	move	$a0 $zero
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
List.isNil:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 bool_const1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
List.head:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label148
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label148:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	la	$a0 str_const0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
List.tail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label149
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label149:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
List.cons:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 Cons_protObj
	jal	Object.copy
	jal	Cons_init
	bne	$a0 $zero label150
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label150:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
List.print_list:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label153
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label153:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	lw	$t1 12($a0)
	beqz	$t1 label151
	la	$a0 str_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label154
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label154:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	b	label152
label151:
	move	$a0 $s0
	bne	$a0 $zero label155
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label155:
	lw	$t1 8($a0)
	lw	$t1 32($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label156
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label156:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label157
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label157:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label158
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label158:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	bne	$a0 $zero label159
	la	$a0 str_const3
	li	$t1 1
	jal	_dispatch_abort
label159:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
label152:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Cons.isNil:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 bool_const0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Cons.head:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Cons.tail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 16($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Cons.init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 16($fp)
	sw	$a0 12($s0)
	lw	$a0 12($fp)
	sw	$a0 16($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra	
