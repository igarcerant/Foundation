
.PHONY: all clean rebuild

all clean rebuild:
	@for d in `ls -d vendor* lib* src* 2>/dev/null` ; \
	do \
		$(MAKE) -C $$d $@ || exit 1 ; \
	done
