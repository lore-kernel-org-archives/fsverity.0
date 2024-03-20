Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288DB13FFA
	for <fsverity@lists.linux.dev>; Wed, 20 Mar 2024 01:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710897616; cv=none; b=tktqw8DpzrpcEeZp1W83GGeCKMvKP1A56RrrJKw1JXLG3Wo70sr3Uvc67Xzx6+TROXLW5UMrt77xAb7GrGMGQTsTmvDHwEyb01gQiBztS18Krg4OzrMLyzY6NLVkJYIwnqeLa0NeP/nf3PkRSOrhJZ5nCBb4s3+fM2/vWR3GYw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710897616; c=relaxed/simple;
	bh=zy9uvxeq6tN9qo9vlanzTGKdWNizqsF/eZ+nh17KlBY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nZwQRvPzzTCr9pdT6HdHo94ZBYXT6V8qeVbNKlyAOcrIFswX90MC0L6fWhMY93RiovZP/x3dD1TErSORzgsFLk+eGE+yzAXljulMrXN8DNA6+iMmmRvjpUHedydbguMYwE2Jnr89wl/eTSDayJBN6oHO61WRtjNUYeRKfO2Oy4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ab6ZGgfr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ab6ZGgfr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F8AC433F1
	for <fsverity@lists.linux.dev>; Wed, 20 Mar 2024 01:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710897615;
	bh=zy9uvxeq6tN9qo9vlanzTGKdWNizqsF/eZ+nh17KlBY=;
	h=From:To:Subject:Date:From;
	b=ab6ZGgfrTRd7hWg6NLWiV9CRup1b79bT1NDVxsC0jeFB93aqXeot4+qn6jcBNZ1E1
	 C7xXzM9R7NwXPozAnHGEIahjFeI3fJvCQ8Yq1/vtuqCsNS++H6mAuGLOF16V3jrzBY
	 P67cCnuKcmZrTlTbYTVlzdwKkxsBO9YVOubmfAR+Zfss/SQfNeq1hj2SC0eyvWteTk
	 7NnwBwl+X6cSbTa7HOXFhaUl7WjgvaYAbjQm+rgL7MXZ7z4afaCPE+Y1EJ8EZMEBn0
	 d+8yEdxo0j02vmnj8bllAD0svpLm6YXjP+drTw2Q2J7ouUVN7dT8jn3+GxwBZebSJV
	 QX/nFyzQEuUGA==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Subject: [fsverity-utils PATCH] Eliminate dependency on pandoc
Date: Wed, 20 Mar 2024 01:19:05 +0000
Message-ID: <20240320011905.1824108-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

It's causing problems for Debian that fsverity-utils uses pandoc to
convert the fsverity.1 man page from markdown to a native Linux man page
(https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1066832).  Therefore,
just keep the fsverity.1 man page in native Linux man format.  Since no
processing of the page is needed anymore, just install it in
'make install', so that 'make install-man' is no longer needed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 .gitignore            |   1 -
 Makefile              |  16 +--
 README.md             |  12 +-
 man/fsverity.1        | 267 ++++++++++++++++++++++++++++++++++++++++++
 man/fsverity.1.md     | 220 ----------------------------------
 scripts/do-release.sh |   2 +-
 6 files changed, 277 insertions(+), 241 deletions(-)
 create mode 100644 man/fsverity.1
 delete mode 100644 man/fsverity.1.md

diff --git a/.gitignore b/.gitignore
index 3ea5ca6..35d3206 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,6 +1,5 @@
-*.[1-9]
 *.a
 *.exe
 *.o
 *.patch
 *.so
diff --git a/Makefile b/Makefile
index 2304a21..c3de571 100644
--- a/Makefile
+++ b/Makefile
@@ -68,11 +68,10 @@ ifneq ($(V),1)
 QUIET_CC        = @echo '  CC      ' $@;
 QUIET_CCLD      = @echo '  CCLD    ' $@;
 QUIET_AR        = @echo '  AR      ' $@;
 QUIET_LN        = @echo '  LN      ' $@;
 QUIET_GEN       = @echo '  GEN     ' $@;
