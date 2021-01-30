FROM debian:10
RUN apt-get update && apt-get install -y sbcl make libedit-dev build-essential git curl
WORKDIR /root

RUN git clone https://github.com/SquircleSpace/shcl.git
RUN curl -O https://beta.quicklisp.org/quicklisp.lisp
RUN sbcl --load quicklisp.lisp --eval '(progn (quicklisp-quickstart:install) (quit))'

WORKDIR /root/shcl
RUN make LISP="sbcl --no-userinit --load \"/root/quicklisp/setup.lisp\" --eval '(ql:quickload :cffi-grovel)'"

CMD ./run-shcl
