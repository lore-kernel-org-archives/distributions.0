Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2190310774
	for <distributions@lists.linux.dev>; Mon, 16 Feb 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251628; cv=none; b=STrZrUIiZDMaYI00PS/LOmJUh5AGN20OvjqT6Hhcd6En/027D7gcm6imdwnureEt+ntNEsy5IMduljLQlsPFiH2XMS4UUYr2sq7K76vCuu5c8qeH5q6atUi7wTlYg73Y4qj5O4DzG1O9f3L+tUIG8D0biH334Sjvs2KcMWVSek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251628; c=relaxed/simple;
	bh=ef33wFvSfhjawNbTppmsoYicLJ/FEJj21G1Pxrah1vE=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=I5df4GM8945Gv/YeMdQb9nyW6v5xUdDWsIO7c/ieiu0ptdpdbOYk8J4N25I6OLVIeCZfYUrElNXZAgSQewJcqW+DGSZnC9Wq0FdnHUkeja92WcoqOS7VdMTfuV/CNqWHOWW51XrqhgnpWZbuTqVSdNkczy5f6j0hxrPbfD1n6RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org; spf=pass smtp.mailfrom=owlfolio.org; dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b=WCQf3GIp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MCfMeahN; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=owlfolio.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=owlfolio.org header.i=@owlfolio.org header.b="WCQf3GIp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MCfMeahN"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id C48ED1D00159
	for <distributions@lists.linux.dev>; Mon, 16 Feb 2026 09:20:23 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Mon, 16 Feb 2026 09:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owlfolio.org; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1771251623; x=1771338023; bh=jXJo0PEqNE
	9GNgOJ4ydIfAMx8Xz0eAf2S/s9yowZ64U=; b=WCQf3GIpHFNvSIqoJQMdAjlYEc
	CvBsq/OJB5z8irVLG+3otiPrGl4QTyEd1f6eMd9JBLytqHy1M9ZiuSjnZjgIGeFj
	Rr00Se78ow0Rr4Tb9etbFVVwY3dswj60e04lC10MPdT5JRjJPGAdnN/bgLdoalmZ
	J2eU86fW3XCn8RS1+JZj3Hc9Ewhm+bj6M6hoOq1CxqKYPepA+rTwxcBm70BrQkOn
	fSUd9EKG4rjCUyH0zb7eeN+v26BzIrK6tK0+HDrO5eP7aPIDgQvbNx8J0W5CPmSe
	ARrJKkKljNgt4kfPbMlLsmqL71teksaucD7OJ8bVbQF+JlTxHe+gHARn/rug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771251623; x=1771338023; bh=jXJo0PEqNE9GNgOJ4ydIfAMx8Xz0eAf2S/s
	9yowZ64U=; b=MCfMeahN9ggEcG8mYjVyDtsdI2SQ3+BqLj86vtwN+vk9t0/hO+Z
	YPSoxuKS37lGhnjRMUU7rKww9muvIdR1Y90GQoqw+KX1h63k1wzcO3SYtqsXoIVs
	omsUJtuQUnr9dPGKFVpOUR5YB2GwEW8LQA2Ob5ZEFw8leM1FLvZRwoWNHKblOmj3
	Yv/mi2jPd+dhUk0yghzaqCqwI6iCH9L0u2Av4WaZ0JJJiy5Ign2f3+kuZ6y3jy+f
	0N9Wyb6ZfXl1nuGalrxfQfQsZWVBW4UM6Gviiu3JWRXy2ec4ePTMlX2mk7waok25
	Xvy4WrNXJU8vdEc8+Uaby0NcTd7DRdiaS7w==
