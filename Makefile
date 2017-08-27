CF = gcc -Wall -Werror

OBJ_DIR_HW = build-hw/src
SRC_DIR_HW = hello-world

OBJ_DIR_QE = build-qe/src
SRC_DIR_QE = quadratic-equation

EXE_HW = bin/hello-world
SRC_HW = $(wildcard $(SRC_DIR_HW)/*.c)
OBJ_HW = $(patsubst $(SRC_DIR_HW)/%.c, $(OBJ_DIR_HW)/%.o, $(SRC_HW))
DEP_HW = $(OBJ_HW:.o=.d)

EXE_QE = bin/quad-eq
SRC_QE = $(wildcard $(SRC_DIR_QE)/*.c)
OBJ_QE = $(patsubst $(SRC_DIR_QE)/%.c, $(OBJ_DIR_QE)/%.o, $(SRC_QE))
DEP_QE = $(OBJ_QE:.o=.d)

-include $(DEP_HW)

.PHONY: hwsrc qesrc clean

hwsrc: build-hw/ $(OBJ_DIR_HW) bin/ $(EXE_HW) $(SRC_HW)

build-hw/ $(OBJ_DIR_HW) bin/:
	mkdir $@

$(EXE_HW): $(OBJ_HW)
	$(CF) $^ -o $@

$(OBJ_DIR_HW)/%.o: $(SRC_DIR_HW)/%.c
	$(CF) $^ -c -o $@
	$(CF) $^ -MM > $(OBJ_DIR_HW)/$*.d

qesrc: build-qe/ $(OBJ_DIR_QE) bin/ $(EXE_QE) $(SRC_QE)

build-qe/ $(OBJ_DIR_QE) bin/:
	mkdir $@

$(EXE_QE): $(OBJ_QE)
	$(CF) $^ -o $@

$(OBJ_DIR_QE)/%.o: $(SRC_DIR_QE)/%.c
	$(CF) $^ -c -o $@
	$(CF) $^ -MM > $(OBJ_DIR_QE)/$8.d

clean:
	rm -rf build-hw build-qe bin
