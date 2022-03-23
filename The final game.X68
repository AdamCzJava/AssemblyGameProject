*-----------------------------------------------------------
* Title      : Global Warming Adventure Game
* Written by : Adam Czaplewski
* Date       : 3/20/2022
* Description: My goal in that adventure game is to lessen carbon emissions by shopping at the store. 
*              We can also fight Dragon in the battle to win the game, but first, we must purchase 
*              the magic spear from the shop. To obtain the funds needed, we must first meet with
*              the Vizard, who will put our knowledge of the global warming to the test. 
*              We'll be able to buy the spear and kill the monster if we answer the questions correctly. 
*              However, we must proceed with caution because each incorrect response will result
*              in a 1000-unit increase in our carbon level. We shall lose the game when we reach 30000 carbon units.
*              I wish you all best of luck with the game!!!! 
*-----------------------------------------------------------



    ORG    $10000        ;starting the program from the memory address $10000
                         
    
SPEAR EQU $2500          ;the equate directive for address location for spear flag
TCOST EQU 50             ;the equate directive for tree price
SCOST EQU 100            ;the equate directive for solar panel price
WCOST EQU 75             ;the equate directive for windmill price
SPCOST EQU 3000          ;the equate directive for speer price

    
START:                   ;first instruction of program
    MOVE.B #0,SPEAR      ;the equate directive for spear with the zero value which indicates that there is no spear
    
    MOVE.L #25000, $3000 ;move the literal number 25000 which represents total amount of the carbon in to the address memory $3000
    MOVE.L #500,   $4000 ;move the literal number 500 which represents total amount of the money in to the address memory $4000
    MOVE.W #100,   $5000 ;move the literal number 100 which represents the solar panel in to the address memory $5000
    MOVE.W #75,    $6000 ;move the literal number 75 which represents the windmill in to the address memory $6000
    MOVE.W #50,    $8000 ;move the literal number 50 which represents the tree in to the address memory $8000
    
    MOVE.L #33999, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15
    LEA welcome, A1      ;it loads string variable welcome (Load Effective Address) into A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable welcome
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    MOVE.L #65280, D1    ;set colour to green    
    MOVE.B #21, D0
    TRAP #15
    LEA earth, A1        ;it loads string variable earth (Load Effective Address) into A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable earth
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    MOVE.L #10233, D1    ;set colour to red
    MOVE.B #21, D0
    TRAP #15
    BSR NEWLINE          ;branch to subroutine NEWLINE by the instruction BSR (Branch to subroutine)
    LEA text1, A1        ;it loads string variable text1(Load Effective Address) in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable text1
    LEA $9000,A1    
    MOVE.B #2, D0        ;store the string in the memory location $9000 then stores that memory location in A1 it also store the number of characters in D1
    TRAP #15
    MOVE.L (A1),$9000    ;we move the value stored at the memory location stored in address register A1 into the memory location $9000
    BSR NEWLINE          ;branch to subroutine NEWLINE
    LEA text2, A1        ;it loads variable text2(Load Effective Address) into A1
    MOVE.W #14, D0    
    TRAP #15             ;display the string variable text2
    LEA $9000, A1        ;the string text2 which we stored at the moemory location 9000 we moved into the A1
    MOVE.W #1, D0 
    TRAP #15             ;display the user input
    LEA welcome2, A1     ;it loads variable welcome2 (Load Effective Address) into A1
    MOVE.W #14, D0     
    TRAP #15             ;display the string variable welcome2
    
    
RESTART:
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA text4, A1        ;it loads string variable text4(Load Effective Address) into A1
    MOVE.W #14, D0     
    TRAP #15             ;display the string variable text4
    BSR INPUT            ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #13, D1          ;compare literal number 13 with number in hex which is stored in D1(the number is D)
    BEQ GAMELOOP         ;BEQ (Branch if equal) it jumps to GAMELOOP if the values which we compared above are equal
    BRA RESTART          ;BRA (Branch if not equal) it jumps to RESTART if the values which we compared above are not equal

    
INPUT:
    MOVE.L #0,D1
    MOVE.B #5, D0        ;read a single character from the keyboard into D1 
    TRAP #15        
    RTS                  ;it returns from Subroutine (INPUT) 

INPUTA:
    MOVE.L #0,D1
    MOVE.B #4, D0        ;read a single digit from the keyboard into D1 
    TRAP #15        
    RTS                  ;it return from Subroutine (INPUTA) in to the if statement where questions are displayed
        
GAMELOOP:
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    SUB D1, D1           ;clearing D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$f6b26b,D1   ;set colour blue
    MOVE.B #21, D0         
    TRAP #15
    SUB D1, D1           ;clearing D1
    LEA description,A1   ;it loads string variable description1 (Load Effective Address) into A1
    MOVE.W #14, D0       
    TRAP #15             ;display the string variable description
    BSR NEWLINE          ;calling the subroutines( NEWLINE )by the instruction BSR (Branch to subroutine)  
    LEA description2,A1  ;it loads string variable description2 (Load Effective Address) into A1 
    MOVE.W #14, D0       
    TRAP #15             ;display the string variable description2
    BSR LEVEL            ;calling the subroutine (LEVEL) by the instruction BSR (Branch to subroutine)
    
    
NEWLINE:
    LEA NEW, A1          ;it loads string variable NEW (Load Effective Address) in to A1
    MOVE.B #14, D0      
    TRAP #15             ;display the string variable NEW
    RTS                  ;it returns from Subroutine( NEWLINE )