-QUIET_PANDOC    = @echo '  PANDOC  ' $@;
 endif
 USE_SHARED_LIB  ?=
 PREFIX          ?= /usr/local
 BINDIR          ?= $(PREFIX)/bin
 INCDIR          ?= $(PREFIX)/include
@@ -203,15 +202,11 @@ EXTRA_TARGETS += $(TEST_PROGRAMS)
 
 ##############################################################################
 
 #### Manual pages
 
-man/fsverity.1:man/fsverity.1.md
-	$(QUIET_PANDOC) pandoc $+ -s -t man > $@
-
-MAN_PAGES := man/fsverity.1
-EXTRA_TARGETS += $(MAN_PAGES)
+MAN_PAGES := $(wildcard man/*.[1-9])
 
 ##############################################################################
 
 # Support for downloading and building BoringSSL.  The purpose of this is to
 # allow testing builds of fsverity-utils that link to BoringSSL instead of
@@ -226,12 +221,11 @@ boringssl:
 	cmake -B boringssl/build boringssl
 	$(MAKE) -C boringssl/build $(MAKEFLAGS)
 
 ##############################################################################
 
-SPECIAL_TARGETS := all test_programs check install install-man uninstall \
-		   help clean
+SPECIAL_TARGETS := all test_programs check install uninstall help clean
 
 FORCE:
 
 .PHONY: $(SPECIAL_TARGETS) FORCE
 
@@ -270,14 +264,14 @@ install:all
 		-e "s|@LIBDIR@|$(LIBDIR)|" \
 		-e "s|@INCDIR@|$(INCDIR)|" \
 		lib/libfsverity.pc.in \
 		> $(DESTDIR)$(LIBDIR)/pkgconfig/libfsverity.pc
 	chmod 644 $(DESTDIR)$(LIBDIR)/pkgconfig/libfsverity.pc
-
-install-man:$(MAN_PAGES)
 	install -d $(DESTDIR)$(MANDIR)/man1
-	install -m644 $+ $(DESTDIR)$(MANDIR)/man1/
+	for page in $(MAN_PAGES); do \
+		install -m644 $$page $(DESTDIR)$(MANDIR)/man1/; \
+	done
 
 uninstall:
 	rm -f $(DESTDIR)$(BINDIR)/$(FSVERITY)
 	rm -f $(DESTDIR)$(LIBDIR)/libfsverity.a
 	rm -f $(DESTDIR)$(LIBDIR)/libfsverity.so.$(SOVERSION)
diff --git a/README.md b/README.md
index 2019592..2080fb1 100644
--- a/README.md
+++ b/README.md
@@ -23,30 +23,26 @@ See `libfsverity.h` for the API of this library.
 To build fsverity-utils, first install the needed build dependencies.  For
 example, on Debian-based systems, run:
 
 ```bash
     sudo apt-get install libssl-dev
-    sudo apt-get install pandoc  # optional
 ```
 
 OpenSSL must be version 1.0.0 or later.  This is the only runtime dependency.
 
 Then, to build and install fsverity-utils:
 
 ```bash
     make
     sudo make install
-    sudo make install-man  # optional
 ```
 
 By default, the following targets are built and installed: the program
-`fsverity`, the static library `libfsverity.a`, and the shared library
-`libfsverity.so`.  You can also run `make check` to build and run the
-tests, or `make help` to display all available build targets.
-
-`make install-man` installs the `fsverity.1` manual page.  This step requires
-that `pandoc` be installed.
+`fsverity`, the static library `libfsverity.a`, the shared library
+`libfsverity.so`, and the manual page `fsverity.1`.  You can also run
+`make check` to build and run the tests, or `make help` to display all
+available build targets.
 
 By default, `fsverity` is statically linked to `libfsverity`.  You can
 use `make USE_SHARED_LIB=1` to use dynamic linking instead.
 
 See the `Makefile` for other supported build and installation options.
diff --git a/man/fsverity.1 b/man/fsverity.1
new file mode 100644
index 0000000..d29f2af
--- /dev/null
+++ b/man/fsverity.1
@@ -0,0 +1,267 @@
+.\" SPDX-License-Identifier: MIT
+.\"
+.\" Copyright 2021 Google LLC
+.\"
+.\" Use of this source code is governed by an MIT-style license that can be
+.\" found in the LICENSE file or at https://opensource.org/licenses/MIT.
+.\"
+.TH "FSVERITY" "1" "February 2022" "fsverity-utils v1.5" "User Commands"
+.hy
+.
+.SH NAME
+.PP
+fsverity - userspace utility for fs-verity
+.
+.
+.SH SYNOPSIS
+.PP
+\f[B]fsverity digest\f[R] [\f[I]OPTION\f[R]\&...]
+\f[I]FILE\f[R]\&...
+.PD 0
+.P
+.PD
+\f[B]fsverity dump_metadata\f[R] [\f[I]OPTION\f[R]\&...]
+\f[I]TYPE\f[R] \f[I]FILE\f[R]
+.PD 0
+.P
+.PD
+\f[B]fsverity enable\f[R] [\f[I]OPTION\f[R]\&...]
+\f[I]FILE\f[R]
+.PD 0
+.P
+.PD
+\f[B]fsverity measure\f[R] \f[I]FILE\f[R]\&...
+.PD 0
+.P
+.PD
+\f[B]fsverity sign\f[R] [\f[I]OPTION\f[R]\&...]
+\f[I]FILE\f[R] \f[I]OUT_SIGFILE\f[R]
+.
+.
+.SH DESCRIPTION
+.PP
+\f[B]fsverity\f[R] is a userspace utility for fs-verity.
+fs-verity is a Linux kernel filesystem feature that does transparent on-demand
+verification of the contents of read-only files using Merkle trees.
+.PP
+\f[B]fsverity\f[R] can enable fs-verity on files, retrieve the digests of
+fs-verity files, and sign files for use with fs-verity (among other things).
+\f[B]fsverity\f[R]\[cq]s functionality is divided among various subcommands.
+.PP
+This manual page focuses on documenting all \f[B]fsverity\f[R] subcommands and
+options.
+For examples and more information about the fs-verity kernel feature, see the
+references at the end of this page.
+.
+.
+.SH OPTIONS
+.PP
+\f[B]fsverity\f[R] always accepts the following options:
+.TP
+\f[B]--help\f[R]
+Show the help, for either one subcommand or for all subcommands.
+.TP
+\f[B]--version\f[R]
+Show the version of fsverity-utils.
+.
+.
+.SH SUBCOMMANDS
+.
+.SS \f[B]fsverity digest\f[R] [\f[I]OPTION\f[R]\&...] \f[I]FILE\f[R]\&...
+.PP
+Compute the fs-verity digest of the given file(s).
+This is mainly intended to used in preparation for signing the digest.
+In some cases \f[B]fsverity sign\f[R] can be used instead to digest and sign the
+file in one step.
+.PP
+Options accepted by \f[B]fsverity digest\f[R]:
+.TP
+\f[B]--block-size\f[R]=\f[I]BLOCK_SIZE\f[R]
+The Merkle tree block size (in bytes) to use.
+This must be a power of 2 and at least twice the size of the hash values.
+.RS
+.PP
+Note that the Linux kernel implementations of fs-verity place further
+restrictions on the Merkle tree block size.
+Linux v6.2 and earlier require that the Merkle tree block size be equal to both
+the system page size and the filesystem block size.
+These values are often 4096.
+Linux v6.3 and later are more flexible; they require that the Merkle tree block
+size be a power of 2 that is greater than or equal to 1024 and less than or
+equal to the system page size and the filesystem block size.
+The default value of this option is 4096.
+.RE
+.TP
+\f[B]--compact\f[R]
+When printing the file digest, only print the actual digest hex string;
+don\[cq]t print the algorithm name and filename.
+.TP
+\f[B]--for-builtin-sig\f[R]
+Format the file digest in a way that is compatible with the Linux kernel\[cq]s
+fs-verity built-in signature verification support.
+This means formatting it as a \f[B]struct fsverity_formatted_digest\f[R].
+Use this option if you are using built-in signatures but are not using
+\f[B]fsverity sign\f[R] to do the signing.
+.TP
+\f[B]--hash-alg\f[R]=\f[I]HASH_ALG\f[R]
+The hash algorithm to use to build the Merkle tree.
+Valid options are sha256 and sha512.
+Default is sha256.
+.TP
+\f[B]--out-merkle-tree\f[R]=\f[I]FILE\f[R]
+Write the computed Merkle tree to the given file.
+The Merkle tree layout will be the same as that used by the Linux kernel\[cq]s
+\f[B]FS_IOC_READ_VERITY_METADATA\f[R] ioctl.
+.RS
+.PP
+Normally this option isn\[cq]t useful, but it can be needed in cases where the
+fs-verity metadata needs to be consumed by something other than one of the
+native Linux kernel implementations of fs-verity.
+This is not needed for file signing.
+.RE
+.TP
+\f[B]--out-descriptor\f[R]=\f[I]FILE\f[R]
+Write the computed fs-verity descriptor to the given file.
+.RS
+.PP
+Normally this option isn\[cq]t useful, but it can be needed in cases where the
+fs-verity metadata needs to be consumed by something other than one of the
+native Linux kernel implementations of fs-verity.
+This is not needed for file signing.
+.RE
+.TP
+\f[B]--salt\f[R]=\f[I]SALT\f[R]
+The salt to use in the Merkle tree, as a hex string.
+The salt is a value that is prepended to every hashed block; it can be used to
+personalize the hashing for a particular file or device.
+The default is no salt.
+.
+.SS \f[B]fsverity dump_metadata\f[R] [\f[I]OPTION\f[R]\&...] \f[I]TYPE\f[R] \f[I]FILE\f[R]
+.PP
+Dump the fs-verity metadata of the given file.
+The file must have fs-verity enabled, and the filesystem must support the
+\f[B]FS_IOC_READ_VERITY_METADATA\f[R] ioctl (it was added in Linux v5.12).
+This subcommand normally isn\[cq]t useful, but it can be useful in cases where a
+userspace server program is serving a verity file to a client which implements
+fs-verity compatible verification.
+.PP
+\f[I]TYPE\f[R] may be \[lq]merkle_tree\[rq], \[lq]descriptor\[rq], or
+\[lq]signature\[rq], indicating the type of metadata to dump.
+\[lq]signature\[rq] refers to the built-in signature, if present;
+userspace-managed signatures will not be included.
+.PP
+Options accepted by \f[B]fsverity dump_metadata\f[R]:
+.TP
+\f[B]--length\f[R]=\f[I]LENGTH\f[R]
+Length in bytes to dump from the specified metadata item.
+Only accepted in combination with \f[B]--offset\f[R].
+.TP
+\f[B]--offset\f[R]=\f[I]offset\f[R]
+Offset in bytes into the specified metadata item at which to start dumping.
+Only accepted in combination with \f[B]--length\f[R].
+.
+.SS \f[B]fsverity enable\f[R] [\f[I]OPTION\f[R]\&...] \f[I]FILE\f[R]
+.PP
+Enable fs-verity on the specified file.
+This will only work if the filesystem supports fs-verity.
+.PP
+Options accepted by \f[B]fsverity enable\f[R]:
+.TP
+\f[B]--block-size\f[R]=\f[I]BLOCK_SIZE\f[R]
+Same as for \f[B]fsverity digest\f[R].
+.TP
+\f[B]--hash-alg\f[R]=\f[I]HASH_ALG\f[R]
+Same as for \f[B]fsverity digest\f[R].
+.TP
+\f[B]--salt\f[R]=\f[I]SALT\f[R]
+Same as for \f[B]fsverity digest\f[R].
+.TP
+\f[B]--signature\f[R]=\f[I]SIGFILE\f[R]
+Specifies the built-in signature to apply to the file.
+\f[I]SIGFILE\f[R] must be a file that contains the signature in PKCS#7 DER
+format, e.g.\ as produced by the \f[B]fsverity sign\f[R] command.
+.RS
+.PP
+Note that this option is only needed if the Linux kernel\[cq]s fs-verity
+built-in signature verification support is being used.
+It is not needed if the signatures will be verified in userspace, as in that
+case the signatures should be stored separately.
+.RE
+.
+.SS \f[B]fsverity measure\f[R] \f[I]FILE\f[R]\&...
+.PP
+Display the fs-verity digest of the given file(s).
+The files must have fs-verity enabled.
+The output will be the same as \f[B]fsverity digest\f[R] with the appropriate
+parameters, but \f[B]fsverity measure\f[R] will take constant time for each file
+regardless of the size of the file.
+.PP
+\f[B]fsverity measure\f[R] does not accept any options.
+.
+.SS \f[B]fsverity sign\f[R] [\f[I]OPTION\f[R]\&...] \f[I]FILE\f[R] \f[I]OUT_SIGFILE\f[R]
+.PP
+Sign the given file for fs-verity, in a way that is compatible with the Linux
+kernel\[cq]s fs-verity built-in signature verification support.
+The signature will be written to \f[I]OUT_SIGFILE\f[R] in PKCS#7 DER format.
+.PP
+The private key can be specified either by key file or by PKCS#11 token.
+To use a key file, provide \f[B]--key\f[R] and optionally \f[B]--cert\f[R].
+To use a PKCS#11 token, provide \f[B]--pkcs11-engine\f[R],
+\f[B]--pkcs11-module\f[R], \f[B]--cert\f[R], and optionally
+\f[B]--pkcs11-keyid\f[R].
+PKCS#11 token support is unavailable when fsverity-utils was built with
+BoringSSL rather than OpenSSL.
+.PP
+\f[B]fsverity sign\f[R] should only be used if you need compatibility with
+fs-verity built-in signatures.
+It is not the only way to do signatures with fs-verity.
+For more information, see the fsverity-utils README.
+.PP
+Options accepted by \f[B]fsverity sign\f[R]:
+.TP
+\f[B]--block-size\f[R]=\f[I]BLOCK_SIZE\f[R]
+Same as for \f[B]fsverity digest\f[R].
+.TP
+\f[B]--cert\f[R]=\f[I]CERTFILE\f[R]
+Specifies the file that contains the certificate, in PEM format.
+This option is required if \f[I]KEYFILE\f[R] contains only the private key and
+not also the certificate, or if a PKCS#11 token is used.
+.TP
+\f[B]--hash-alg\f[R]=\f[I]HASH_ALG\f[R]
+Same as for \f[B]fsverity digest\f[R].
+.TP
+\f[B]--key\f[R]=\f[I]KEYFILE\f[R]
+Specifies the file that contains the private key, in PEM format.
+This option is required when not using a PKCS#11 token.
+.TP
+\f[B]--out-descriptor\f[R]=\f[I]FILE\f[R]
+Same as for \f[B]fsverity digest\f[R].
+.TP
+\f[B]--out-merkle-tree\f[R]=\f[I]FILE\f[R]
+Same as for \f[B]fsverity digest\f[R].
+.TP
+\f[B]--pkcs11-engine\f[R]=\f[I]SOFILE\f[R]
+Specifies the path to the OpenSSL PKCS#11 engine file.
+This typically will be a path to the libp11 .so file.
+This option is required when using a PKCS#11 token.
+.TP
+\f[B]--pkcs11-keyid\f[R]=\f[I]KEYID\f[R]
+Specifies the key identifier in the form of a PKCS#11 URI.
+If not provided, the default key associated with the token is used.
+This option is only applicable when using a PKCS#11 token.
+.TP
+\f[B]--pkcs11-module\f[R]=\f[I]SOFILE\f[R]
+Specifies the path to the PKCS#11 token-specific module library.
+This option is required when using a PKCS#11 token.
+.TP
+\f[B]--salt\f[R]=\f[I]SALT\f[R]
+Same as for \f[B]fsverity digest\f[R].
+.
+.
+.SH SEE ALSO
+.PP
+For example commands and more information, see the README file for
+fsverity-utils (https://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git/tree/README.md).
+.PP
+Also see the kernel documentation for
+fs-verity (https://www.kernel.org/doc/html/latest/filesystems/fsverity.html).
diff --git a/man/fsverity.1.md b/man/fsverity.1.md
deleted file mode 100644
index f268706..0000000
--- a/man/fsverity.1.md
+++ /dev/null
@@ -1,220 +0,0 @@
-% FSVERITY(1) fsverity-utils v1.5 | User Commands
-%
-% February 2022
-
-# NAME
-
-fsverity - userspace utility for fs-verity
-
-# SYNOPSIS
-**fsverity digest** [*OPTION*...] *FILE*... \
-**fsverity dump_metadata** [*OPTION*...] *TYPE* *FILE* \
-**fsverity enable** [*OPTION*...] *FILE* \
-**fsverity measure** *FILE*... \
-**fsverity sign** [*OPTION*...] *FILE* *OUT_SIGFILE*
-
-# DESCRIPTION
-
-**fsverity** is a userspace utility for fs-verity.  fs-verity is a Linux kernel
-filesystem feature that does transparent on-demand verification of the contents
-of read-only files using Merkle trees.
-
-**fsverity** can enable fs-verity on files, retrieve the digests of fs-verity
-files, and sign files for use with fs-verity (among other things).
-**fsverity**'s functionality is divided among various subcommands.
-
-This manual page focuses on documenting all **fsverity** subcommands and
-options.  For examples and more information about the fs-verity kernel feature,
-see the references at the end of this page.
-
-# OPTIONS
-
-**fsverity** always accepts the following options:
-
-**\-\-help**
-:   Show the help, for either one subcommand or for all subcommands.
-
-**\-\-version**
-:   Show the version of fsverity-utils.
-
-# SUBCOMMANDS
-
-## **fsverity digest** [*OPTION*...] *FILE*...
-
-Compute the fs-verity digest of the given file(s).  This is mainly intended to
-used in preparation for signing the digest.  In some cases **fsverity sign**
-can be used instead to digest and sign the file in one step.
-
-Options accepted by **fsverity digest**:
-
-**\-\-block-size**=*BLOCK_SIZE*
-:   The Merkle tree block size (in bytes) to use.  This must be a power of 2 and
-    at least twice the size of the hash values.
-
-    Note that the Linux kernel implementations of fs-verity place further
-    restrictions on the Merkle tree block size.  Linux v6.2 and earlier require
-    that the Merkle tree block size be equal to both the system page size and
-    the filesystem block size.  These values are often 4096.  Linux v6.3 and
-    later are more flexible; they require that the Merkle tree block size be a
-    power of 2 that is greater than or equal to 1024 and less than or equal to
-    the system page size and the filesystem block size.  The default value of
-    this option is 4096.
-
-**\-\-compact**
-:   When printing the file digest, only print the actual digest hex string;
-    don't print the algorithm name and filename.
-
-**\-\-for-builtin-sig**
-:   Format the file digest in a way that is compatible with the Linux kernel's
-    fs-verity built-in signature verification support.  This means formatting it
-    as a `struct fsverity_formatted_digest`.  Use this option if you are using
-    built-in signatures but are not using **fsverity sign** to do the signing.
-
-**\-\-hash-alg**=*HASH_ALG*
-:   The hash algorithm to use to build the Merkle tree.  Valid options are
-    sha256 and sha512.  Default is sha256.
-
-**\-\-out-merkle-tree**=*FILE*
-:   Write the computed Merkle tree to the given file.  The Merkle tree layout
-    will be the same as that used by the Linux kernel's
-    `FS_IOC_READ_VERITY_METADATA` ioctl.
-
-    Normally this option isn't useful, but it can be needed in cases where the
-    fs-verity metadata needs to be consumed by something other than one of the
-    native Linux kernel implementations of fs-verity.  This is not needed for
-    file signing.
-
-**\-\-out-descriptor**=*FILE*
-:   Write the computed fs-verity descriptor to the given file.
-
-    Normally this option isn't useful, but it can be needed in cases where the
-    fs-verity metadata needs to be consumed by something other than one of the
-    native Linux kernel implementations of fs-verity.  This is not needed for
-    file signing.
-
-**\-\-salt**=*SALT*
-:   The salt to use in the Merkle tree, as a hex string.  The salt is a value
-    that is prepended to every hashed block; it can be used to personalize the
-    hashing for a particular file or device.  The default is no salt.
-
-## **fsverity dump_metadata** [*OPTION*...] *TYPE* *FILE*
-
-Dump the fs-verity metadata of the given file.  The file must have fs-verity
-enabled, and the filesystem must support the `FS_IOC_READ_VERITY_METADATA` ioctl
-(it was added in Linux v5.12).  This subcommand normally isn't useful, but it
-can be useful in cases where a userspace server program is serving a verity file
-to a client which implements fs-verity compatible verification.
-
-*TYPE* may be "merkle\_tree", "descriptor", or "signature", indicating the type
-of metadata to dump.  "signature" refers to the built-in signature, if present;
-userspace-managed signatures will not be included.
-
-Options accepted by **fsverity dump_metadata**:
-
-**\-\-length**=*LENGTH*
-:   Length in bytes to dump from the specified metadata item.  Only accepted in
-    combination with **\-\-offset**.
-
-**\-\-offset**=*offset*
-:   Offset in bytes into the specified metadata item at which to start dumping.
-    Only accepted in combination with **\-\-length**.
-
-## **fsverity enable** [*OPTION*...] *FILE*
-
-Enable fs-verity on the specified file.  This will only work if the filesystem
-supports fs-verity.
-
-Options accepted by **fsverity enable**:
-
-**\-\-block-size**=*BLOCK_SIZE*
-:   Same as for **fsverity digest**.
-
-**\-\-hash-alg**=*HASH_ALG*
-:   Same as for **fsverity digest**.
-
-**\-\-salt**=*SALT*
-:   Same as for **fsverity digest**.
-
-**\-\-signature**=*SIGFILE*
-:   Specifies the built-in signature to apply to the file.  *SIGFILE* must be a
-    file that contains the signature in PKCS#7 DER format, e.g. as produced by
-    the **fsverity sign** command.
-
-    Note that this option is only needed if the Linux kernel's fs-verity
-    built-in signature verification support is being used.  It is not needed if
-    the signatures will be verified in userspace, as in that case the signatures
-    should be stored separately.
-
-## **fsverity measure** *FILE*...
-
-Display the fs-verity digest of the given file(s).  The files must have
-fs-verity enabled.  The output will be the same as **fsverity digest** with
-the appropriate parameters, but **fsverity measure** will take constant time
-for each file regardless of the size of the file.
-
-**fsverity measure** does not accept any options.
-
-## **fsverity sign** [*OPTION*...] *FILE* *OUT_SIGFILE*
-
-Sign the given file for fs-verity, in a way that is compatible with the Linux
-kernel's fs-verity built-in signature verification support.  The signature will
-be written to *OUT_SIGFILE* in PKCS#7 DER format.
-
-The private key can be specified either by key file or by PKCS#11 token.  To use
-a key file, provide **\-\-key** and optionally **\-\-cert**.  To use a PKCS#11
-token, provide **\-\-pkcs11-engine**, **\-\-pkcs11-module**, **\-\-cert**, and
-optionally **\-\-pkcs11-keyid**.  PKCS#11 token support is unavailable when
-fsverity-utils was built with BoringSSL rather than OpenSSL.
-
-**fsverity sign** should only be used if you need compatibility with fs-verity
-built-in signatures.  It is not the only way to do signatures with fs-verity.
-For more information, see the fsverity-utils README.
-
-Options accepted by **fsverity sign**:
-
-**\-\-block-size**=*BLOCK_SIZE*
-:   Same as for **fsverity digest**.
-
-**\-\-cert**=*CERTFILE*
-:   Specifies the file that contains the certificate, in PEM format.  This
-    option is required if *KEYFILE* contains only the private key and not also
-    the certificate, or if a PKCS#11 token is used.
-
-**\-\-hash-alg**=*HASH_ALG*
-:   Same as for **fsverity digest**.
-
-**\-\-key**=*KEYFILE*
-:   Specifies the file that contains the private key, in PEM format.  This
-    option is required when not using a PKCS#11 token.
-
-**\-\-out-descriptor**=*FILE*
-:   Same as for **fsverity digest**.
-
-**\-\-out-merkle-tree**=*FILE*
-:   Same as for **fsverity digest**.
-
-**\-\-pkcs11-engine**=*SOFILE*
-:   Specifies the path to the OpenSSL PKCS#11 engine file.  This typically will
-    be a path to the libp11 .so file.  This option is required when using a
-    PKCS#11 token.
-
-**\-\-pkcs11-keyid**=*KEYID*
-:   Specifies the key identifier in the form of a PKCS#11 URI.  If not provided,
-    the default key associated with the token is used.  This option is only
-    applicable when using a PKCS#11 token.
-
-**\-\-pkcs11-module**=*SOFILE*
-:   Specifies the path to the PKCS#11 token-specific module library.  This
-    option is required when using a PKCS#11 token.
-
-**\-\-salt**=*SALT*
-:   Same as for **fsverity digest**.
-
-# SEE ALSO
-
-For example commands and more information, see the
-[README file for
-fsverity-utils](https://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git/tree/README.md).
-
-Also see the [kernel documentation for
-fs-verity](https://www.kernel.org/doc/html/latest/filesystems/fsverity.html).
diff --git a/scripts/do-release.sh b/scripts/do-release.sh
index 3f68497..5339110 100755
--- a/scripts/do-release.sh
+++ b/scripts/do-release.sh
@@ -52,11 +52,11 @@ prepare_release()
 		  include/libfsverity.h
 	sed -E -i "/Version:/s/[0-9]+\.[0-9]+/$VERS/" \
 		  lib/libfsverity.pc.in
 	sed -E -i -e "/^% /s/fsverity-utils v[0-9]+(\.[0-9]+)+/fsverity-utils v$VERS/" \
 		  -e "/^% /s/[a-zA-Z]+ 2[0-9]{3}/$month $year/" \
-		  man/*.[1-9].md
+		  man/*.[1-9]
 	git commit -a --signoff --message="v$VERS"
 	git tag --sign "v$VERS" --message="$PKG"
 
 	git archive "v$VERS" --prefix="$PKG/" > "$PKG.tar"
 	tar xf "$PKG.tar"

base-commit: 4ba79698b0381fe953f2d74b622b3b9586969e2b
-- 
2.44.0.291.gc1ea87d7ee-goog

