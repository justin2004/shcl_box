all: build run

build:
	docker build -t justin2004/shcl_box .

run:
	docker run --rm -it justin2004/shcl_box
