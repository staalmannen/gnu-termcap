</$objtype/mkfile

LIB=libtermcap.a

OFILES= termcap.$O tparam.$O version.$O


HFILES=\
	/sys/include/ape/termcap.h\

UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\
	${LIB:/$objtype/%=/386/%}\

</sys/src/cmd/mksyslib

CC=pcc
LD=pcc
CFLAGS= -c -I. -I.. -D_POSIX_SOURCE -DHAVE_STRING_H=1 -DHAVE_UNISTD_H=1\
	-DSTDC_HEADERS=1  -DHAVE_FCNTL_H -DTERMCAP_FILE="/sys/lib/termcap" 


%.$O: %.c
	$CC $CFLAGS $stem.c


install:V:
    cp libtermcap.a /$objtype/lib/ape/libtermcap.a
	cp termcap.h /sys/include/ape/termcap.h
	cp termcap.src /sys/lib/termcap


nuke:V:
	rm -f $LIB
	rm -f /$objtype/lib/ape/libtermcap.a
	rm -f $HFILES
	rm -f /sys/lib/termcap
