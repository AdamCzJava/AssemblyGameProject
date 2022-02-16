*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    
    
    MOVE.L #50000, $3000 ;move the literal number 50000(00 00 C3 50 in hex) which represents total amount of the carbon in to the address memory $3000
    MOVE.W #5000,  $4000 ;move the literal number 5000(00 00 13 88 in hex) which represents total amount of the money in to the address memory $3000
    MOVE.W #60,    $5000 ;move the literal number 60 (00 3C in hex) which represents the solar panel in to the address memory $5000
    MOVE.W #45,    $6000 ;move the literal number 45 (00 2D in hex) which represents the windmill in to the address memory $6000
    MOVE.W #25,    $8000 ;move the literal number 25 (00 19 in hex) which represents the tree in to the address memory $8000
    
    
    LEA welcome, A1 ;it loads variable welcome(10 AA in hex) in to A1
    MOVE.W #14, D0  ;display the string variable welcome
    TRAP #15 
    
    LEA text1, A1   ;it loads variable text1(108E in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text1
    TRAP #15        
    
    MOVE.B #2, D0   ;store the string in the memory location then stores that memory location in A1 it also store the number of characters in D1
    TRAP #15
    
    MOVE.L (A1), $2000 ;we move the value stored at the memory location stored in address register A1
    
    LEA text2, A1  ;it loads variable text2(10A6 in hex) in to A1
    MOVE.W #14, D0 ;display the string variable text2
    TRAP #15
    
    LEA $2000, A1 ;the string text2 which we stored at the moemory location 2000 we moved into the A1
    MOVE.W #1, D0 ;display the user input
    TRAP #15
    
RESTART:
    
    BSR NEWLINE     ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA text4, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15 
    
    BSR INPUT    ;calling the subroutines( INPUT ) by the instruction BSR (Branch to subroutine)
  
    CMP #13, D1     ;compare literal number 13 with number in hex which is stored in D1(the number is D)
    BEQ GAMELOOP    ;BEQ (Branch if equal) it jumps to GAMELOOP if the values which we compared above are equal
    BRA RESTART     ;it branch to RESTART
    
INPUT:

    MOVE.B #5, D0 ;read a single character from the keyboard into D1
    TRAP #15        
    RTS    ;it return from Subroutine (INPUT) in to line after BSR INPUT
    
GAMELOOP:
    
    MOVE.L $3000, D1 ;move address memory $3000 in to D1
    BSR NEWLINE
    LEA text3, A1    ;it loads variable text3(1129 in hex) in to A1
    MOVE.W #17, D0   ;display string at A1 and display decimal number in D1(00 00 C3 50)which represent the carbon amount 50000 
    TRAP #15
    BSR NEWLINE
    MOVE.W $4000, D1 
    LEA text5, A1
    MOVE.W #17, D0
    TRAP #15 
    BSR NEWLINE 
    BSR NEWLINE 
    LEA description, A1   
    MOVE.W #14, D0  
    TRAP #15
    BSR NEWLINE     
    LEA description2, A1   
    MOVE.W #14, D0  
    TRAP #15

NEWLINE:
    
    LEA NEW, A1    ;it loads variable NEW(1182 in hex) in to A1
    MOVE.B #14, D0 ;display the string variable NEW
    TRAP #15
    RTS            ;it returns from Subroutine (NEWLINE)into the line 'LEA text4, A1'under 'BSR NEWLINE'



   
    
    SIMHALT   ; halt simulator

text1 dc.b 'Please enter your name ',0                      ;variable text1 terminated with null '0'
text2 dc.b 'Hi ' ,0                                         ;variable text2 terminated with null '0'
welcome dc.b '+--------------------------------------+'     ;variable welcome terminated with null '0'
        dc.b  $0d,$0a                                       ;$0d stand for a new line and $0a move to the left
        dc.b '|  Welcome to the adventure game!!     |'  
        dc.b  $0d,$0a                     
        dc.b '+--------------------------------------+'
        dc.b  $0d,$0a, 0
        
        
text3 dc.b 'THE CARBON TOTAL : ', 0                         ;variable text3 terminated with null '0'
text4 dc.b 'PRESS ENTER TO START THE GAME ', 0              ;variable text4 terminated with null '0'
text5 dc.b 'THE MONEY TOTAL : ', 0
description dc.b 'The aim for this game is to reduce '
            dc.b  $0d,$0a 
            dc.b 'the amount of the carbon on the earth to prevent '
            dc.b  $0d,$0a 
            dc.b 'THE GLOBAL WARMING'
            dc.b  $0d,$0a, 0
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
             dc.b  $0d,$0a, 0
solar dc.b 'DO YOU WANT TO BAY A SOLAR PANEL PRESS A ', 0   ;variable solar terminated with null '0'
wind  dc.b 'DO YOU WANT TO BAY A WINDMILL PRESS B ', 0      ;variable wind terminated with null '0'
tree  dc.b 'DO YOU WANT TO BAY A TREE PRESS C ', 0          ;variable tree terminated with null '0'
NEW   dc.b $0d,$0a, 0                                       ;variable NEW terminated with null '0'
        
    END    START                                            ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