X-ME-Sender: <xms:pyeTaYhNaKfXhBp3Fnia9qW2YM1yOb8fkyaBf0bYcBjE2QFyrBivpQ>
    <xme:pyeTab0GAEJn8iLFuejShinxhg95FHCIkj__ZQhaEeCzNNZt-g9f7HjskCo140bRL
    LsttjigecA7ZIZBLvSITI8E6lmN2cX1Etyg2vAXR-fnzjWSt1JF9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudejtdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtqhertdertd
    ejnecuhfhrohhmpedfkggrtghkucghvghinhgsvghrghdfuceoiigrtghksehofihlfhho
    lhhiohdrohhrgheqnecuggftrfgrthhtvghrnhepgfffhfeuheekgffhjeetgfeugffgue
    eggeegjefhvdfhteeiveelveeifeeugeegnecuffhomhgrihhnpehgnhhurdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepiigrtghkse
    hofihlfhholhhiohdrohhrghdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepughishhtrhhisghuthhiohhnsheslhhishhtshdrlhhinhhugi
    druggvvh
X-ME-Proxy: <xmx:pyeTaZwOQfWee3PsUraqxdIv67diGU_lQl-Qlk7571gI_JzeUtaHug>
    <xmx:pyeTaZPhGAhxrZvYPelBQRzcCrTKw_NDqQeJu99Eu2-vhj5HxBMr7w>
    <xmx:pyeTaQMT69sc5y1tRg3bGmd7kGF1pr0FFaLttl9wHLgEGpM3QfT5Hg>
    <xmx:pyeTaTS3mriHR25Wvneq4x_Kes838iIGECdxkeQJghtsBq38oYn3Kw>
    <xmx:pyeTacFv3-TyuHbt6RINsPZzE4HEpQUhLuRJsdb8KrVecN8In_ykAYN5>
Feedback-ID: i876146a2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EBF0EC4006E; Mon, 16 Feb 2026 09:20:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
x-forwarded-message-id: 
 <2217802e-1023-40b0-9df6-2f6dc2f5c9aa@app.fastmail.com>
Date: Mon, 16 Feb 2026 09:20:02 -0500
From: "Zack Weinberg" <zack@owlfolio.org>
To: distributions@lists.linux.dev
Message-Id: <00112fd1-f408-46df-9824-bf9ae2ef8d41@app.fastmail.com>
Subject: Fwd: autoconf-2.72.90 released [beta]
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

----- Original message -----
From: Zack Weinberg <zack@owlfolio.org>
To: Autoconf <autoconf@gnu.org>
Cc: bug-autoconf@gnu.org, autotools-announce@gnu.org, platform-testers@g=
nu.org
Subject: autoconf-2.72.90 released [beta]
Date: Tuesday, February 03, 2026 4:00 PM

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

This is to announce autoconf-2.72.90, a beta release for the
forthcoming autoconf 2.73.  This is largely a bug-fix release;
the most important change is improved support for the 2024 revision
of the C standard (commonly known as "C23") and for compilers that
default to that revision.  See the NEWS excerpt below for details,
and for a brief summary of other important changes since autoconf 2.72.

Please test this beta widely, especially with the combination of new
compilers (defaulting to C23) and old programs that *should have*
been updated for the non-backward-compatible changes in C23.

We plan to make the final release of autoconf 2.73 toward the end of
February 2026.

There have been 124 commits by 17 people in the 110 weeks since 2.72.
Thanks to everyone who has contributed!
The following people contributed changes to this release:

  Alyssa Ross (1)
  Basil L. Contovounesios (1)
  Bruno Haible (8)
  Christian Feld (1)
  Jack Kelly (1)
  Jan Andr=C3=A9 Reuter (1)
  Jim Meyering (1)
  Jose E. Marchesi (1)
  KO Myung-Hun (1)
  Luke Mewburn (1)
  Markus M=C3=BCtzel (1)
  Paul Eggert (77)
  R. Diez (1)
  Sevan Janiyan (1)
  Vincent Lefevre (1)
  Yann E. MORIN (1)
  Zack Weinberg (25)

zw
 [on behalf of the autoconf maintainers]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Here is the GNU autoconf home page:
    https://gnu.org/s/autoconf/

Here are the compressed sources:
  https://alpha.gnu.org/gnu/autoconf/autoconf-2.72.90.tar.gz   (2.1MB)
  https://alpha.gnu.org/gnu/autoconf/autoconf-2.72.90.tar.xz   (1.4MB)

