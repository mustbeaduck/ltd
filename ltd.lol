BTW lci future branch
HAI 1.4

CAN HAS STDIO? 
CAN HAS STRING?

BTW i wish there was fwrite
HOW IZ I write_some YR file AN YR str AN YR amnt
	I HAS A len ITZ I IZ STRING'Z LEN YR str MKAY
	I HAS A res_str ITZ A YARN
	I HAS A i ITZ 0
	IM IN YR loop UPPIN YR i TIL BOTH SAEM i AN amnt
		DIFFRINT i AN BIGGR OF i AN len, O RLY?
			YA RLY
				res_str R SMOOSH res_str AN I IZ STRING'Z AT YR str AN YR i MKAY MKAY
			NO WAI
				res_str R SMOOSH res_str AN " " MKAY
			OIC
	IM OUTTA YR loop
	I IZ STDIO'Z SCRIBBEL YR file AN YR res_str  MKAY
IF U SAY SO

OBTW
							BUKKIT METHODS
TLDR
BTW init a list
HOW IZ I init_list YR list AN YR size
	I HAS A i ITZ 0
	IM IN YR loop UPPIN YR i TIL BOTH SAEM i AN size
		list HAS A SRS i ITZ FAIL
	IM OUTTA YR loop
	list HAS A SRS "len" ITZ 0
IF U SAY SO

BTW append element to a list
HOW IZ I append YR list AN YR elem
	I HAS A len ITZ list'Z SRS "len"
	list'Z SRS len R elem
	list'Z SRS "len" R SUM OF len AN 1  
IF U SAY SO

BTW remove element by index and shift a list
HOW IZ I remove_at YR list AN YR indx
	I HAS A lim ITZ DIFF OF list'Z SRS "len" AN 1
	BTW size check
	DIFFRINT indx AN SMALLR OF indx AN lim, O RLY?
	YA RLY
		GTFO
	OIC
	DIFFRINT indx AN BIGGR OF indx AN 0, O RLY?
	YA RLY
		GTFO
	OIC


	IM IN YR loop UPPIN YR i TIL BOTH SAEM indx AN lim BTW turns out u cant set  a starting point to UPPIN par
		list'Z SRS indx R list'Z SRS SUM OF indx AN 1
		indx R SUM OF indx AN 1
	IM OUTTA YR loop
	list'Z SRS lim R FAIL
	list'Z SRS "len" R lim
IF U SAY SO

BTW print out list 
HOW IZ I print_list YR list
	IM IN YR loop UPPIN YR i TIL BOTH SAEM i AN list'Z SRS "len"
		VISIBLE i ") " list'Z SRS i
	IM OUTTA YR loop 
IF U SAY SO

BTW clear list
HOW IZ I clear YR list
	IM IN YR loop UPPIN YR i TIL BOTH SAEM i AN list'Z SRS "len"
		list'Z SRS i R FAIL
	IM OUTTA YR loop 
	list'Z SRS "len" R 0
IF U SAY SO

OBTW 
						MAIN METHODS
TLDR
BTW save a list to a file
HOW IZ I save YR list AN YR file AN YR len
	IM IN YR loop UPPIN YR i TIL BOTH SAEM i AN list'Z SRS "len"
		I IZ write_some YR file AN YR list'Z SRS i AN YR len MKAY
	IM OUTTA YR loop
IF U SAY SO

BTW get all entries into a list
HOW IZ I get_entries YR file AN YR lim
	I HAS A i ITZ 0, I HAS A yrn 
	I HAS A list ITZ A BUKKIT
	BTW init
	I IZ init_list YR list AN YR lim MKAY

	IM IN YR loop UPPIN YR i TIL BOTH SAEM i AN lim
			yrn R I IZ STDIO'Z LUK YR file AN YR 100 MKAY
			BTW empty line
			BOTH SAEM yrn AN "", O RLY?
				YA RLY
					FOUND YR list
			OIC
			I IZ append YR list AN YR yrn MKAY
	IM OUTTA YR loop
	FOUND YR list
IF U SAY SO



BTW user dialogue loop
HOW IZ I user_dialogue YR list AN YR limit
		I HAS A exit ITZ FAIL, I HAS A choice
		I HAS A line
		IM IN YR loop UPPIN YR i TIL exit
			VISIBLE ":>:>MENU:)1) Add a new entrie:)2) Remove an entrie:)3) Display entries:)4) Remove all entries:)5) Save changes:)0) Exit:)"
			GIMMEH choice	
			BTW switch over user choice
			choice, WTF?
				OMG "1"
					BTW check if ther is a free space
					DIFFRINT list'Z SRS "len" AN BIGGR OF list'Z SRS "len" AN limit, O RLY?
						YA RLY
							VISIBLE "Enter a line: "
							GIMMEH line
							I IZ append YR list AN YR line MKAY
						NO WAI
							VISIBLE "Not enough space. Remove some entries first:)"
					OIC
					GTFO
				OMG "2"
					DIFFRINT list'Z SRS "len" AN 0, O RLY?
						YA RLY
							VISIBLE "Chose an index: "
							GIMMEH line
							line R MAEK line A NUMBR
							I IZ remove_at YR list AN YR line MKAY
						NO WAI
							VISIBLE "The list is empty:)"
					OIC
					GTFO
				OMG "3" 
					I IZ print_list YR list MKAY
					GTFO
				OMG "4"
					I IZ clear YR list MKAY
					GTFO
				OMG "5"					
					I HAS A file ITZ I IZ STDIO'Z OPEN YR "file" AN YR "w" MKAY
					I IZ save YR list AN YR file AN YR 100 MKAY
					I IZ STDIO'Z CLOSE YR file MKAY
					GTFO
				OMGWTF
					VISIBLE "K THX BYE"
					exit R WIN
		OIC
	IM OUTTA YR loop
IF U SAY SO

OBTW
							EXECUTION STARTS HERE
TLDR
I HAS A limit ITZ 10


I HAS A file ITZ I IZ STDIO'Z OPEN YR "file" AN YR "r" MKAY 
I IZ STDIO'Z DIAF YR file MKAY 
O RLY?
	YA RLY
		VISIBLE "Cant acces 'file' creating a new one:)"
		I HAS A file ITZ I IZ STDIO'Z OPEN YR "file" AN YR "w" MKAY
		I IZ STDIO'Z DIAF YR file MKAY
		O RLY?
			YA RLY
				VISIBLE "Cant create a new todo file"
				GTFO
			NO WAI
				I IZ STDIO'Z CLOSE YR file MKAY
				BTW empty list
				I HAS A list ITZ A BUKKIT
				I IZ init_list YR list AN YR limit MKAY
				I IZ user_dialogue YR list AN YR limit MKAY 
			OIC
	NO WAI
		I HAS A list ITZ I IZ get_entries YR file AN YR limit MKAY
		I IZ STDIO'Z CLOSE YR file MKAY
		I IZ user_dialogue YR list AN YR limit MKAY
		
OIC

KTHXBYE

