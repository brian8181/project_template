CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -pedantic
TARGET = ccsk
SOURCES = ccsk.cpp

$(TARGET): $(SOURCES)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SOURCES)

clean:
	rm -f $(TARGET)

.PHONY: clean

# # Compile
# make

# # Generate a simple class
# ./ccsk MyClass

# # Generate a class with base class
# ./ccsk DerivedClass BaseClass