Here are the GPG detached signatures:
  https://alpha.gnu.org/gnu/autoconf/autoconf-2.72.90.tar.gz.sig
  https://alpha.gnu.org/gnu/autoconf/autoconf-2.72.90.tar.xz.sig

Use a mirror for higher download bandwidth:
  https://www.gnu.org/order/ftp.html

Here are the SHA256 and SHA3-256 checksums:

  File: autoconf-2.72.90.tar.gz
  SHA256 sum:   36f11c36944deef7c03919717f5f7dfe4a4f5c2857827736d77ecc07=
187fe835
  SHA3-256 sum: 582ce76b7915a56bee1042187ca44bf78059911d31451f8f5e2e7d6e=
9ec411a4

  File: autoconf-2.72.90.tar.xz
  SHA256 sum:   ecd8675dc049db9560825cd0ef2b950c58b8cf743451e41c2b8429aa=
5e9eb1cb
  SHA3-256 sum: 3defc2ec6eb0fbfd262a43333ade8ef50dd2f5a2ff33a18bb478e4f8=
8881c991

Verify the SHA256 checksum with either sha256sum, sha256, or
'shasum -a 256'.

Verify the SHA3-256 checksum with 'cksum -a sha3 -l 256 --base64'
from coreutils-9.8.

Use a .sig file to verify that the corresponding file (without the
.sig suffix) is intact.  First, be sure to download both the .sig file
and the corresponding tarball.  Then, run a command like this:

  gpg --verify autoconf-2.72.90.tar.gz.sig

The signature should match the fingerprint of the following key:

  pub   rsa4096 2010-01-14 [SC]
        82F8 54F3 CE73 174B 8B63  1740 91FC C32B 6769 AA64
  uid           Zack Weinberg  <zackw@panix.com>

If that command fails because you don't have the required public key,
or that public key has expired, try the following commands to retrieve
or refresh it, and then rerun the 'gpg --verify' command.

  gpg --locate-external-key zackw@panix.com
  gpg --recv-keys 91FCC32B6769AA64

As a last resort to find the key, you can try the official GNU
keyring:

  wget -q https://ftp.gnu.org/gnu/gnu-keyring.gpg
  gpg --keyring gnu-keyring.gpg --verify autoconf-2.72.90.tar.gz.sig

This release is based on the autoconf git repository, available as

  git clone https://https.git.savannah.gnu.org/git/autoconf.git

with commit 11dbdfde4015d92e47d90de9e16ea25e677a1b01 tagged as v2.72.90.

For a summary of changes and contributors, see:

  https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dautoconf.git;a=3Dshort=
log;h=3Dv2.72.90

or run this command from a git-cloned autoconf directory:

  git shortlog v2.72..v2.72.90

This release was bootstrapped with the following tools:
  Automake 1.18.1

NEWS

* Noteworthy changes in release 2.72.90 (2026-02-03) [beta]

** Backward incompatibilities

*** AC_PROG_CC now prefers C23 if available.
  Older code may need to be updated, as C23 has removed old-style
  (K&R) function definitions and declarations, now uses type-generic
  functions for strchr and similar functions, and has new keywords
  alignas, alignof, bool, constexpr, false, nullptr, static_assert,
  thread_local, true, typeof, typeof_unqual.

*** AC_PROG_CC no longer checks __STDC__ or variable length arrays (VLAs=
).
  This ports better to MSVC, which does not define __STDC__ and does
  not support VLAs.  Although C99 requires VLAs, they are optional in
  C11 and later.  Programs can use AC_C_VARARRAYS and __STDC_NO_VLA__
  to use VLAs if available.

*** AC_PROG_CXX no longer attempts to switch to C++98 or C++11.
  Instead, it uses the compiler's default, which you can override
  by configuring with something like CXX=3D'g++ -std=3Dgnu++11'.
  This reverts to Autoconf 2.69 behavior, and also fixes a bug where
  AC_PROG_CXX rejected C++20 compilers.

