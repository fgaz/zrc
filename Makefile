PREFIX = /usr/local
CXXFLAGS = -O3 -std=gnu++11
SRCS := $(shell find src -name *.cpp)
OBJS := $(subst src/,bin/,$(addsuffix .o,$(basename $(SRCS))))

.PHONY: all
all: bin/zrc

bin/zrc: $(OBJS)
	$(CXX) $(OBJS) $(LDFLAGS) -o $@

bin/%.o: src/%.cpp
	mkdir -p bin
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -c -o $@ $<

src/y.tab.cpp:
	bison -d src/expr.y -o src/y.tab.cpp

src/lex.yy.cpp:
	flex -o src/lex.yy.cpp src/expr.l

.PHONY: install
install:
	install -Dm755 bin/zrc $(DESTDIR)$(PREFIX)/bin/zrc

.PHONY: clean
clean:
	rm bin/*
