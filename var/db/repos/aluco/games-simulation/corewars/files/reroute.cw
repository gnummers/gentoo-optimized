# Reroute other processes to execute my code

	Title	"Reroute"
	Author	"Jonathan Enders <kannibalenfleisch@web.de>"
DIA:    data	&DIA		#DestinationIndexA for Jump-Instruction
DIB:	data	&DIB		#DestinationIndexB for Jump-Coordinates

S:      add     -2038,DIA	
	add	-2038,DIB	#Move Jump-Instruction to more 
	move    INST,[DIA]	#or less random location
	move	DIS,[DIB]
	
E:      jump    S		#Repeat


INST:	jump	[DIS]		#Instruction to be copied to Destination
DIS:	data	&S		#Address where other processes should jump to
