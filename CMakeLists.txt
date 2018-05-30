add_library(my_libs 
src/1.c
src/2.c
src/3.c
)

add_executable(my_test src/main.c)
target_link_libraries(my_test my_libs)