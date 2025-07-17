      *    FIZZBUZZ IN COBOL
      *    THIS IS A LOT FASTER THAN THE FORTRAN VERSION
      *    0.012 SECONDS VS 0.054 SECONDS
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COUNTER          PIC 99999 VALUE 1.
       01 RESULT           PIC X(8) VALUE SPACES.
       01 REMAINDER3       PIC 9 VALUE 0.
       01 REMAINDER5       PIC 9 VALUE 0.
       01 DIVISIONRESULT   PIC 99 VALUE 0.
       01 MYLIMIT           PIC 9999 VALUE 0.

       PROCEDURE DIVISION.

      *    Request an upper limit.
           DISPLAY "Enter a value to count to: "
           WITH NO ADVANCING
           ACCEPT MYLIMIT

      *    Check is 0 or below and set to a default of 100
           IF MYLIMIT <= 0
               MOVE 100 TO MYLIMIT
           END-IF

           PERFORM UNTIL COUNTER > MYLIMIT
               MOVE SPACES TO RESULT

      *        COMPUTE REMAINDER OF COUNTER DIVIDED BY 3
      *        BECAUSE FOR SOME DUMB REASON MOD IS NOT DEFINED
      *        AND DOING IT THE MATHEMATICAL DOES NOT WORK WITH INTEGERS
      *        COMPUTE
      *            REMAINDER3 = COUNTER - ((COUNTER / 3) * 3)
      *        END-COMPUTE
      *        ALWAYS RETRUNS 0
               DIVIDE COUNTER BY 3 GIVING DIVISIONRESULT REMAINDER
                   REMAINDER3

               IF REMAINDER3 = 0 THEN
                   STRING RESULT DELIMITED BY SPACE
                   "FIZZ" DELIMITED BY SPACE
                      INTO RESULT
               END-IF

      *        COMPUTE REMAINDER OF COUNTER DIVIDED BY 5
      *        BECAUSE FOR SOME DUMB REASON MOD IS NOT DEFINED
      *        AND DOING IT THE MATHEMATICAL DOES NOT WORK WITH INTEGERS
      *        COMPUTE
      *            REMAINDER5 = COUNTER - ((COUNTER / 5) * 5)
      *        END-COMPUTE
      *        ALWAYS RETRUNS 0
               DIVIDE COUNTER BY 5 GIVING DIVISIONRESULT REMAINDER
                   REMAINDER5

               IF REMAINDER5 = 0 THEN
                   STRING RESULT DELIMITED BY SPACE
                      "BUZZ" DELIMITED BY SPACE
                      INTO RESULT
               END-IF

               IF RESULT = SPACES THEN
                   MOVE COUNTER TO RESULT
               END-IF

               DISPLAY
                   COUNTER " . . . " RESULT

               ADD
                   1 TO COUNTER
           END-PERFORM.
           STOP RUN.

