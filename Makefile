CF = gcc -Wall -Werror

OBJ_DIR_HW = build-hw/src
SRC_DIR_HW = hello-world

EXE_HW = bin/hello-world
SRC_HW = $(wildcard $(SRC_DIR_HW)/*.c)
OBJ_HW = $(patsubst $(SRC_DIR_HW)/%.c, $(OBJ_DIR_HW)/%.o, $(SRC_HW))
DEP_HW = $(OBJ_HW:.o=.d)

-include $(DEP_HW)

.PHONY: hwsrc clean

hwsrc: build-hw/ $(OBJ_DIR_HW) bin/ $(EXE_HW) $(SRC_HW)

build-hw/ $(OBJ_DIR_HW) bin/:
	mkdir $@

$(EXE_HW): $(OBJ_HW)
	$(CF) $^ -o $@

$(OBJ_DIR_HW)/%.o: $(SRC_DIR_HW)/%.c
	$(CF) $^ -c -o $@
	$(CF) $^ -MM > $(OBJ_DIR_HW)/$*.d

clean:
	rm -rf build-hw bin