LEVEL:
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #33284,D1     ;set colour to green
    MOVE.B #21, D0         
    TRAP #15
    SUB D1, D1           ;clearing D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR WAIT             ;calling the subroutines( WAIT ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA text6, A1        ;it loads string variable text6 (Load Effective Address) in to A1
    MOVE.W #14, D0       
    TRAP #15             ;display the string variable text6
    SUB D1, D1           ;clearing D1
    BSR INPUT            ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #99, D1          ;compare literal number 13 with number in hex which is stored in D1(the number is D)
    BEQ PATH             ;BEQ (Branch if equal) it jumps to PATH if the values which we compared above are equal
    BRA LEVEL            ;BRA (Branch if not equal) it jumps to LEVEL if the values which we compare above are not equal

PATH:
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine) 
    MOVE.L #25280, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15     
    LEA text8, A1        ;it loads string variable text8 (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15             ;display the string variable text8
    MOVE.L $3000, D1     ;move address memory $3000 in to D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA text3, A1        ;it loads string variable text3 (Load Effective Address) into A1
    MOVE.W #17, D0       
    TRAP #15             ;display string at A1 (text3) and display decimal number in D1 which represent the carbon amount 25000
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L $4000, D1 
    LEA text5, A1        ;it loads string variable text5 (Load Effective Address)in to A1
    MOVE.W #17, D0
    TRAP #15             ;display string at A1 (text5) and display decimal number in D1 which represents the money 500
    SUB D1, D1           ;clearing D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #33284, D1    ;set colour to green
    MOVE.B #21, D0         
    TRAP #15
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    LEA text7, A1        ;it loads string variable text7 (Load Effective Address)in to A1
    MOVE.W #14, D0       
    TRAP #15             ;display the string variable text7
    BSR INPUT            ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    CMP #102, D1         ;compare literal number 102 in ascii(character f) with number in hex which is stored in D1
    BEQ FOREST           ;BEQ (Branch if equal) it jumps to FOREST if the values which we compared above are equal
    CMP #115, D1         ;compare literal number 115 in ascii(character s) with number in hex which is stored in D1
    BEQ SHOP             ;BEQ (Branch if equal) it jumps to SHOP if the values which we compared above are equal
    BRA CHOOSE           ;BRA (Branch if not equal) it jumps to CHOOSE if the values which we compare above are not equal

    

SHOP:
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$ffd700,D1   ;set colour to light yellow
    MOVE.B #21, D0
    TRAP #15
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    SUB D1, D1           ;clearing D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    MOVE.L #662000, D1   ;set colour to red
    MOVE.B #21, D0
    TRAP #15
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #0,D1         ;clearing D1
    MOVE.L #0,A1         ;clearing A1
    LEA snoop, A1        ;it loads string variable snoop (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable snoop
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA enter, A1        ;it loads string variable enter (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable enter
    SUB D1, D1           ;clearing D1
    BSR INPUT            ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #13, D1          ;compare literal number 13(Enter key) with number in hex which is stored in D1(the number is D)
    BEQ ITEMS            ;BEQ (Branch if equal) it jumps to GAMELOOP if the values which we compared above are equal
    BRA SHOP             ;BRA (Branch if not equal) it jumps to SHOP if the values which we compare above are not equal
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)


NOMONEY:
    MOVE.L $4000, D3     ;moving memory location $4000 where we store money into D3
    CMP D2, D3           ;compare D2 with D3
    BLT NMONEY           ;branching to NMONEY if no money
    RTS                  ;it returns from Subroutine( NOMONEY )
    
NMONEY:
    LEA FOUNDS, A1       ;it loads string variable FOUNDS (Load Effective Address)in to A1
    MOVE.B #14, D0
    TRAP #15             ;display the string variable FOUNDS
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BRA SHOP             ;branching to the SHOP subroutine

NOMONEY2:
    MOVE.L $4000, D3     ;moving memory location $4000 where we store money into D3
    CMP D2, D3           ;compare D2 with D3
    BLT NMONEY2          ;branching to NMONEY if no money
    RTS                  ;it returns from Subroutine( NOMONEY )
    
NMONEY2:
    LEA FOUNDS2, A1      ;it loads string variable FOUNDS (Load Effective Address)in to A1
    MOVE.B #14, D0
    TRAP #15            ;display the string variable FOUNDS
    BSR WAIT            ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    LEA text6, A1       ;it loads string variable text6 (Load Effective Address)in to A1
    MOVE.W #14, D0     
    TRAP #15            ;display the string variable text6
    BSR INPUT           ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1           ;clearing D1
    CMP #99, D1         ;compare literal number 99(character c) with number in hex which is stored in D1
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BEQ HANDS           ;BEQ (Branch if equal) it jumps to DRACO if the values which we compared above are equal
    BRA CHOOSE          ;BRA (Branch if not equal) it jumps to CHOOSE if the values which we compare above are not equal
    BRA DRACO           ;branching to the DRACO subroutine
    
ITEMS:
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    LEA soop, A1        ;it loads string variable soop (Load Effective Address) into A1
    MOVE.W #14, D0     
    TRAP #15            ;display the string variable soop
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$ff3300,D1  ;set colour to boiling magma
    MOVE.B #21, D0         
    TRAP #15
    MOVE.L #0,D1        ;cleaning D1
    LEA solar, A1       ;it loads string variable solar (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable solar
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$0066ff,D1  ;set colour to blue
    MOVE.B #21, D0         
    TRAP #15
    MOVE.L #0,D1        ;cleaning D1
    LEA wind, A1        ;it loads string variable wind (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable wind
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #33284, D1   ;set colour to green
    MOVE.B #21, D0         
    TRAP #15
    MOVE.L #0,D1        ;cleaning D1
    LEA tree, A1        ;it loads string variable tree (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable tree
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$ffbf00, D1 ;set colour to orange
    MOVE.B #21, D0         
    TRAP #15
    MOVE.L #0,D1        ;cleaning D1
    LEA wapon, A1       ;it loads string variable wapon (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable wapon
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$ff0066,D1  ;set colour to pink
    MOVE.B #21, D0         
    TRAP #15
    MOVE.L #0,D1        ;cleaning D1
    LEA exit, A1        ;it loads string variable exit (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable exit
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR INPUT           ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #97, D1         ;compare literal number 97(character a) with number in hex which is stored in D1
    BEQ SOLO            ;BEQ (Branch if equal) it jumps to SOLO if the values which we compared above are equal
    CMP #98, D1         ;compare literal number 98(character b) with number in hex which is stored in D1
    BEQ WINDO           ;BEQ (Branch if equal) it jumps to WINDO if the values which we compared above are equal
    CMP #99, D1         ;compare literal number 99(character c) with number in hex which is stored in D1
    BEQ TRELE           ;BEQ (Branch if equal) it jumps to TRELE if the values which we compared above are equal
    CMP #100, D1        ;compare literal number 100(character d) with number in hex which is stored in D1
    BEQ SPEER           ;BEQ (Branch if equal) it jumps to SPEER if the values which we compared above are equal
    CMP #101, D1        ;compare literal number 101(character e) with number in hex which is stored in D1
    BEQ EXITO           ;BEQ (Branch if equal) it jumps to EXITO if the values which we compared above are equal
    BRA SHOP            ;BRA (Branch if not equal) it jumps to SHOP if the values which we compare above are not equal
    RTS                 ;it returns from Subroutine( ITEMS )
    

EXITO:
    MOVE.W #$FF00, D1   ;it will clear the screen
    MOVE.B #11, D0
    TRAP #15
    LEA NEW, A1         ;it loads string variable NEW (Load Effective Address) into A1
    MOVE.B #14, D0 
    TRAP #15            ;display the string variable NEW
    BRA CHOOSE          ;branching to the CHOOSE subroutine
    
CHOOSE:
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #33284,D1    ;set colour to green
    MOVE.B #21, D0
    TRAP #15
    LEA text7, A1       ;it loads string variable text7 (Load Effective Address) into A1
    MOVE.W #14, D0     
    TRAP #15            ;display the string variable text7
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR INPUT           ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #102, D1        ;compare literal number 102 in ascii(character f) with number in hex which is stored in D1
    BEQ FOREST          ;BEQ (Branch if equal) it jumps to FOREST if the values which we compared above are equal
    CMP #115, D1        ;compare literal number 115 in ascii(character s) with number in hex which is stored in D1
    BEQ SHOP            ;BEQ (Branch if equal) it jumps to SHOP if the values which we compared above are equal
    BRA CHOOSE          ;BRA (Branch if not equal) it jumps to CHOOSE if the values which we compare above are not equal

FOREST:
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #62000, D1   ;set colour green
    MOVE.B #21, D0
    TRAP #15
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA TREES, A1       ;it loads string variable TREES (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display string variable TREES
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$2986cc,D1  ;set colour to gold
    MOVE.B #21, D0
    TRAP #15
    SUB D1, D1          ;clearing D1
    LEA forent, A1      ;it loads string variable forent (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display string variable forent
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    SUB D1, D1          ;clearing D1
    BSR INPUT           ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #13, D1         ;compare literal number 13(Enter key) with number in hex which is stored in D1
    BEQ DEEP            ;BEQ (Branch if equal) it jumps to DEEP if the values which we compared above are equal
    BRA FOREST          ;BRA (Branch if not equal) it jumps to FOREST if the values which we compare above are not equal
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)


DEEP:
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #62000,D1    ;set colour green
    MOVE.B #21, D0
    TRAP #15
    SUB D1, D1          ;clearing D1
    LEA foorest, A1     ;it loads string variable foorest (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display string variable foorest
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA foorest2, A1    ;it loads string variable foorest2 (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display string variable foorest2
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR INPUT           ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #108, D1        ;compare literal number 108(character l) with number in hex which is stored in D1
    BEQ DRACO           ;BEQ (Branch if equal) it jumps to DRACO if the values which we compared above are equal
    CMP #114, D1        ;compare literal number 114(character r) with number in hex which is stored in D1
    BEQ WIZ             ;BEQ (Branch if equal) it jumps to WIZ if the values which we compared above are equal
    CMP #101, D1        ;compare literal number 101(character e) with number in hex which is stored in D1
    BEQ EXITO           ;BEQ (Branch if equal) it jumps to EXITO if the values which we compared above are equal
    BRA DEEP            ;BRA (Branch if not equal) it jumps to DEEP if the values which we compare above are not equal
    
    
    
    
    
DRACO:   
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$880000,D1  ;set colour to blue
    MOVE.B #21, D0         
    TRAP #15
    LEA dracon, A1      ;it loads string variable dracon (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable dracon
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1           ;clearing D1
    MOVE.L #$FFFF80,D1  ;set colour to baby blue
    MOVE.B #21, D0         
    TRAP #15
    LEA fooorest2,A1    ;it loads string variable fooorest2 (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable fooorest2
    MOVE.W #4, D0
    TRAP #15            ;read the single character from 
    CMP #1, D1          ;compare literal number 1 with number in hex which is stored in D1
    BEQ TALK            ;BEQ (Branch if equal) it jumps to TALK if the values which we compared above are equal
    CMP #2, D1          ;compare literal number 2 with number in hex which is stored in D1
    BEQ RUN             ;BEQ (Branch if equal) it jumps to RUN if the values which we compared above are equal
    CMP #3, D1          ;compare literal number 3 with number in hex which is stored in D1
    BEQ ATTACK          ;BEQ (Branch if equal) it jumps to ATTACK if the values which we compared above are equal
    BRA DRACO           ;BRA (Branch if not equal) it jumps to DRACO if the values which we compare above are not equal

    
TALK:
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$999999,D1  ;set colour to light shade of gray
    MOVE.B #21, D0         
    TRAP #15
    LEA foorest2a, A1   ;it loads string variable foorest2a (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable foorest2a
    SUB D1,D1           ;clearing D1
    MOVE.L #$2986cc,D1  ;set colour to gold
    MOVE.B #21, D0         
    TRAP #15
    LEA foorest3a, A1   ;it loads string variable foorest3a (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable foorest3a
    SUB D1,D1           ;clearing D1
    MOVE.L #$999999,D1  ;set colour to light shade of gray
    MOVE.B #21, D0         
    TRAP #15
    LEA foorest4a, A1   ;it loads string variable foorest4a (Load Effective Address) into A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable foorest4a
    SUB D1,D1           ;clearing D1
    MOVE.L #33284,D1    ;set colour to green
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1           ;clearing D1
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA text6, A1       ;it loads string variable text6 (Load Effective Address) into A1
    MOVE.W #14, D0      
    TRAP #15            ;display the string variable text6
    
TALK2:
    BSR INPUT           ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #99, D1         ;compare literal number 99(character c) with number in hex which is stored in D1
    BEQ DRACO           ;BEQ (Branch if equal) it jumps to TALK if the values which we compared above are equal
    BRA TALK            ;BRA (Branch if not equal) it jumps to TALK if the values which we compare above are not equal
    
RUN:
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$999999,D1  ;set colour to gray
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1           ;clearing D1
    LEA foorest2b, A1   ;it loads string variable foorest2b (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable foorest2b
    SUB D1,D1           ;clearing D1
    MOVE.L #10233,D1    ;set colour to red
    MOVE.B #21, D0
    TRAP #15
    LEA foorest3b,A1    ;it loads string variable foorest3b (Load Effective Address)in to A1
    MOVE.W #14, D0     
    TRAP #15            ;display the string variable foorest3b
    SUB D1,D1           ;clearing D1
    MOVE.L #62000,D1    ;set colour to green
    MOVE.B #21, D0
    TRAP #15
    SUB D1,D1           ;clearing D1
    LEA TREES, A1       ;it loads string variable TREES (Load Effective Address)in to A1
    MOVE.W #14, D0     
    TRAP #15            ;display the string variable TREES
    SUB D1,D1           ;clearing D1
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$999999,D1  ;set colour to gray
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1           ;clearing D1
    LEA foorest4b, A1   ;it loads string variable foorest4b (Load Effective Address)in to A1
    MOVE.W #14, D0     
    TRAP #15            ;display the string variable foorest4b
    MOVE.L $3000, D5    ;moving address location $3000 where we store carbon level into D5
    ADD #1000,D5        ;adding literal number 1000 into D5
    MOVE.L D5, $3000    ;moving back carbon level from D5 to the address location $3000
    BSR UPDATE          ;calling the subroutines( UPDATE ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1           ;clearing D1
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #33284, D1   ;set colour to green
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1           ;clearing D1
    LEA text6, A1       ;it loads string variable text6 (Load Effective Address)in to A1
    MOVE.W #14, D0     
    TRAP #15            ;display the string variable text6
    
RUN2:
    BSR INPUT           ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #99, D1         ;compare literal number 99(character c) with number in hex which is stored in D1
    BEQ DRACO           ;BEQ (Branch if equal) it jumps to DRACO if the values which we compared above are equal
    BRA RUN             ;BRA (Branch if not equal) it jumps to RUN if the values which we compare above are not equal

ATTACK:
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$901DA9,D1  ;set colour to purple
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1           ;clearing D1
    LEA foorest2c, A1   ;it loads string variable foorest2c (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable foorest2c
    SUB D1,D1           ;clearing D1
    MOVE.L #$A9A71D,D1  ;set colour to baby blue
    MOVE.B #21, D0         
    TRAP #15
    LEA foorest3c, A1   ;it loads string variable foorest3c (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable foorest3c
    SUB D1,D1           ;clearing D1
    LEA foorest4c, A1   ;it loads string variable foorest4c (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15            ;display the string variable foorest4c
    MOVE.L #0, D2       ;clearing D2
    MOVE.B SPEAR, D2    ;moving the equate directive for spear into D2
    CMP #1, D2          ;compare literal number 1 with number in hex which is store in D2
    BEQ ATTACK2         ;BEQ (Branch if equal) it jumps to ATTACK2 if the values which we compared above are equal
    
ATTACK1:
    MOVE.W #4, D0
    TRAP #15            ;read the single digit from the keyboard to D1
    CMP #1, D1          ;compare literal number 1 with number in hex which is stored in D1
    BEQ EXITO           ;BEQ (Branch if equal) it jumps to EXITO if the values which we compared above are equal
    CMP #2, D1          ;compare literal number 2 with number in hex which is stored in D1
    BEQ HANDS           ;BEQ (Branch if equal) it jumps to HANDS if the values which we compared above are equal
    MOVE.L #0, D2       ;clearing D2
    MOVE.B SPEAR, D2    ;;moving the equate directive for spear into D2
    CMP #1, D2          ;compare literal number 1 with number in hex which is store in D2
    BEQ ATTACK1A        ;BEQ (Branch if equal) it jumps to ATTACK1A if the values which we compared above are equal
    BRA ATTACK          ;BRA (Branch if not equal) it jumps to ATTACK if the values which we compare above are not equal
    
HANDS:
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$901DA9,D1  ;set colour to purple
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1           ;clearing D1
    LEA handy, A1       ;it loads string variable handy (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15            ;display the string variable handy
    MOVE.L #$A91D2C,D1  ;set colour to blue
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1           ;clearing D1
    LEA handy2, A1      ;it loads string variable handy2 (Load Effective Address)in to A1
    MOVE.W #14, D0        
    TRAP #15            ;display the string variable handy2
    MOVE.L $4000, D5    ;moving memory address $4000 where we store money to D5
    SUB #100, D5        ;sub subtracting literal number 100 from D5
    MOVE.L D5, $4000    ;moving back money into the memory location $4000
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NOMONEY2        ;calling the subroutines( NOMONEY2 ) by the instruction BSR (Branch to subroutine)
    BSR UPDATE
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #33284, D1   ;set colour to green
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1           ;clearing D1
    LEA text6, A1       ;it loads string variable text6 (Load Effective Address)in to A1
    MOVE.W #14, D0     
    TRAP #15            ;display the string variable text6
    BSR INPUT           ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1           ;clearing D1
    CMP #99, D1         ;compare literal number 99(character c) with number in hex which is stored in D1
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE         ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR CLEARSCREEN     ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BEQ HANDS           ;BEQ (Branch if equal) it jumps to DRACO if the values which we compared above are equal
    BRA CHOOSE          ;BRA (Branch if not equal) it jumps to CHOOSE if the values which we compare above are not equal

    
    
ATTACK1A:
    CMP #3, D1           ;compare literal number 3 with number in hex which is stored in D1
    BEQ DEAD             ;BEQ (Branch if equal) it jumps to DEAD if the values which we compared above are equal
    BRA ATTACK1          ;BRA (Branch if not equal) it jumps to ATTACK1 if the values which we compare above are not equal


DEAD:
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    LEA dragondead, A1   ;it loads string variable dragondead (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15             ;display the string variable dragondead
    MOVE.L #$00ff00,D1   ;set colour to blue
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1            ;clearing D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA xxxripxx, A1     ;it loads string variable xxxripxx (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15             ;display the string variable xxxripxx
    BRA END              ;branch to END
   
ATTACK2:
    LEA forest2d, A1     ;it loads string variable forest2d (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15             ;display the string variable forest2d
    BRA ATTACK1          ;branch to ATTACK1
    
    
WIZ:    
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    MOVE.L #$901DA9,D1   ;set colour to purple
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1            ;clearing D1
    LEA wizz, A1         ;it loads string variable wizz (Load Effective Address)in to A1
    MOVE.B #14, D0
    TRAP #15             ;display the string variable wizz
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #33284,D1     ;set colour to green
    MOVE.B #21, D0         
    TRAP #15
    SUB D1,D1            ;clearing D1
    LEA wiztalk, A1      ;it loads string variable wiztalk (Load Effective Address)in to A1
    MOVE.W #14, D0
    TRAP #15             ;display the string variable wiztalk
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA text6, A1        ;it loads string variable text6 (Load Effective Address)in to A1
    MOVE.W #14, D0   
    TRAP #15             ;display the string variable text6
    SUB D1, D1           ;clearing D1
    BSR INPUT            ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #99, D1          ;compare literal number 99(character c) with number in hex which is stored in D1
    BEQ WIZQ1            ;BEQ (Branch if equal) it jumps to WIZQ1 if the values which we compared above are equal
    BRA WIZ              ;BRA (Branch if not equal) it jumps to WIZ if the values which we compare above are not equal
    
WIZQ1: 
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1            ;clearing D1 
    MOVE.L #$A9A71D,D1   ;set colour to baby blue
    MOVE.B #21, D0         
    TRAP #15 
    SUB D1,D1            ;clearing D1 
    LEA Question1, A1    ;it loads string variable Question1 (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable Question1
    SUB D1, D1           ;clearing D1
    BSR INPUTA           ;calling the subroutines( INPUTA ) by the instruction BSR (Branch to subroutine)
    CMP #1, D1           ;compare literal number 1 to the digit  which is stored in D1
    BEQ WRONG1           ;BEQ (Branch if equal) it jumps to WRONG1 if the values which we compared above are equal
    CMP #2, D1           ;compare literal number 2 to the digit  which is stored in D1
    BEQ CORECT1          ;BEQ (Branch if equal) it jumps to CORECT1 if the values which we compared above are equal
    CMP #3, D1           ;compare literal number 3 to the digit  which is stored in D1
    BEQ WRONG1           ;BEQ (Branch if equal) it jumps to WRONG1 if the values which we compared above are equal
    CMP #4, D1           ;compare literal number 4 to the digit  which is stored in D1
    BEQ WRONG1           ;BEQ (Branch if equal) it jumps to WRONG1 if the values which we compared above are equal
    BRA WIZQ1            ;BRA (Branch if not equal) it jumps to WIZQ1 if the values which we compare above are not equal

    
WIZQ2: 
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1            ;clearing D1 
    MOVE.L #$A9A71D,D1   ;set colour to baby blue
    MOVE.B #21, D0         
    TRAP #15 
    SUB D1,D1            ;clearing D1    
    LEA Question2, A1    ;it loads string variable Question2 (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable Question2
    SUB D1, D1           ;clearing D1
    BSR INPUTA           ;calling the subroutines( INPUTA ) by the instruction BSR (Branch to subroutine)
    CMP #1, D1           ;compare literal number 1 to the digit  which is stored in D1
    BEQ WRONG2           ;BEQ (Branch if equal) it jumps to WRONG2 if the values which we compared above are equal
    CMP #2, D1           ;compare literal number 2 to the digit  which is stored in D1
    BEQ CORECT2          ;BEQ (Branch if equal) it jumps to CORECT2 if the values which we compared above are equal
    CMP #3, D1           ;compare literal number 3 to the digit  which is stored in D1
    BEQ WRONG2           ;BEQ (Branch if equal) it jumps to WRONG2 if the values which we compared above are equal
    CMP #4, D1           ;compare literal number 4 to the digit  which is stored in D1
    BEQ WRONG2           ;BEQ (Branch if equal) it jumps to WRONG2 if the values which we compared above are equal
    BRA WIZQ2            ;BRA (Branch if not equal) it jumps to WIZQ2 if the values which we compare above are not equal


WIZQ3: 
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1            ;clearing D1 
    MOVE.L #$A9A71D,D1   ;set colour to baby blue
    MOVE.B #21, D0         
    TRAP #15 
    SUB D1,D1            ;clearing D1  
    LEA Question3, A1    ;it loads string variable Question3 (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable Question3
    SUB D1, D1           ;clearing D1
    BSR INPUTA           ;calling the subroutines( INPUTA ) by the instruction BSR (Branch to subroutine)
    CMP #1, D1           ;compare literal number 1 to the digit  which is stored in D1
    BEQ WRONG3           ;BEQ (Branch if equal) it jumps to WRONG3 if the values which we compared above are equal
    CMP #2, D1           ;compare literal number 2 to the digit  which is stored in D1
    BEQ CORECT3          ;BEQ (Branch if equal) it jumps to CORECT3 if the values which we compared above are equal
    CMP #3, D1           ;compare literal number 3 to the digit  which is stored in D1
    BEQ WRONG3           ;BEQ (Branch if equal) it jumps to WRONG3 if the values which we compared above are equal
    CMP #4, D1           ;compare literal number 4 to the digit  which is stored in D1
    BEQ WRONG3           ;BEQ (Branch if equal) it jumps to WRONG3 if the values which we compared above are equal
    BRA WIZQ3            ;BRA (Branch if not equal) it jumps to WIZQ3 if the values which we compare above are not equal

    
WIZQ4: 
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1            ;clearing D1 
    MOVE.L #$A9A71D,D1   ;set colour to baby blue
    MOVE.B #21, D0         
    TRAP #15 
    SUB D1,D1            ;clearing D1  
    LEA Question4, A1    ;it loads string variable Question4 (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable Question4
    SUB D1, D1           ;clearing D1
    BSR INPUTA           ;calling the subroutines( INPUTA ) by the instruction BSR (Branch to subroutine)
    CMP #1, D1           ;compare literal number 1 to the digit  which is stored in D1
    BEQ WRONG4           ;BEQ (Branch if equal) it jumps to WRONG4 if the values which we compared above are equal
    CMP #2, D1           ;compare literal number 2 to the digit  which is stored in D1
    BEQ CORECT4          ;BEQ (Branch if equal) it jumps to CORECT4 if the values which we compared above are equal
    CMP #3, D1           ;compare literal number 3 to the digit  which is stored in D1
    BEQ WRONG4           ;BEQ (Branch if equal) it jumps to WRONG4 if the values which we compared above are equal
    CMP #4, D1           ;compare literal number 4 to the digit  which is stored in D1
    BEQ WRONG4           ;BEQ (Branch if equal) it jumps to WRONG4 if the values which we compared above are equal
    BRA WIZQ4            ;BRA (Branch if not equal) it jumps to WIZQ4 if the values which we compare above are not equal

    
WIZQ5: 
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    SUB D1,D1            ;clearing D1 
    MOVE.L #$A9A71D,D1   ;set colour to baby blue
    MOVE.B #21, D0         
    TRAP #15 
    SUB D1,D1            ;clearing D1     
    LEA Question5, A1    ;it loads string variable Question5 (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable Question5
    SUB D1, D1           ;clear D1
    BSR INPUTA           ;calling the subroutines( INPUTA ) by the instruction BSR (Branch to subroutine)
    CMP #1, D1           ;compare literal number 1 to the digit  which is stored in D1
    BEQ WRONG5           ;BEQ (Branch if equal) it jumps to WRONG5 if the values which we compared above are equal
    CMP #2, D1           ;compare literal number 2 to the digit  which is stored in D1
    BEQ CORECT5          ;BEQ (Branch if equal) it jumps to CORECT5 if the values which we compared above are equal
    CMP #3, D1           ;compare literal number 3 to the digit  which is stored in D1
    BEQ WRONG5           ;BEQ (Branch if equal) it jumps to WRONG5 if the values which we compared above are equal
    CMP #4, D1           ;compare literal number 4 to the digit  which is stored in D1
    BEQ WRONG5           ;BEQ (Branch if equal) it jumps to WRONG5 if the values which we compared above are equal
    BRA WIZQ5            ;BRA (Branch if not equal) it jumps to WIZQ1 if the values which we compare above are not equal


WRONG1:
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    MOVE.L #10233, D1    ;set colour to red
    MOVE.B #21, D0
    TRAP #15
    LEA invalid, A1      ;it loads string variable invalid (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable invalid
    MOVE.L $3000, D5     ;moving memory address $3000 where we store carbon level to D5
    ADD #1000,D5         ;adding literal number 1000 into D5
    MOVE.L D5, $3000     ;moving back carbon value to memory location $3000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BSR UPDATE           ;branch to subroutine UPDATE by the instruction BSR (Branch to subroutine)
    BRA WIZQ2            ;BRA (Branch if not equal) it jumps to WIZQ1 if the values which we compare above are not equal

    
WRONG2:
    BSR WAIT             ;branch to subroutine( WAIT ) by the instruction BSR (Branch to subroutine)
    MOVE.L #10233, D1    ;set colour to red
    MOVE.B #21, D0
    TRAP #15
    LEA invalid, A1      ;it loads string variable invalid (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable invalid
    MOVE.L $3000, D5     ;moving memory address $3000 where we store carbon level to D5
    ADD #1000,D5         ;adding literal number 1000 into D5
    MOVE.L D5, $3000     ;moveing back carbon level value to memory address $3000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BSR UPDATE           ;branch to subroutine UPDATE by the instruction BSR (Branch to subroutine)
    BRA WIZQ3            ;BRA (Branch if not equal) it jumps to WIZQ3 if the values which we compare above are not equal

    
WRONG3:
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    MOVE.L #10233, D1    ;set colour to red
    MOVE.B #21, D0
    TRAP #15
    LEA invalid, A1      ;it loads string variable invalid (Load Effective Address)in to A1
    MOVE.W #14, D0      
    TRAP #15             ;display the string variable invalid
    MOVE.L $3000, D5     ;moving memory address $3000 where we store carbon level to D5
    ADD #1000,D5         ;adding literal number 1000 into D5
    MOVE.L D5, $3000     ;moveing back carbon level value to memory address $3000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BSR UPDATE           ;branch to subroutine UPDATE by the instruction BSR (Branch to subroutine)
    BRA WIZQ4            ;BRA (Branch if not equal) it jumps to WIZQ4 if the values which we compare above are not equal

    
WRONG4:
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    MOVE.L #10233, D1    ;set colour to red
    MOVE.B #21, D0
    TRAP #15
    LEA invalid, A1      ;it loads string variable invalid (Load Effective Address)in to A1
    MOVE.W #14, D0     
    TRAP #15             ;display the string variable invalid
    MOVE.L $3000, D5     ;moving memory address $3000 where we store carbon level to D5
    ADD #1000,D5         ;adding literal number 1000 into D5
    MOVE.L D5, $3000     ;moveing back carbon level value to memory address $3000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BSR UPDATE           ;branch to subroutine UPDATE by the instruction BSR (Branch to subroutine)
    BRA WIZQ5            ;BRA (Branch if not equal) it jumps to WIZQ5 if the values which we compare above are not equal

    
WRONG5: 
    MOVE.L #10233, D1    ;set colour to red
    MOVE.B #21, D0
    TRAP #15 
    LEA invalid, A1      ;it loads string variable invalid (Load Effective Address)in to A1
    MOVE.W #14, D0       
    TRAP #15             ;display the string variable invalid
    MOVE.L $3000, D5     ;moving memory address $3000 where we store carbon level to D5
    ADD #1000,D5         ;adding literal number 1000 into D5
    MOVE.L D5, $3000     ;moveing back carbon level value to memory address $3000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BSR UPDATE           ;branch to subroutine UPDATE by the instruction BSR (Branch to subroutine)
    BSR CHOOSE           ;branch to subroutine CHOOSE by the instruction BSR (Branch to subroutine)
    
UPDATE:
    MOVE.L $3000, D5     ;moving memory address $3000 where we store carbon level to D5
    CMP #30000, D5       ;compare literal number 30000 which represents MAX value of carbon (30000 of the carbon level finish the game) 
    BGE GAMEOVER         ;branch on greater than or equal to the GAMEOVER
    CMP #0, D5           ;compare literal number 0 to the digit  which is stored in D5 
    BLE NITRO            ;branch if less than to GAMEOVER
    RTS                  ;it returns from Subroutine( UPDATE )    
    
NITRO:
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    MOVE.L #0,D2         ;cleaning D2
    MOVE.L #0,D1         ;cleaning D1
    MOVE.L #33999, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15
    LEA endgame2, A1     ;it loads string variable endgame (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable endgame
    SUB D1,D1            ;clearing D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L #65280, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15
    LEA text4, A1        ;it loads string variable text4 (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable text4
    BSR INPUT            ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #13, D1          ;compare literal number 13(Enter key) to the digit  which is stored in D5
    BEQ RIP              ;BEQ (Branch if equal) it jumps to RIP if the values which we compare above are not 
    BRA GAMEOVER         ;BRA (Branch if not equal) it jumps to GAMEOVER if the values which we compare above are not 


GAMEOVER:
    LEA endgame, A1      ;it loads string variable endgame (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable endgame
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA text4, A1        ;it loads string variable text4 (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable text4
    BSR INPUT            ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
    CMP #13, D1          ;compare literal number 13(Enter key) to the digit  which is stored in D5
    BEQ RIP              ;BEQ (Branch if equal) it jumps to RIP if the values which we compare above are not 
    BRA GAMEOVER         ;BRA (Branch if not equal) it jumps to GAMEOVER if the values which we compare above are not 

RIP:
    MOVE.L #0,$9000      ;clearing memory location $9000
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BRA START            ;branching to START
    
CORECT1:
    MOVE.L #33999, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15 
    LEA valid, A1        ;it loads string variable valid (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable valid
    MOVE.L $4000, D5     ;moving memory address $4000 where we store money to D5
    ADD #1000, D5        ;adding literal number 1000 into D5
    MOVE.L D5, $4000     ;moving back money value to memory address $4000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)  
    BRA WIZQ2            ;branch to WIZQ2
    
CORECT2:
    MOVE.L #33999, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15 
    LEA valid, A1        ;it loads string variable valid (Load Effective Address)in to A1
    MOVE.W #14, D0   
    TRAP #15             ;display the string variable valid
    MOVE.L $4000, D5     ;moving memory address $4000 where we store money to D5
    ADD #1000, D5        ;adding literal number 1000 into D5
    MOVE.L D5, $4000     ;moving back money value to memory address $4000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BRA WIZQ3            ;branch to WIZQ3

CORECT3:
    MOVE.L #33999, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15 
    LEA valid, A1        ;it loads string variable valid (Load Effective Address)in to A1
    MOVE.W #14, D0       
    TRAP #15             ;display the string variable valid
    MOVE.L $4000, D5     ;moving memory address $4000 where we store money to D5
    ADD #1000, D5        ;adding literal number 1000 into D5
    MOVE.L D5, $4000     ;moveing back money value to memory address $4000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BRA WIZQ4            ;branch to WIZQ4

CORECT4:
    MOVE.L #33999, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15 
    LEA valid, A1        ;it loads string variable valid (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable valid
    MOVE.L $4000, D5     ;moving memory address $4000 where we store money to D5
    ADD #1000, D5        ;adding literal number 1000 into D5
    MOVE.L D5, $4000     ;moveing back money value to memory address $4000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BRA WIZQ5            ;branch to WIZQ5

CORECT5:
    MOVE.L #33999, D1    ;set colour to gold
    MOVE.B #21, D0
    TRAP #15
    LEA winner, A1       ;it loads string variable winner (Load Effective Address)in to A1
    MOVE.W #14, D0   
    TRAP #15             ;display the string variable winner
    MOVE.L $4000, D5     ;moving memory address $4000 where we store money to D5
    ADD #1000, D5        ;adding literal number 1000 into D5
    MOVE.L D5, $4000     ;moveing back money value to memory address $4000
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BRA CHOOSE           ;branch to CHOOSE

     
WAIT:                      
    MOVE.W   #100,D1     ;Waits the amount of time specified in D1 in 1/100ths of seconds
    MOVE.B   #23,D0
    TRAP     #15
    RTS                  ;it returns from Subroutine( WAIT )

SOLO:
    MOVE.L #SCOST,D2     ;move the equate directive of the solar panel cost into D2
    BSR NOMONEY          ;branch to subroutine NOMONEY by the instruction BSR (Branch to subroutine)
    MOVE.L #0,D1         ;cleaning D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA solaris, A1      ;it loads string variable solaris (Load Effective Address)in to A1
    MOVE.W #14, D0   
    TRAP #15             ;display the string variable solaris
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    MOVE.L $3000, D5     ;moving memory address $3000 where we store carbon level to D5
    SUB #2000,D5         ;subtracting literal number 2000 from D5
    MOVE.L D5, $3000     ;moving back the carbon level value into the memory location $3000
    MOVE.L $4000, D5     ;moving memory address $4000 where we store money to D5
    SUB #400, D5         ;subtracting literal number 400 from D5
    MOVE.L D5, $4000     ;moving back the money into the memory location $4000
    BSR UPDATE           ;calling the subroutines( UPDATE ) by the instruction BSR (Branch to subroutine)
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BRA SHOP             ;branch to SHOP
    
HUD:
    MOVE.L #5307284,D1   ;set colour to greenish
    MOVE.B #21, D0
    MOVE.B #1,D2         ;change font to bold        
    TRAP #15
    LEA carbon, A1       ;it loads string variable carbon (Load Effective Address)in to A1
    MOVE.L $3000, D1     ;moving memory address $3000 where we store carbon level to D1
    MOVE.B #17, D0       
    TRAP #15             ;it prints string and number
    RTS                  ;it returns from Subroutine( HUD )
    
MONEY:
    MOVE.L #1307284,D1   ;set colour to blue
    MOVE.B #21, D0       
    MOVE.B #1,D2         ;change font to bold         
    TRAP #15
    LEA coins, A1        ;it loads string variable coins (Load Effective Address)in to A1
    MOVE.L $4000, D1     ;moving memory address $4000 where we store the money to D1
    MOVE.B #17, D0
    TRAP #15             ;it prints string and number
    RTS                  ;it returns from Subroutine( MONEY )

    
CLEARSCREEN:
    MOVE.W #$FF00, D1    ;it will clear the screen
    MOVE.B #11, D0
    TRAP #15
    RTS                  ;it returns from Subroutine( CLEARSCREEN )
    
WINDO:
    MOVE.L #WCOST, D2    ;move the equate directive for windmill cost into the D2
    BSR NOMONEY          ;calling the subroutines( NOMONEY ) by the instruction BSR (Branch to subroutine)
    MOVE.L #0,D1         ;cleaning D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA windows, A1      ;it loads string variable windows (Load Effective Address)in to A1
    MOVE.W #14, D0    
    TRAP #15             ;display the string variable windows
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    MOVE.L $3000, D5     ;moving memory address $3000 where we store the carbon level value to D5
    SUB #1000,D5         ;subtracting literal number 1000 from D5
    MOVE.L D5, $3000     ;moving back the carbon level value into the memory location $3000
    MOVE.L $4000, D5     ;moving memory address $4000 where we store the money to D5
    SUB #300, D5         ;subtracting literal number 300 from D5
    MOVE.L D5, $4000     ;moving back the money into the memory location $4000
    BSR UPDATE           ;calling the subroutines( UPDATE ) by the instruction BSR (Branch to subroutine)
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BRA SHOP             ;branch to SHOP

    
TRELE:
    MOVE.L #TCOST, D2    ;moving the equate directive of the tree cost into the D2
    BSR NOMONEY          ;calling the subroutines( NOMONEY ) by the instruction BSR (Branch to subroutine)
    MOVE.L #0,D1         ;cleaning D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA tele, A1         ;it loads string variable tele (Load Effective Address)in to A1
    MOVE.W #14, D0  
    TRAP #15             ;display the string variable tele
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    MOVE.L $3000, D5     ;moving memory address $3000 where we store the carbon level value to D5
    SUB #500,D5          ;subtracting literal number 500 from D5
    MOVE.L D5, $3000     ;moving back the carbon level value into the memory location $3000
    MOVE.L $4000, D5     ;moving memory address $4000 where we store the money to D5
    SUB #200, D5         ;subtracting literal number 200 from D5
    MOVE.L D5, $4000     ;moving back the money into the memory location $4000
    BSR UPDATE           ;calling the subroutines( UPDATE ) by the instruction BSR (Branch to subroutine)
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BRA SHOP


SPEER:
    MOVE.L #SPCOST, D2   ;moving the equate directive of the spear cost into the D2
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR NOMONEY          ;calling the subroutines( NOMONEY ) by the instruction BSR (Branch to subroutine)
    MOVE.L #0,D1         ;cleaning D1
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA tesla, A1        ;it loads string variable tesla (Load Effective Address)in to A1
    MOVE.W #14, D0       
    TRAP #15             ;display the string variable tesla
    BSR WAIT             ;branch to subroutine WAIT by the instruction BSR (Branch to subroutine)
    MOVE.L $4000, D5     ;moving memory address $4000 where we store the money to D5
    SUB #SPCOST, D5      ;subtracting spear cost from D5
    MOVE.L D5, $4000     ;moving back the money into the memory location $4000
    MOVE.L #0, D1        ;cleaning D1
    MOVE.B #1, D1        ;moving literal number 1 to D1
    MOVE.B D1, SPEAR     ;moving D1 into the SPEAR  
    BSR CLEARSCREEN      ;calling the subroutines( CLEARSCREEN ) by the instruction BSR (Branch to subroutine)
    BSR HUD              ;calling the subroutines( HUD ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BSR MONEY            ;calling the subroutines( MONEY ) by the instruction BSR (Branch to subroutine)
    BSR NEWLINE          ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    BRA SHOP             ;branch to SHOP


END:
    SIMHALT              ;halt simulator
    
endgame dc.b $0d,$0a,$0d,$0a
        dc.b 'GAME OVER',0         ;variable endgame terminated with null '0'
        
endgame2 dc.b $0d,$0a
         dc.b $09,$09,$09,'CARBON REDUSED TO ZERO',$0d,$0a
         dc.b $09,$09,$09,'YOU WON THE GAME!!!!   ',$0d,$0a,0      ;variable endgame terminated with null '0'        
        
valid  dc.b $0d,$0a
       dc.b $09,$09,$09,'Congratulation you have answered correct',$0d,$0a    ;$0d stand for a new line and $0a move to the left
       dc.b $09,$09,$09,'for the question',$0d,$0a  
       dc.b $09,$09,$09,$09,$09,$09,'YOU are rewarded by $1000  ',$0d,$0a,0   ;variable valid terminated with null '0'
       
winner dc.b $0d,$0a
       dc.b $09,$09,$09,'Congratulation you have answered correct',$0d,$0a    ;$0d stand for a new line and $0a move to the left
       dc.b $09,$09,$09,'for the last questions',$0d,$0a  
       dc.b $09,$09,$09,$09,$09,$09,'YOU WON THE PRICE  ',$0d,$0a,0           ;variable winner terminated with null '0'
 
invalid dc.b $0d,$0a
        dc.b $09,$09,$09,'I am sorry you have answered wrong',$0d,$0a         ;$0d stand for a new line and $0a move to the left
        dc.b $09,$09,$09,'for the question',$0d,$0a  
        dc.b $09,$09,$09,$09,$09,$09,'We increased carbon level by 1000  ',$0d,$0a,0  ;variable invalid terminated with null '0'
   
text1 dc.b 'Please enter your name ',0    ;variable text1 terminated with null '0'

text2 dc.b '          HI ' ,0             ;variable text2 terminated with null '0'

welcome dc.b '   +------------------------------------------------------------+'     
        dc.b  $0d,$0a                                                                ;$0d stand for a new line and $0a move to the left
        dc.b '   |                 Welcome to the adventure game!!            |'  
        dc.b  $0d,$0a                                                       
        dc.b '   +------------------------------------------------------------+'     ;variable welcome terminated with null '0'
        dc.b  $0d,$0a, 0 
                                                            
welcome2 dc.b ' ARE YOU READY TO JOIN THE PLANET DEFENDERS TEAM '
         dc.b  $0d,$0a                                                               ;$0d stand for a new line and $0a move to the left
         dc.b '               AND SAVE THE WORLD FROM GLOBAL WARMING?!!!  '
         dc.b  $0d,$0a ,0                                                            ;variable welcome2 terminated with null '0'
         
enter   dc.b 'Press ENTER to go inside the shop',0       ;variable enter terminated with null '0'

forent  dc.b 'Press ENTER to go inside the forest',0     ;variable forent terminated with null '0'     

earth   dc.b '                                                              '
        dc.b  $0d,$0a                                                           
        dc.b '                                                              '
        dc.b  $0d,$0a                                                       
        dc.b '                         _-o#&&*''''?d:>b\_                   '
        dc.b  $0d,$0a 
        dc.b '                     _o/"`''  '',, dMF9MMMMMHo_               '
        dc.b  $0d,$0a
        dc.b '                   .o&#         `"MbHMMMMMMMMMMMHo.           '
        dc.b  $0d,$0a
        dc.b '                  .o""           vodM*$&&HMMMMMMMMMM?.        '
        dc.b  $0d,$0a
        dc.b '                ,.              $M&ood,~ `(&##MMMMMMH\        '
        dc.b  $0d,$0a
        dc.b '               /               ,MMMMMMM#b?#bobMMMMHMMML       '
        dc.b  $0d,$0a
        dc.b '              &              ?MMMMMMMMMMMMMMMMM7MMM$R*Hk      '
        dc.b  $0d,$0a
        dc.b '             ?$.            :MMMMMMMMMMMMMMMMMMM/HMMM|`*L     '
        dc.b  $0d,$0a
        dc.b '            |               |MMMMMMMMMMMMMMMMMMMMbMH    T,    '
        dc.b  $0d,$0a
        dc.b '            $H#:            `*MMMMMMMMMMMMMMMMMMMMb#}   `?    '
        dc.b  $0d,$0a
        dc.b '            ]MMH#             ""*""""*#MMMMMMMMMMMMM     -    '
        dc.b  $0d,$0a
        dc.b '            MMMMMb_                   |MMMMMMMMMMMP      :    '
        dc.b  $0d,$0a
        dc.b '            HMMMMMMMHo                 `MMMMMMMMMT       .    '
        dc.b  $0d,$0a
        dc.b '            ?MMMMMMMMP                  9MMMMMMMM}       -    '
        dc.b  $0d,$0a
        dc.b '            -?MMMMMMM                  |MMMMMMMMM?,d-    '    '
        dc.b  $0d,$0a
        dc.b '            :|MMMMMM-                 `MMMMMMMT .M|.   :      ' 
        dc.b  $0d,$0a
        dc.b '             .9MMM[                    &MMMMM*  `     /       '
        dc.b  $0d,$0a
        dc.b '              :9MMk                    `MMM#"        -        '
        dc.b  $0d,$0a
        dc.b '                 &M}                     `          .-        '
        dc.b  $0d,$0a
        dc.b '                  `&.                             .           '
        dc.b  $0d,$0a
        dc.b '                    `~,   .                     ./            '
        dc.b  $0d,$0a
        dc.b '                        . _                  .-               '
        dc.b  $0d,$0a
        dc.b '                           `--._,dd###pp=""                   '
        dc.b  $0d,$0a                                                       
        dc.b  $0d,$0a, 0                                                      ;variable earth terminated with null '0'
                                                                              ;REFERENCES: https://www.asciiart.eu/space/planets
        
        
        
snoop   dc.b '                                                              '
        dc.b  $0d,$0a
        dc.b '                                 .----.                       '
        dc.b  $0d,$0a
        dc.b '                                 |-.-.|                       '
        dc.b  $0d,$0a                                 
        dc.b '               __________________|;-;-|__                     '
        dc.b  $0d,$0a               
        dc.b '             ."                  "----"  ".                   '
        dc.b  $0d,$0a             
        dc.b '             . """""""""""""""""""""""""""" .                 '
        dc.b  $0d,$0a             
        dc.b '           .   ."""""".   .--""""""""""-,   .                 '
        dc.b  $0d,$0a           
        dc.b '             . """.       """  .--"""""--.. """ .             '
        dc.b  $0d,$0a             
        dc.b '            .""""""-"""""-  .-"   |"|"|   ."""""".            '
        dc.b  $0d,$0a            
        dc.b '         .   ."".".     ."      |"|"|    .      .             '
        dc.b  $0d,$0a         
        dc.b '          "._( ()   \""".  _     _"""  _   .____."            '
        dc.b  $0d,$0a          
        dc.b '            |.".  ()"   " --------------------.|              '
        dc.b  $0d,$0a           
        dc.b '            ||  "--"""""""          |         ||              '
        dc.b  $0d,$0a            
        dc.b '            ||    ".------"     |""|""|""|    ||              '
        dc.b  $0d,$0a            
        dc.b '            ||     |.-.-.||-----|--|--|--|----||              '
        dc.b  $0d,$0a            
        dc.b '            ||     || | |||     |__|_-"-_|    ||              '
        dc.b  $0d,$0a            
        dc.b '            ||     ||_|_|||    .-"-" ()  ".   ||              '
        dc.b  $0d,$0a            
        dc.b '            || .--.| [-] ||   ." ()     () .  ||              '
        dc.b  $0d,$0a            
        dc.b '            | "    |     ||-------------------||              ' 
        dc.b '                                                              '                                                      
        dc.b  $0d,$0a                                                            
        dc.b  $0d,$0a, 0                                                            ;variable snoop terminated with null '0'
                                                                                    ;REFERENCES https://asciiart.cc/view/11654

TREES   dc.b $09,'                                                                       ',$0A,$0D
        dc.b $09,'	         			                	   			                 ',$0A,$0D
        dc.b $09,'    69696969696             69696969696             69696969696        ',$0A,$0D
        dc.b $09,'  696969969696969         696969969696969         696969969696969      ',$0A,$0D
        dc.b $09,' 969696969696696969     9696969696966969696     9696969696966969696    ',$0A,$0D
        dc.b $09,'96969696966696969696    96969696966696969696    96969696966696969696   ',$0A,$0D
        dc.b $09,'969696969669696969696  696969696696969696966   696969696696969696966   ',$0A,$0D
        dc.b $09,'696969696969696969696  969696969696969696969   969696969696969696969   ',$0A,$0D
        dc.b $09,' 6969696969696969696    69696969696969696969    69696969696969696969   ',$0A,$0D
        dc.b $09,'  6969696966696969        6969696966696969        6969696966696969     ',$0A,$0D
        dc.b $09,'    9696969969696           9696969969696           9696969969696      ',$0A,$0D
        dc.b $09,'       96969696                96969696                96969696        ',$0A,$0D
        dc.b $09,'         96                      96                      96            ',$0A,$0D
        dc.b $09,'         69                      69                      69            ',$0A,$0D
        dc.b $09,'        6969                    6969                    6969           ',$0A,$0D,0    ;variable TREES terminated with null '0'
                                                                                                        ;REFERENCES https://textart.io/art/tag/tree/1
                                             

wizz   dc.b $09,'                  . * *.                    ',$0A,$0D
       dc.b $09,'                __/_*_*(_                   ',$0A,$0D
       dc.b $09,'               / _______ \                  ',$0A,$0D
       dc.b $09,'              _\_)/___\(_/_                 ',$0A,$0D
       dc.b $09,'             / _((\- -/))_ \                ',$0A,$0D
       dc.b $09,'             \ \())(-)(()/ /                ',$0A,$0D
       dc.b $09,'              |  \(((()))/ |                ',$0A,$0D
       dc.b $09,'             /   \)).))/   \                ',$0A,$0D
       dc.b $09,'            / _ \ - | - /_  \               ',$0A,$0D
       dc.b $09,'           (   ( .;   ;. .   )              ',$0A,$0D
       dc.b $09,'           _\ __ /    )\ __ /_              ',$0A,$0D
       dc.b $09,'             \/  \     /  \/                ',$0A,$0D
       dc.b $09,'             ( .    ...   )                 ',$0A,$0D
       dc.b $09,'               / /  |  \ \                  ',$0A,$0D
       dc.b $09,'              / .   .   . \                 ',$0A,$0D
       dc.b $09,'             /   .     .   \                ',$0A,$0D
       dc.b $09,'            /   /   |   \   \               ',$0A,$0D
       dc.b $09,'           .|   /    .     .   .            ',$0A,$0D
       dc.b $09,'       _.-|    /     |     -. -._           ',$0A,$0D
       dc.b $09,'     _.-|       |    |       |-.  |-.       ',$0A,$0D
       dc.b $09,'   (___________\____.___.________)____)     ',$0A,$0D,0            ;variable wizz terminated with null '0'
                                                                                    ;REFERENCES https://www.asciiart.eu/people/occupations/wizards


FOUNDS dc.b $0d,$0a                                    
       dc.b 'You have insuficient money',$0d,$0a,0      ;variable FOUNDS terminated with null '0'
       
FOUNDS2 dc.b $0d,$0a                                    
        dc.b 'You do not have any money',$0d,$0a,0      ;variable FOUNDS2 terminated with null '0'       
                                                                                    
tesla dc.b $0d,$0a
      dc.b 'You have bought the speer of destiny',$0d,$0a,0     ;variable tesla terminated with null '0'
                                                                                        

Question1 dc.b  $0d,$0a,$0d,$0a,$0d,$0a       
          dc.b 'QUESTION 1',$0d,$0a
          dc.b 'What effects does climate change on rainfall?',$0d,$0a,$0d,$0a   
          dc.b '[Press 1]  The rain that falls is warmer'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 2]  In some places rainfall is increased and in others it is decreased'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 3]  None'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 4]  There is more rainfall everywhere '
          dc.b  $0d,$0a,0                                                           ;variable Question1 terminated with null '0'
                                                                                    

Question2 dc.b  $0d,$0a,$0d,$0a,$0d,$0a 
          dc.b 'QUESTION 2',$0d,$0a
          dc.b 'Ireland is the sixth most generous aid donor per person in the OECD.',$0d,$0a
          dc.b 'Where do we come in the OECD rankings of greenhouse gas pollution per person?',$0d,$0a,$0d,$0a       
          dc.b '[Press 1]  17th'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 2]  6th'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 3]  9th'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 4]  20th'
          dc.b  $0d,$0a,0                            ;variable Question2 terminated with null '0'

          
Question3 dc.b  $0d,$0a,$0d,$0a,$0d,$0a 
          dc.b 'QUESTION 3',$0d,$0a
          dc.b 'How can less rainfall cause famine in Africa?',$0d,$0a,$0d,$0a   
          dc.b '[Press 1]  It doesn’t'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 2]  Many local farmers depend on rain-fed agriculture'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 3]  Less weeds can grow'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 4]  It causes wells to overflow '
          dc.b  $0d,$0a,0                                 ;variable Question3 terminated with null '0'

          
Question4 dc.b  $0d,$0a,$0d,$0a,$0d,$0a 
          dc.b 'QUESTION 4',$0d,$0a
          dc.b 'Why is climate change a cause for concern in Ireland?',$0d,$0a,$0d,$0a   
          dc.b '[Press 1]  We are likely to run out of ice cream'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 2]  There will be more unpredictable flooding events and possibilities'
          dc.b '           of drought in the east in summer'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 3]  It is no cause for concern'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 4]  We won’t be able to grow any food anymore'
          dc.b  $0d,$0a,0                                ;variable Question4 terminated with null '0'


Question5 dc.b  $0d,$0a,$0d,$0a,$0d,$0a 
          dc.b 'QUESTION 5',$0d,$0a
          dc.b 'Which of these gases does not contribute to the greenhouse effect?',$0d,$0a,$0d,$0a   
          dc.b '[Press 1]  Water vapour'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 2]  Oxygen'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 3]  Carbon dioxide'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b '[Press 4]  Methane '
          dc.b  $0d,$0a,0                                   ;variable Question5 terminated with null '0'

    
        
text3 dc.b 'THE CARBON TOTAL : ', 0                         ;variable text3 terminated with null '0'

text4 dc.b 'PRESS ENTER TO START THE GAME ', 0              ;variable text4 terminated with null '0'

text5 dc.b 'THE MONEY TOTAL : ', 0                          ;variable text5 terminated with null '0'

text6 dc.b 'PLEASE ENTER C TO CONTINUE ', 0                 ;variable text6 terminated with null '0'

text7 dc.b 'PRESS F FOR FOREST OR S FOR SHOOP ' ,0          ;variable text7 terminated with null '0'

text8 dc.b 'YOU ARE STARTING GAME WITH: ',0                 ;variable text8 terminated with null '0'

dragon dc.b 'Dragon', 0                                     ;variable dragon terminated with null '0'

wizard dc.b 'Wizard', 0                                     ;variable wizard terminated with null '0'

description dc.b 'The aim for this game is to reduce '
            dc.b  $0d,$0a 
            dc.b 'the amount of the carbon on the earth to prevent '
            dc.b  $0d,$0a 
            dc.b 'THE GLOBAL WARMING'
            dc.b  $0d,$0a, 0                                ;variable description terminated with null '0'
            
description2 dc.b 'To reduce the carbon level we can buy some items from the shop.'
             dc.b  $0d,$0a
             dc.b 'SOLAR PANELS'
             dc.b  $0d,$0a
             dc.b 'WINDMILLS'
             dc.b  $0d,$0a
             dc.b 'TREES'
             dc.b  $0d,$0a
             dc.b 'We can also play against some characters '
             dc.b 'at the game and win the price'
             dc.b  $0d,$0a, 0                                ;variable description2 terminated with null '0'

soop dc.b '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'  
     dc.b  $0d,$0a 
     dc.b '                                                  '
     dc.b  $0d,$0a
     dc.b '                                                  '     
     dc.b  $0d,$0a         
     dc.b '      $$$$$$\  $$\   $$\  $$$$$$\  $$$$$$$\       '
     dc.b  $0d,$0a
     dc.b '      $$  __$$\ $$ |  $$ |$$  __$$\ $$  __$$\     '
     dc.b  $0d,$0a
     dc.b '      $$ /  \__|$$ |  $$ |$$ /  $$ |$$ |  $$ |    '
     dc.b  $0d,$0a
     dc.b '      \$$$$$$\  $$$$$$$$ |$$ |  $$ |$$$$$$$  |    '
     dc.b  $0d,$0a
     dc.b '      \____$$\ $$  __$$ |$$ |  $$ |$$  ____/      '
     dc.b  $0d,$0a
     dc.b '      $$\   $$ |$$ |  $$ |$$ |  $$ |$$ |          '
     dc.b  $0d,$0a
     dc.b '      \$$$$$$  |$$ |  $$ | $$$$$$  |$$ |          '
     dc.b  $0d,$0a
     dc.b '      \______/ \__|  \__| \______/ \__|           '
     dc.b  $0d,$0a
     dc.b '                                                  '
     dc.b  $0d,$0a
     dc.b '                                                  '
     dc.b  $0d,$0a
     dc.b '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'                                         
     dc.b  $0d,$0a, 0                                             ;variable soop terminated with null '0'
                                                                  ;REFERENCES https://patorjk.com/software/taag/#p=testall&f=Graffiti&t=Shop
 
foorest dc.b '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$' 
        dc.b  $0d,$0a 
        dc.b '                                                                        '
        dc.b  $0d,$0a
        dc.b '                                                                        '     
        dc.b  $0d,$0a          
        dc.b        '8888888888 .d88888b.  8888888b.  8888888888 .d8888b. 88888888888 '
        dc.b  $0d,$0a 
        dc.b        '888       d88P" "Y88b 888   Y88b 888       d88P  Y88b    888     '
        dc.b  $0d,$0a 
        dc.b        '888       888     888 888    888 888       Y88b.         888     '
        dc.b  $0d,$0a
        dc.b        '8888888   888     888 888   d88P 8888888    "Y888b.      888     '
        dc.b  $0d,$0a
        dc.b        '888       888     888 8888888P"  888           "Y88b.    888     '
        dc.b  $0d,$0a
        dc.b        '888       888     888 888 T88b   888             "888    888     '
        dc.b  $0d,$0a
        dc.b        '888       Y88b. .d88P 888  T88b  888       Y88b  d88P    888     '
        dc.b  $0d,$0a
        dc.b        '888        "Y88888P"  888   T88b 8888888888 "Y8888P"     888     '
        dc.b  $0d,$0a
        dc.b '                                                                        '
        dc.b  $0d,$0a
        dc.b '                                                                        '
        dc.b  $0d,$0a
        dc.b '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'                                         
        dc.b  $0d,$0a, 0                                                            ;variable foorest terminated with null '0'
                                                                                    ;REFERENCES https://patorjk.com/software/taag/#p=testall&f=Graffiti&t=FOREST


handy      dc.b  $0d,$0a
           dc.b $09,$09,$09,'You strike the dragon with your bare hands.                  ',$0d,$0a 
           dc.b $09,$09,$09,'The angry dragon hits you with its tail, tearing apart       ',$0d,$0a 
           dc.b $09,$09,$09,'the contents of your sack. You lose some of your money($100) ',$0d,$0a 
           dc.b $09,$09,$09,'and the dragon flies away.                                   ',$0d,$0a,0  ;variable handy terminated with null '0'
                                                                                    
 
handy2 dc.b '                        _______________________                                ',$0A,$0D
       dc.b '                       /                      /                                ',$0A,$0D
       dc.b '                       | DON NOT TURN BACK    |                                ',$0A,$0D
       dc.b '               //////  | FROM ME!! YOU COWARD!|  ____               ____       ',$0A,$0D
       dc.b '               |  # o  | I DARE YOU DRAGON !!!| |    *****\_      --/ *\-__    ',$0A,$0D
       dc.b '               C   - | /_____________________/ /_          (_    ./ ,/----     ',$0A,$0D
       dc.b '   __          I  =__        ___               \__         (_./  /             ',$0A,$0D
       dc.b '(` _ \_       |   |        _/   )                 \__           \___----^__    ',$0A,$0D
       dc.b '  \  (__\  ,---- _ |----.  /__)- |                   _/   _                 \  ',$0A,$0D
       dc.b '   \__  ( (           /  ) )  __/             |    _/  __/ )\"\ _____        | ',$0A,$0D
       dc.b '     |_X_\/ \.   #  _.|  \/_X_|               |\__/   /    ^ ^       \____   | ',$0A,$0D
       dc.b '       |  \ /(   /    /\ /  |                  \___--"                    \_/  ',$0A,$0D
       dc.b '        \ /  (  ,    /  \ _/                                                   ',$0A,$0D
       dc.b '             /______/                                                          ',$0A,$0D
       dc.b '            [:::::::]                                                          ',$0A,$0D
       dc.b '           /*%*%*%*%*\                                                         ',$0A,$0D
       dc.b '           >%*%#%*%*%|                                                         ',$0A,$0D
       dc.b '          /%*%*#*%*%*\                                                         ',$0A,$0D
       dc.b '         ######^######£                                                        ',$0A,$0D,0   ;variable handy2 terminated with null '0'
                                                                                                          ;REFERENCES https://ascii.co.uk/art/boxer
                                                                                                          ;REFERENCES https://www.asciiart.eu/mythology/dragons

                                                      
foorest2 dc.b 'In the forest you have to choose between right and left path '  
         dc.b  $0d,$0a       
         dc.b  $0d,$0a
         dc.b 'Press L to go by left path '
         dc.b  $0d,$0a
         dc.b  $0d,$0a
         dc.b 'Press R to go by right path '
         dc.b  $0d,$0a
         dc.b  $0d,$0a
         dc.b 'Press E to exit'
         dc.b  $0d,$0a
         dc.b  $0d,$0a, 0                         ;variable foorest2 terminated with null '0'
                                                                                    
         
wiztalk dc.b  $0d,$0a
        dc.b 'I can reward you with $1000 dolars price  '
        dc.b  $0d,$0a
        dc.b 'if you answer one of my questions         '
        dc.b  $0d,$0a,0                           ;variable wiztalk terminated with null '0'


dragondead dc.b $0d,$0a
           dc.b $09,$09,$09,'Congratulation you have terminated the dragon',$0d,$0a
           dc.b $09,$09,$09,'The planet is safe now from the global warming',$0d,$0a  
           dc.b $09,$09,$09,$09,$09,$09,'YOU WON THE GAME  ',$0d,$0a,0              ;variable dragondead terminated with null '0'
           
          
xxxripxx  dc.b $09,$09,'		                                                         ',$0A,$0D
          dc.b $09,$09,'                       ____________                              ',$0A,$0D
          dc.b $09,$09,'                       >          (                              ',$0A,$0D
          dc.b $09,$09,'                      |   _     _  |                             ',$0A,$0D
          dc.b $09,$09,'                      |  |_) | |_) |                             ',$0A,$0D
          dc.b $09,$09,'                      |  | \ | |   |                             ',$0A,$0D
          dc.b $09,$09,'                      |            |                             ',$0A,$0D
          dc.b $09,$09,'       ______.______%_|            |__________  _____            ',$0A,$0D
          dc.b $09,$09,'     _/                                       \|     |           ',$0A,$0D
          dc.b $09,$09,'    |                 DRAGON DRACOVIC                <           ',$0A,$0D
          dc.b $09,$09,'    |_____.-._________              ____/|___________|           ',$0A,$0D
          dc.b $09,$09,'                      | * 20/ll/01 |                             ',$0A,$0D
          dc.b $09,$09,'                      | + 19/10/21 |                             ',$0A,$0D
          dc.b $09,$09,'                      |            |                             ',$0A,$0D
          dc.b $09,$09,'                      |            |                             ',$0A,$0D
          dc.b $09,$09,'                      |   _        <                             ',$0A,$0D
          dc.b $09,$09,'                      |__/         |                             ',$0A,$0D
          dc.b $09,$09,'                       / `--.      |                             ',$0A,$0D
          dc.b $09,$09,'                     %|            |%                            ',$0A,$0D
          dc.b $09,$09,'                 |/.%%|          -< @%%%                         ',$0A,$0D
          dc.b $09,$09,'                 `\%`@|     v      |@@%@%%                       ',$0A,$0D
          dc.b $09,$09,'               .%%%@@@|%    |    % @@@%%@%%%%                    ',$0A,$0D
          dc.b $09,$09,'          _.%%%%%%@@@@@@%%_/%\_%@@%%@@@@@@@%%%%%%                ',$0A,$0D,0      ;variable xxxripxx terminated with null '0'
                                                                                                          ;REFERENCES https://ascii.co.uk/art/rip


        
                
fooorest2 dc.b 'As I walking through the forest suddenly hear a terrible ROAR',$0d,$0a 
          dc.b 'A looming shadow swooped over my head and with a great ',$0d,$0a 
          dc.b 'gush of wind and the crushing thud a dragon lands in front of you',$0d,$0a 
          dc.b 'He doesn not look very friendly',$0d,$0a,$0d,$0a  
          dc.b 'Press 1 to charm the dragon '
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b 'Press 2 to run past the dragon'
          dc.b  $0d,$0a
          dc.b  $0d,$0a
          dc.b 'Press 3 to attack the dragon '
          dc.b  $0d,$0a
          dc.b  $0d,$0a,0        ;variable fooorest2 terminated with null '0'

foorest2a dc.b $0d,$0a,$0d,$0a,$0d,$0a
          dc.b $09,$09,$09,'You talk to the dragon he ROAR angry                                ',$0d,$0a,0 ;variable foorest2a terminated with null '0'
          
foorest3a dc.b '																		         ',$0A,$0D
          dc.b '   (  )   /\   _                 (                                              ',$0A,$0D
          dc.b '    \ |  (  \ ( \.(               )                      _____                  ',$0A,$0D
          dc.b '  \  \ \  `  `   ) \             (  ___                 / _   \                 ',$0A,$0D
          dc.b ' (_`    \+   . x  ( .\            \/   \____-----------/ (o)   \_               ',$0A,$0D
          dc.b '  .-               \+  ;          (  O                           \____          ',$0A,$0D
          dc.b '                          )        \_____________  `              \  /          ',$0A,$0D
          dc.b ' __                +- .( - .- <. - _  VVVVVVV VV V\                 \/          ',$0A,$0D
          dc.b ' _____            ._._: <_ - <- _  (--  _AAAAAAA__A_/                  |        ',$0A,$0D
          dc.b '  .    /./.+-  . .- /  +--  - .     \______________//_              \_______    ',$0A,$0D
          dc.b '  (__ / /x  / x _/ (                                  \___           \     /    ',$0A,$0D
          dc.b ' , x / (    . / .  /                                      |           \   /     ',$0A,$0D
          dc.b '    /  /  _/ /    +                                      /              \/      ',$0A,$0D
          dc.b '      (__/                                             /                  \     ',$0A,$0D
          dc.b '                                                                                ',$0A,$0D
          dc.b '                                                                                ',$0A,$0D,0 ;variable foorest3a terminated with null '0'
                                                                                                            ;REFERENCES https://www.asciiart.eu/mythology/dragons


foorest4a dc.b $09,$09,$09,'I do not think that he speaks English                               ',$0d,$0a,0  ;variable foorest4a terminated with null '0'
                                                                                                       


          
          
          
          
foorest2b dc.b $0d,$0a,$0d,$0a,$0d,$0a         
          dc.b $09,$09,'You attempted to run past him but he takes a deep breath and shoot ',$0d,$0a 
          dc.b $09,$09,'a great gust of flame. You bearly manage to avoid the fire but ',$0d,$0a 
          dc.b $09,$09,$09,$09,$09,'it was not very good for environment  ',$0d,$0a,0             ;variable foorest2b terminated with null '0'
                                                                                                         




       
foorest4b dc.b $09,$09,'Some part of the forest is on fire ( + 1000 carbodioxiade )',$0d,$0a,0    ;variable foorest4b terminated with null '0'
                                                                                                




foorest3b dc.b $09,'                                                                       ',$0A,$0D      
          dc.b $09,'                             ,.   (   .      )        .      "         ',$0A,$0D
          dc.b $09,'                     ("     )  )      ,         )  . (`      `         ',$0A,$0D
          dc.b $09,'                   .; )  " (( (" )    ;(,     ((  (  ;)  "  )"         ',$0A,$0D
          dc.b $09,'               _"., ,._"_.,)_(..,( . )_  _  )_ ) (. _..(  .. )         ',$0A,$0D,0    ;variable foorest3b terminated with null '0'
                                                                                                          ;REFERENCES https://ascii.co.uk/art/fire


              
          
foorest2c dc.b $0d,$0a,$0d,$0a
          dc.b $09,$09,'You decide to attack the dragon',$0d,$0a,$0d,$0a 
          dc.b $09,$09,'What do you want the attack the dragon with ',$0d,$0a,0   ;variable foorest2c terminated with null '0'
                                                                                                          


          



foorest3c dc.b '                _                        ',$0A,$0D
          dc.b '              _( }                       ',$0A,$0D
          dc.b '    -=   _  <<  \                        ',$0A,$0D
          dc.b '        `.\__/`/\\   Press 1 to run away ',$0A,$0D
          dc.b '  -=      "--"\\  `                      ',$0A,$0D
          dc.b '       -=     //                         ',$0A,$0D
          dc.b '              \)                         ',$0A,$0D,0  ;variable foorest3c terminated with null '0'
                                                                      ;REFERENCES https://ascii.co.uk/art/running



foorest4c dc.b '                                      _______________________       ',$0A, $0D
          dc.b '                                     /                       /      ',$0A, $0D
          dc.b '                                     | COME ON! COME ON!     |      ',$0A, $0D
          dc.b '                   //////            | HIT ME! HIT ME!       |      ',$0A, $0D
          dc.b '                   |  # o            | I DARE YOU DRAGON !!! |      ',$0A, $0D
          dc.b '                   C   - | ----------/_______________________/      ',$0A, $0D
          dc.b '      ___          I  =__        ___                                ',$0A, $0D
          dc.b '     (` _ \_       |   |        _/   )                              ',$0A, $0D
          dc.b '      \  (__\  ,---- _ |----.  /__)- |                              ',$0A, $0D
          dc.b '       \__  ( (           /  ) )  __/                               ',$0A, $0D
          dc.b '         |_X_\/ \.   #  _.|  \/_X_|                                 ',$0A, $0D
          dc.b '           |  \ /(   /    /\ /  |   Press 2 to  use your bare hands ',$0A, $0D
          dc.b '            \ /  (  ,    /  \ _/                                    ',$0A, $0D
          dc.b '                 /______/                                           ',$0A, $0D
          dc.b '                [:::::::]                                           ',$0A, $0D,0 ;variable foorest4c terminated with null '0'
                                                                                                 ;REFERENCES https://ascii.co.uk/art/boxer


                    



          
forest2d dc.b $0d,$0a
         dc.b $09,$09,$09,$09,'Press 3 to attack drago with spear ',$0A, $0D
         dc.b $09,$09,$09,$09,'                                   ',$0A, $0D 
         dc.b $09,$09,$09,$09,'           THE MAGIC SPEAR         ',$0A, $0D
         dc.b $09,$09,$09,$09,'>>-;;;-----------------------;;--> ',$0A, $0D,0     ;variable forest2d terminated with null '0'
                                                                                                               
       
         
         
dracon dc.b $09,'    				___====-_  _-====___                       ',$0A,$0D
       dc.b $09,'               _--^^^#####//      \\#####^^^--_               ',$0A,$0D
       dc.b $09,'           _-^##########// (    ) \\##########^-_             ',$0A,$0D
       dc.b $09,'           -############//  |\^^/|  \\############-           ',$0A,$0D
       dc.b $09,'         _/############//   (@::@)   \\############\_         ',$0A,$0D
       dc.b $09,'        /#############((     \\//     ))#############\        ',$0A,$0D
       dc.b $09,'       -###############\\    (oo)    //###############-       ',$0A,$0D
       dc.b $09,'      -#################\\  / VV \  //#################-      ',$0A,$0D
       dc.b $09,'     -###################\\/      \//###################-     ',$0A,$0D
       dc.b $09,'    _#/|##########/\######(   /\   )######/\##########|\#_    ',$0A,$0D
       dc.b $09,'   |/ |#/\#/\#/\/  \#/\##\  |  |  /##/\#/  \/\#/\#/\#| \|     ',$0A,$0D
       dc.b $09,'    `  |/  V  V  `   V  \#\| |  | |/#/  V     V  V  \|        ',$0A,$0D
       dc.b $09,'       `   `  `      `   / | |  | | \                         ',$0A,$0D
       dc.b $09,'                        (  | |  | |  )                        ',$0A,$0D
       dc.b $09,'                       __\ | |  | | /__                       ',$0A,$0D
       dc.b $09,'                     (vvv(VVV)(VVV)vvv)                       ',$0A,$0D,0 ;variable dracon terminated with null '0'
                                                                                           ;REFERENCES https://www.asciiart.eu/mythology/dragons


            
coins    dc.b 'Total MONEY: $ ',0  ;variable coins terminated with null '0'


carbon  dc.b  'Total Carbon:   ',0   ;variable carbon terminated with null '0'
          
                                                
solaris dc.b 'You just have bought 1 SOLAR PANEL',0   ;variable solaris terminated with null '0'

                                                                 
windows dc.b 'You just have bought 1 WINDMILL',0      ;variable windows terminated with null '0'


tele  dc.b 'You just have bought 1 TREE',0         ;variable tele terminated with null '0'

      
solar dc.b  $0d,$0a
      dc.b 'DO YOU WANT TO BAY A SOLAR PANEL PRESS A  ($400)',$0d,$0a
      dc.b 'IT REDUCE CARBON LEVEL BY 2000',0                          
                                                      ;variable solar terminated with null '0'
      
wind  dc.b  $0d,$0a
      dc.b 'DO YOU WANT TO BAY A WINDMILL PRESS B ($300)',$0d,$0a      
      dc.b 'IT REDUCE CARBON LEVEL BY 1000',0                          ;variable wind terminated with null '0'
      
tree  dc.b  $0d,$0a
      dc.b 'DO YOU WANT TO BAY A TREE PRESS C ($200)',$0d,$0a 
      dc.b 'IT REDUCE CARBON LEVEL BY 500',0                          ;variable tree terminated with null '0'
      
wapon dc.b  $0d,$0a
      dc.b 'DO YOU WANT TO BAY A SPEAR PRESS D ($3000)',$0d,$0a
      dc.b 'IF YOU COLLECT ENOUGH MONEY YOU CAN BUY THE SPEAR',0     ;variable wapon terminated with null '0'
      
exit  dc.b  $0d,$0a        
      dc.b 'DO YOU WANT TO EXIT PRESS E '                          
      dc.b  $0d,$0a,0                                                 ;variable exit terminated with null '0'
      
NEW   dc.b $0d,$0a, 0                                                 ;variable NEW terminated with null '0'
        
    END    START                                                      ;last line of source



































*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
