CF = gcc -Wall -Werror
CF_TEST = $(CF) -Iquadratic-equation -Ithird-party 

OBJ_DIR_HW = build-hw/src
SRC_DIR_HW = hello-world

OBJ_DIR_QE = build-qe/src
SRC_DIR_QE = quadratic-equation

TEST_OBJ_DIR_QE = build-qe/test
TEST_SRC_DIR_QE = quadratic-equation-test

EXE_HW = bin/hello-world
SRC_HW = $(wildcard $(SRC_DIR_HW)/*.c)
OBJ_HW = $(patsubst $(SRC_DIR_HW)/%.c, $(OBJ_DIR_HW)/%.o, $(SRC_HW))
DEP_HW = $(OBJ_HW:.o=.d)

EXE_QE = bin/quad-eq
SRC_QE = $(wildcard $(SRC_DIR_QE)/*.c)
OBJ_QE = $(patsubst $(SRC_DIR_QE)/%.c, $(OBJ_DIR_QE)/%.o, $(SRC_QE))
DEP_QE = $(OBJ_QE:.o=.d)

TEST_EXE_QE = bin/quad-eq-test
TEST_SRC_QE = $(wildcard $(TEST_SRC_DIR_QE)/*.c)
TEST_OBJ_QE = $(patsubst $(TEST_SRC_DIR_QE)/%.c, $(TEST_OBJ_DIR_QE)/%.o, $(TEST_SRC_QE))
TEST_DEP_QE = $(TEST_OBJ_QE:.o=.d)

-include $(DEP_HW)
-include $(DEP_QE)
-include $(TEST_DEP_QE)

.PHONY: hwsrc qesrc qetest clean

hwsrc: build-hw/ $(OBJ_DIR_HW) bin/ $(EXE_HW) $(SRC_HW)

build-hw/ $(OBJ_DIR_HW) bin/:
	mkdir $@

$(EXE_HW): $(OBJ_HW)
	$(CF) $^ -o $@ 

$(OBJ_DIR_HW)/%.o: $(SRC_DIR_HW)/%.c
	$(CF) $^ -c -o $@ 
	$(CF) $^ -MM > $(OBJ_DIR_HW)/$*.d 

qesrc: build-qe/ $(OBJ_DIR_QE) bin/ $(EXE_QE) $(SRC_QE)

build-qe/ $(OBJ_DIR_QE) $(TEST_OBJ_DIR_QE) bin/:
	mkdir $@

$(EXE_QE): $(OBJ_QE)
	$(CF) $^ -o $@ -lm

$(OBJ_DIR_QE)/%.o: $(SRC_DIR_QE)/%.c
	$(CF) $^ -c -o $@ -lm 
	$(CF) $^ -MM > $(OBJ_DIR_QE)/$*.d -lm



qetest: qesrc $(TEST_OBJ_DIR_QE) $(TEST_EXE_QE) $(TEST_SRC_QE)

$(TEST_EXE_QE): $(TEST_OBJ_QE) $(patsubst build-qe/src/main.o, ,$(OBJ_QE))
	$(CF_TEST) $^ -o $@ -lm

$(TEST_OBJ_DIR_QE)/%.o: $(TEST_SRC_DIR_QE)/%.c
	$(CF_TEST) $^ -c -o $@ -lm
	$(CF_TEST) $^ -MM > $(TEST_OBJ_DIR_QE)/$*.d -lm

clean:
	rm -rf build-hw build-qe bin
