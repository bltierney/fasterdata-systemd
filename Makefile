PREFIX ?= /usr/local
BINDIR = $(PREFIX)/sbin
LIBDIR = $(PREFIX)/mysysctl

SCRIPTS = init.sh apply.sh diff.sh disable.sh validate.sh
CONF = my-tunings.conf.template

LINKS = \
    mysysctl-init \
    mysysctl-apply \
    mysysctl-diff \
    mysysctl-disable \
    mysysctl-validate

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install."

install:
	install -d $(LIBDIR)
	install -m 755 $(SCRIPTS) $(LIBDIR)/
	install -m 644 $(CONF) $(LIBDIR)/
	install -d $(BINDIR)
	ln -sf $(LIBDIR)/init.sh $(BINDIR)/mysysctl-init
	ln -sf $(LIBDIR)/apply.sh $(BINDIR)/mysysctl-apply
	ln -sf $(LIBDIR)/diff.sh $(BINDIR)/mysysctl-diff
	ln -sf $(LIBDIR)/disable.sh $(BINDIR)/mysysctl-disable
	ln -sf $(LIBDIR)/validate.sh $(BINDIR)/mysysctl-validate
	@echo "Installed to:"
	@echo "  $(LIBDIR) (scripts and template)"
	@echo "  $(BINDIR) (command symlinks)"

uninstall:
	rm -f $(BINDIR)/mysysctl-init
	rm -f $(BINDIR)/mysysctl-apply
	rm -f $(BINDIR)/mysysctl-diff
	rm -f $(BINDIR)/mysysctl-disable
	rm -f $(BINDIR)/mysysctl-validate
	rm -rf $(LIBDIR)
	@echo "Removed installation."

