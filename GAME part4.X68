*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    
    
    MOVE.L #50000, $3000 ;move the literal number 50000(00 00 C3 50 in hex) which represents total amount of the carbon in to the address memory $3000
    MOVE.L #5000,  $4000 ;move the literal number 5000(00 00 13 88 in hex) which represents total amount of the money in to the address memory $3000
    MOVE.W #100,   $5000 ;move the literal number 100 (00 3C in hex) which represents the solar panel in to the address memory $5000
    MOVE.W #75,    $6000 ;move the literal number 75 (00 2D in hex) which represents the windmill in to the address memory $6000
    MOVE.W #50,    $8000 ;move the literal number 50 (00 19 in hex) which represents the tree in to the address memory $8000
    
    MOVE.L #33999, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    

    
    LEA welcome, A1 ;it loads variable welcome(10 AA in hex) in to A1
    MOVE.W #14, D0  ;display the string variable welcome
    TRAP #15 
    BSR WAIT
    
    MOVE.L #65280, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    LEA earth, A1 ;it loads variable welcome(10 AA in hex) in to A1
    MOVE.W #14, D0  ;display the string variable welcome
    TRAP #15 
    BSR WAIT
    
    MOVE.L #10233, D1   ;FF00 in hex (set colour red)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    BSR NEWLINE
    LEA text1, A1   ;it loads variable text1(108E in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text1
    TRAP #15        
    MOVE.B #2, D0   ;store the string in the memory location then stores that memory location in A1 it also store the number of characters in D1
    TRAP #15
 
    MOVE.L (A1),$9000  ;we move the value stored at the memory location stored in address register A1
    BSR NEWLINE
    LEA text2, A1  ;it loads variable text2(10A6 in hex) in to A1
    MOVE.W #14, D0 ;display the string variable text2
    TRAP #15
    
    
    LEA $9000, A1 ;the string text2 which we stored at the moemory location 9000 we moved into the A1
    MOVE.W #1, D0 ;display the user input
    TRAP #15
    LEA welcome2, A1   ;it loads variable text1(108E in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text1
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
    MOVE.L #0,D1
    MOVE.B #5, D0 ;read a single character from the keyboard into D1
    TRAP #15        
    RTS    ;it return from Subroutine (INPUT) in to line after BSR INPUT
    
GAMELOOP:
    
 

    BSR NEWLINE 
     
    BSR CLEARSCREEN
    SUB D1, D1
    BSR NEWLINE
    MOVE.L #$f6b26b, D1   ;0000FF in hex (set colour blue)
    MOVE.B #21, D0         
    TRAP #15
    SUB D1, D1
    LEA description, A1   
    MOVE.W #14, D0  
    TRAP #15
    BSR NEWLINE 
       
    LEA description2, A1   
    MOVE.W #14, D0  
    TRAP #15
    BSR LEVEL
    
    
NEWLINE:
    
    LEA NEW, A1    ;it loads variable NEW(1182 in hex) in to A1
    MOVE.B #14, D0 ;display the string variable NEW
    TRAP #15
    RTS            ;it returns from Subroutine (NEWLINE)into the line 'LEA text4, A1'under 'BSR NEWLINE'

LEVEL:
    
    BSR NEWLINE
    MOVE.L #33284, D1   ;0000FF in hex (set colour blue)
    MOVE.B #21, D0         
    TRAP #15
    SUB D1, D1
    BSR NEWLINE
    BSR WAIT
    BSR NEWLINE 
    LEA text6, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15
    SUB D1, D1
    BSR INPUT 
    CMP #99, D1     ;compare literal number 13 with number in hex which is stored in D1(the number is D)
    BEQ PATH    ;BEQ (Branch if equal) it jumps to GAMELOOP if the values which we compared above are equal
    BRA LEVEL

PATH:
    
    BSR NEWLINE 
    BSR NEWLINE
    MOVE.L #65280, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15 
    MOVE.L #25280, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15     
    LEA text8, A1    ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0
    TRAP #15
    MOVE.L $3000, D1 ;move address memory $3000 in to D1
    BSR NEWLINE
    
    LEA text3, A1    ;it loads variable text3(1129 in hex) in to A1
    MOVE.W #17, D0   ;display string at A1 and display decimal number in D1(00 00 C3 50)which represent the carbon amount 50000 
    TRAP #15
    BSR NEWLINE
    MOVE.L $4000, D1 
    LEA text5, A1
    MOVE.W #17, D0
    TRAP #15 
    SUB D1, D1 
    BSR NEWLINE
    BSR NEWLINE
    BSR NEWLINE
    MOVE.L #33284, D1   ;0000FF in hex (set colour blue)
    MOVE.B #21, D0         
    TRAP #15
    BSR WAIT
    LEA text7, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15  
    BSR INPUT 
    BSR NEWLINE
    CMP #102, D1     ;compare literal number 13 with number in hex which is stored in D1(the number is D)
    BEQ FOREST
    CMP #115, D1
    BEQ SHOP
    BRA CHOOSE 
    

SHOP:
    BSR CLEARSCREEN
    BSR NEWLINE
    MOVE.L #$ffd700, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    BSR HUD
    SUB D1, D1
    BSR NEWLINE
    BSR NEWLINE
    BSR MONEY
    MOVE.L #662000, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    BSR NEWLINE
    MOVE.L #0,D1  ;Clear d1
    MOVE.L #0,A1    
    LEA snoop, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15
    BSR NEWLINE
    BSR NEWLINE     ;calling the subroutines( NEWLINE ) by the instruction BSR (Branch to subroutine)
    LEA enter, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15
    SUB D1, D1
    BSR INPUT 
    CMP #13, D1
    BEQ ITEMS    ;BEQ (Branch if equal) it jumps to GAMELOOP if the values which we compared above are equal
    BRA SHOP
    BSR NEWLINE
    
    
    
ITEMS:
    BSR CLEARSCREEN
    LEA soop, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15 
    BSR NEWLINE
    LEA solar, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    LEA wind, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    LEA tree, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    LEA exit, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    BSR INPUT 
    CMP #97, D1
    BEQ SOLO
    CMP #98, D1
    BEQ WINDO
    CMP #99, D1
    BEQ TRELE
    CMP #101, D1
    BEQ EXITO
    BRA SHOP
    
    RTS
    

EXITO:

    MOVE.W #$FF00, D1
    MOVE.B #11, D0
    TRAP #15
    LEA NEW, A1    ;it loads variable NEW(1182 in hex) in to A1
    MOVE.B #14, D0 ;display the string variable NEW
    TRAP #15
    BRA CHOOSE    
    
CHOOSE:
    MOVE.L #$fff200, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    LEA text7, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15
    BSR NEWLINE 
    BSR INPUT 
    CMP #102, D1    ;compare literal number 13 with number in hex which is stored in D1(the number is D)
    BEQ FOREST 
    CMP #115, D1
    BEQ SHOP
    BRA CHOOSE

FOREST:
    BSR CLEARSCREEN
    BSR NEWLINE
    MOVE.L #62000, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    BSR NEWLINE
    LEA TREES, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    MOVE.L #$2986cc, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    SUB D1, D1
    LEA forent, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    SUB D1, D1
    BSR INPUT 
    CMP #13, D1
    BEQ DEEP    ;BEQ (Branch if equal) it jumps to GAMELOOP if the values which we compared above are equal
    BRA EXITO
    BSR NEWLINE

DEEP:
    BSR CLEARSCREEN
    BSR NEWLINE
    MOVE.L #62000, D1   ;FF00 in hex (set colour green)    0x00BBGGRR
    MOVE.B #21, D0
    TRAP #15
    SUB D1, D1
    LEA foorest, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    LEA foorest2, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    BSR INPUT
    CMP #108, D1    ;compare literal number 13 with number in hex which is stored in D1(the number is D)
    BEQ DRACO 
    CMP #114, D1
    BEQ WIZ
    CMP #101, D1
    BEQ EXITO
    BRA CHOOSE
    
    
    
    
    
DRACO: 
   
    BSR NEWLINE
    LEA dragon, A1
    MOVE.W #14, D0
    TRAP #15
    RTS
    
    
WIZ:    
    
    BSR NEWLINE
    LEA wizard, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE
    LEA text2, A1  ;it loads variable text2(10A6 in hex) in to A1
    MOVE.W #14, D0 ;display the string variable text2
    TRAP #15

    MOVE.W #1, D0 ;display the user input
    TRAP #15
    BSR NEWLINE
    LEA wiztalk, A1
    MOVE.W #14, D0
    TRAP #15
    BSR NEWLINE 
    SUB D1, D1
    BSR INPUT
    CMP #31, D1    ;compare literal number 13 with number in hex which is stored in D1(the number is D)
    BEQ Question1 
    CMP #50, D1
    BEQ Question2
    CMP #51, D1
    BRA Question3
    BRA NEWLINE
    
WAIT: 
                   ;Waits the amount of time specified in D1 in 1/100ths of seconds
    MOVE.W   #100,D1
    MOVE.B   #23,D0
    TRAP     #15
    RTS

SOLO:

    LEA solaris, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15
    BSR NEWLINE
    MOVE.L $3000, D5
    SUB #200,D5
    MOVE.L D5, $3000
    MOVE.L $4000, D5
    SUB #100, D5
    MOVE.L D5, $4000
    BSR CLEARSCREEN
    BSR HUD
    BSR NEWLINE
    BSR MONEY
    BSR NEWLINE
    BRA SHOP
HUD:
    MOVE.L #5307284, D1   ;0000FF in hex (set colour blue)
    MOVE.B #21, D0
    MOVE.B #1,D2    ;0001 in binary         
    TRAP #15
    LEA carbon, A1
    MOVE.L $3000, D1
    MOVE.B #17, D0
    TRAP #15   
    RTS
    
MONEY:
    MOVE.L #1307284, D1   ;0000FF in hex (set colour blue)
    MOVE.B #21, D0
    MOVE.B #1,D2    ;0001 in binary         
    TRAP #15
    LEA coins, A1
    MOVE.L $4000, D1
    MOVE.B #17, D0
    TRAP #15   
    RTS

    
CLEARSCREEN:
    MOVE.W #$FF00, D1
    MOVE.B #11, D0
    TRAP #15
    RTS
    
WINDO:

    LEA windows, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15
    MOVE.L $3000, D5
    SUB #150,D5
    MOVE.L D5, $3000
    MOVE.L $4000, D5
    SUB #75, D5
    MOVE.L D5, $4000
    BSR CLEARSCREEN
    BSR HUD
    BSR NEWLINE
    BSR MONEY
    BSR NEWLINE
    BRA SHOP

    
TRELE:
    
    LEA tele, A1   ;it loads variable text4(1139 in hex) in to A1
    MOVE.W #14, D0  ;display the string variable text4
    TRAP #15
    MOVE.L $3000, D5
    SUB #150,D5
    MOVE.L D5, $3000
    MOVE.L $4000, D5
    SUB #50, D5
    MOVE.L D5, $4000
    BSR CLEARSCREEN
    BSR HUD
    BSR NEWLINE
    BSR MONEY
    BSR NEWLINE
    BRA SHOP

 
    SIMHALT   ; halt simulator


    
text1 dc.b 'Please enter your name ',0                      ;variable text1 terminated with null '0'
text2 dc.b '          HI ' ,0                                         ;variable text2 terminated with null '0'
welcome dc.b '   +------------------------------------------------------------+'     ;variable welcome terminated with null '0'
        dc.b  $0d,$0a                                                             ;$0d stand for a new line and $0a move to the left
        dc.b '   |                 Welcome to the adventure game!!            |'  
        dc.b  $0d,$0a                                                       
        dc.b '   +------------------------------------------------------------+'
        dc.b  $0d,$0a, 0
welcome2 dc.b ' ARE YOU READY TO JOIN THE PLANET DEFENDERS TEAM '
         dc.b  $0d,$0a 
         dc.b '               AND SAVE THE WORLD FROM GLOBAL WARMING?!!!  '
         dc.b  $0d,$0a ,0         
enter   dc.b 'Press ENTER to go inside the shop',0  
forent  dc.b 'Press ENTER to go inside the forest',0      
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
        dc.b  $0d,$0a, 0
        
        
        
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
        dc.b  $0d,$0a, 0

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
        dc.b $09,'        6969                    6969                    6969           ',$0A,$0D,0
                                             





        
Question1 dc.b 'QUESTION 1',0
Question2 dc.b 'QUESTION 2',0           
Question3 dc.b 'QUESTION 3',0     
        
text3 dc.b 'THE CARBON TOTAL : ', 0                         ;variable text3 terminated with null '0'
text4 dc.b 'PRESS ENTER TO START THE GAME ', 0              ;variable text4 terminated with null '0'
text5 dc.b 'THE MONEY TOTAL : ', 0
text6 dc.b 'PLEASE ENTER C TO CONTINUE ', 0
text7 dc.b 'PRESS F FOR FOREST OR S FOR SHOOP ' ,0
text8 dc.b 'YOU ARE STARTING GAME WITH: ',0
dragon dc.b 'Dragon', 0
wizard dc.b 'Wizard', 0
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
     dc.b  $0d,$0a, 0
 
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
        dc.b  $0d,$0a, 0    
                                                       
foorest2 dc.b 'In the forest you have to choose between right and left path '  
         dc.b  $0d,$0a       
         dc.b  $0d,$0a
         dc.b 'Press L to go by left path '
         dc.b  $0d,$0a
         dc.b  $0d,$0a
         dc.b 'Press R to go by left path '
         dc.b  $0d,$0a
         dc.b  $0d,$0a
         dc.b 'Press E to exit'
         dc.b  $0d,$0a
         dc.b  $0d,$0a, 0
wiztalk dc.b 'I can reward you with $1000 dolars price  '
        dc.b  $0d,$0a
        dc.b 'if you answer one of my questions'
        dc.b $0d,$0a
        dc.b $0d,$0a
        dc.b 'Press number 1 for question one'
        dc.b $0d,$0a
        dc.b $0d,$0a
        dc.b 'Press number 2 for question two'
        dc.b $0d,$0a
        dc.b $0d,$0a
        dc.b 'Press number 3 for question three'
        dc.b $0d,$0a
        dc.b $0d,$0a, 0
        
































       
             
coins    dc.b 'Total MONEY: $ ',0  
carbon  dc.b  'Total Carbon:   ',0                                                            
solaris dc.b 'You just have bought 1 SOLAR PANEL', 0                                                                 
windows dc.b 'You just have bought 1 WINDMILL', 0 
tele  dc.b 'You just have bought 1 TREE', 0       
solar dc.b 'DO YOU WANT TO BAY A SOLAR PANEL PRESS A ', 0   ;variable solar terminated with null '0'
wind  dc.b 'DO YOU WANT TO BAY A WINDMILL PRESS B ', 0      ;variable wind terminated with null '0'
tree  dc.b 'DO YOU WANT TO BAY A TREE PRESS C ', 0   
exit  dc.b 'DO YOU WANT TO EXIT PRESS E ', 0       ;variable tree terminated with null '0'
NEW   dc.b $0d,$0a, 0                                       ;variable NEW terminated with null '0'
        
    END    START                                            ; last line of source
















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
