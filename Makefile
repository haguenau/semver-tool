prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libexecdir = $(exec_prefix)/libexec

all: src/semver

src/semver: src/semver.in
	sed -e 's#@LIBEXECDIR@#$(libexecdir)/semver#' $< > $@

clean:
	rm -f src/semver

# TODO: find a test framework
check: src/semver
#	cd test; ./documentation-test

install: src/semver
	install -d $(bindir)
	install -t $(bindir) -m 755 src/semver
	install -d $(libexecdir)/semver
	install -t $(libexecdir)/semver lib/version-file

.PHONY: all check clean install
