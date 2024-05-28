       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 COUNTER PIC 9999 VALUE 1.
           01 RESULT PIC X(50) VALUE SPACES.
           01 FIZZ PIC X(4) VALUE "FIZZ".
           01 BUZZ PIC X(4) VALUE "BUZZ".
           01 REMAINDER3 PIC 9 VALUE 0.
           01 REMAINDER5 PIC 9 VALUE 0.
           01 DIVISIONRESULT PIC 99 VALUE 0.
       
       PROCEDURE DIVISION.
       PERFORM UNTIL COUNTER > 1000
           MOVE SPACES TO RESULT

      *    COMPUTER REMAINDER OF COUNTER DIVIDED BY 3
      *    BECAUSE FOR SOME DUMB REASON MOD IS NOT DEFINED
      *    AND DOING IT THE MATHEMATICAL DOES NOT WORK WITH INTEGERS
      *    FML!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           DIVIDE COUNTER BY 3 GIVING DIVISIONRESULT REMAINDER 
                   REMAINDER3
           END-DIVIDE
      
           IF REMAINDER3 = 0 THEN
               STRING RESULT DELIMITED BY SPACE
                      FIZZ DELIMITED BY SPACE
                      INTO RESULT
               END-STRING                 
           END-IF

      *    COMPUTER REMAINDER OF COUNTER DIVIDED BY 5
      *    BECAUSE FOR SOME DUMB REASON MOD IS NOT DEFINED
      *    AND DOING IT THE MATHEMATICAL DOES NOT WORK WITH INTEGERS
      *    FML!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
           DIVIDE COUNTER BY 5 GIVING DIVISIONRESULT REMAINDER 
                   REMAINDER5
           END-DIVIDE
      
           IF REMAINDER5 = 0 THEN
               STRING RESULT DELIMITED BY SPACE  
                      BUZZ DELIMITED BY SPACE
                      INTO RESULT
               END-STRING
           END-IF

           IF RESULT = SPACES THEN
               MOVE COUNTER TO RESULT
           END-IF

           DISPLAY 
              COUNTER " . . . " RESULT 
           END-DISPLAY

           MOVE SPACES TO RESULT

           ADD 
               1 TO COUNTER
           END-ADD
       END-PERFORM.
       STOP RUN.
       