** New features

*** Programs now recognize #elifdef and #elifndef.
  The autom4te, autoscan and ifnames programs now recognize the two
  preprocessor directives, which were introduced in C23 and C++23.

*** Support for the Algol 68 programming language has been added.
  The new macro AC_LANG_A68 sets variables A68 and A68FLAGS.

*** AC_PROG_AWK now also checks for busybox awk.

*** AC_USE_SYSTEM_EXTENSIONS now defines _COSMO_SOURCE for Cosmopolitan =
Libc.

** Notable bug fixes

*** AC_CHECK_DECL and AC_CHECK_DECLS will, on macOS, now report "no" for
  functions that are declared as existing in future macOS versions only.

*** AC_DEFINE_UNQUOTED no longer mishandles double-quotes inside $(...)
  and ${...}.

*** AC_DEFINE and similar macros no longer emit trailing whitespace.
  This pacifies the -Wtrailing-whitespace introduced in GCC 15.

*** AC_FUNC_STRNLEN now detects Android 5.0's broken strnlen.

*** AC_PROG_OBJC now finds the GNU Objective-C compiler, as packaged in
  EPEL 9, by default, without the user having to set the OBJC variable.

*** Autoconf no longer generates ${1+"$@"} in scripts, working around
  a bug in AIX 7.2 ksh93.

*** config.status now fails with a diagnostic if awk is missing,
  rather than misbehaving.

*** autoreconf handles projects using GNU Gettext and/or gtk-doc better.
  A variety of situations where autoreconf would try to run the
  'autopoint' and/or 'gtkdocize' tools when it shouldn't have,
  or *wouldn't* run them when it *should* have, have been corrected.
  See <https://savannah.gnu.org/support/index.php?111273>,
  <https://savannah.gnu.org/support/index.php?111272>,
  <https://savannah.gnu.org/support/index.php?111271>,
  <https://savannah.gnu.org/support/index.php?110503>.

*** autoconf no longer installs a file named "version.m4".
  This eliminates an annoying (but harmless) warning produced by
  Autoconf 2.72 when projects contain their own "version.m4".
-----BEGIN PGP SIGNATURE-----

iQJPBAEBCAA5FiEEgvhU885zF0uLYxdAkfzDK2dpqmQFAmmCYWgbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEJH8wytnaapkwh4P/RyYN9wx9ajskFI/COXF
gcfYKcjU2hflbACaLgeSA8E26EWMFZK7HPxOeqybsgUoAexgEwS/++gH5bCAYt9O
PcFC+ZVRcuoLdNWjpoACpXbH+gavVQOa12AvPFUnj8CHiSZdRMjSeN11QusxXD7i
spBij8//XI1093KAE+yZKVAwB6Ape4goUKBep0iSv3PtaF/DJwnY8vDLwSiE6Rv8
IlctgvK5N3UCftmp/3C8qwPeU3ZrLq2pA/Oyal9vK1B5NP3QWKVk4u2HATp0CE2y
JiVtx6QvKjIejfzMHoHdlZCD3mXrRTPq8Gj5voMyiiv/iqXIytAlQsaIedak0Zkt
dTEIVjpHD52ZQbjbdL9bekT5nuBoLuz69HAa/eJbXOeUanwcNmjoGJJeK37x/f2l
bDS94EvGiyfwFGW7GV7CuMQkI9+yCX5+EKjl4IClQpnkl8IYUgKSvlBh3wEHgdqs
Q713XGdkuyA699VcCbuCkE73bqngkP7ixG2hzOy4F5rRzFWBSGmpUMmdDNlOw7D1
jPpvI2OkcNEIa1/8DhQA3wb42AWg4jte4y7Wtp4rQ2PfTmukvsC0n5dV9q7tntzW
94KPwsruhHLCBT+8ZwTTkNz6fdTxjIKFxCOD6C7R41142qc2oge8jzODoHbEH7Zu
Ux4+/ye3hZ2SiXtHMaF1I1pk
=3DgRNx
-----END PGP SIGNATURE-----

