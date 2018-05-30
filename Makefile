# LIB_SRC=./src/1.c \
# 	./src/2.c \
# 	./src/3.c 

# TMP= $(LIB_SRC:%.c=%.o)
# LIB_OBJ= $(TMP:./src/%=./build/%)

BUILD_PATH=./build_make/
SRC_PATH=./src/

# LIB_SRCS_FILES= 1.c \
# 				2.c \
# 				3.c
LIB_SRCS_FILES= 1.c 
LIB_SRCS_FILES+= 2.c
LIB_SRCS_FILES+= 3.c

LIB_OBJS_FILES= $(LIB_SRCS_FILES:%.c=%.o)

LIB_OBJ= $(addprefix $(BUILD_PATH), $(LIB_OBJS_FILES))

TARGET=test.out

all:$(TARGET)

$(BUILD_PATH):
	mkdir $(BUILD_PATH)

$(TARGET): $(BUILD_PATH) $(LIB_OBJ) $(SRC_PATH)main.c
	gcc $(SRC_PATH)main.c $(LIB_OBJ) -o $@

$(BUILD_PATH)%.o:$(SRC_PATH)%.c
	gcc -c $^ -o $@

clean: 
	rm -r $(BUILD_PATH)
	rm $(TARGET)
