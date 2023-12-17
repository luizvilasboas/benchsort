CC = gcc
CFLAGS = -Wall -Wextra -O2 -std=c99 -pedantic -fprofile-arcs -ftest-coverage

HDR_DIR = include
BIN_DIR = bin
SRC_DIR = src
OBJ_DIR = obj
TEST_DIR = test

SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

TEST_SRCS := $(wildcard $(TEST_DIR)/*.c)
TEST_BINS := $(patsubst $(TEST_DIR)/%.c, $(TEST_DIR)/bin/%, $(TEST_SRCS))

NAME = benchsort
VERSION = 0.1.0

all: $(OBJ_DIR) $(BIN_DIR) $(BIN_DIR)/$(NAME)

$(BIN_DIR)/$(NAME): main.c $(OBJS)
	$(CC) $(CFLAGS) -I $(HDR_DIR) $^ -o $@

$(OBJ_DIR):
	mkdir -p $@

$(BIN_DIR):
	mkdir -p $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I $(HDR_DIR) -c $< -o $@

$(TEST_DIR)/bin/%: $(TEST_DIR)/%.c $(OBJS)
	$(CC) $(CFLAGS) -I $(HDR_DIR) $< $(OBJS) -o $@ -lcriterion -lgcov

$(TEST_DIR)/bin:
	mkdir -p $@

check: $(TEST_DIR)/bin $(TEST_BINS)
	for test in $(TEST_BINS); do ./$$test; done

coverage: $(TEST_DIR)/bin $(TEST_BINS)
	rm -f *.gcno *.gcda *.gcov
	for test in $(TEST_BINS); do ./$$test; done
	gcovr --xml-pretty --exclude-unreachable-branches --print-summary -o coverage.xml --root .

clean:
	$(RM) -rf $(OBJ_DIR) $(BIN_DIR) $(TEST_DIR)/bin *.gcno *.gcda *.gcov $(TEST_DIR)/*.gcov coverage.xml

run: all
	./$(BIN_DIR)/$(NAME)

.PHONY: all clean check docker coverage
