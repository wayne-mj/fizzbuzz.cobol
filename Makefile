COBC=cobc
COBCFLAGS=-Wall -Wextra
SRC=fizzbuzz.cob
PROG=fizzbuzz

all: clean $(PROG)

$(PROG): $(SRC)
	$(COBC) $(COBCFLAGS) -x -o $(PROG) $(SRC)

job: $(SRC)
	$(COBC) $(COBCFLAGS) -jx $(SRC)

clean:
	rm -f $(PROG) $(PROG).o
