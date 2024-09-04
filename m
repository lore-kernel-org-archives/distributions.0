Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6BF3CF65
	for <distributions@lists.linux.dev>; Wed,  4 Sep 2024 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464899; cv=none; b=gWOrF3MCHqyw1aG3+q0oQNESczcBMYKiTktJgqmJEGAGbqMiI3kNwQZ/vzPmz/Mn6+YxhEiBYCLR3NiDE7DS4MlAhG4wQse8lNX5FdN3A8+HPq/INGfKk/qmyRUOvPBKLlh+hlhCtsK8HAY4mRgwDucAodSdFP/WbqzNN8ujvRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464899; c=relaxed/simple;
	bh=ohqYp48VNk2KScfNYVXExlvMLFsJkn5rCWLuXff67KE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h4F4AXpPn8xDSziSRj8+Uti5aAc213X6Fto/8XuZx2irZ4XtPxmhB3F2hqiTyryJIrGOXJihZ1woa6yeh9IUPb2jnZpxWb67yhPnROMGxisFa+lfxXiLE7KaavxGyl1RCZpa1lBlufgwXvLb6Z6ZgDu+a2IB/yQKrPGcSscb50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
 config-patches@gnu.org, distributions@lists.linux.dev,
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com,
 dickey@invisible-island.net, toolchain@gentoo.org
Subject: Proposed CHOST change for the 64bit time_t transition
Date: Wed, 04 Sep 2024 17:48:04 +0200
Message-ID: <4996568.GXAFRqVoOG@noumea>
Organization: Gentoo Linux
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1974747.tdWV9SEqCh";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1974747.tdWV9SEqCh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Proposed CHOST change for the 64bit time_t transition
Date: Wed, 04 Sep 2024 17:48:04 +0200
Message-ID: <4996568.GXAFRqVoOG@noumea>
Organization: Gentoo Linux
MIME-Version: 1.0

Dear all,=20

in Gentoo Linux we want to change our CHOST triplets for 32-bit glibc syste=
ms that use 64-bit time_t, since
this is technically an ABI change which breaks binary compatibility [1].

We are thinking of adding a "t64" suffix to the ABI field, resulting in for=
 example i686-pc-linux-gnut64,
armv7a-unknown-linux-gnueabihft64, ... [2]

* So far my research indicates that in the GNU toolchain (gcc, glibc, binut=
ils) anything behind -gnu is=20
  ignored (as ABI version, which this effectively is too). Is this correct =
or do you foresee problems here?
  I've had a small chroot rebuild itself (the Gentoo @system set) with i686=
=2Dpc-linux-gnut64 and only had to
  add a minor patch to ncurses [3]; everything else worked fine.

* clang at the moment expects one of a list of known suffixes (e.g. *-gnu, =
*-gnueabi, *-gnueabihf).=20
  Could this be fixed to be similarly permissive?

* I could imagine glibc defaulting to the 64bit interface or hard-enabling =
it if t64 is present=20
  in the ABI field. That would certainly help to enforce binary consistency.
  We would need then either an automated mechanism based on CHOST or a glib=
c configure option to
  hard-enable 64bit time_t support [4].
  Not hard-required by Gentoo, we can just force the defines into everythin=
g, but would-be-neat.

* In an ideal world this change would be synchronized across distributions.=
 Opinions? [5]

Deliberately pushing this e-mail out now so maybe it can be discussed at th=
e cauldron. I won't be there,=20
but Sam James and Arsen Arsenovic will be.
If this proposal fails, the alternative for us is to add a _t64 suffix to t=
he vendor field, resulting in
e.g. i686-pc_t64-linux-gnu. The vendor field is pretty much ignored everywh=
ere, so going alone is safe.
Still, that's then a purely Gentoo ugly hack...

Cheers, Andreas


[1] The ABI of glibc does technically NOT change, however, the type definit=
ion of, e.g., time_t does.
    And as soon as any other library includes that in its public interfaces=
 and data structures, that library
    changes its ABI.
    An example for an affected library (found real-world during testing) is=
 gnutls, see=20
    https://bugs.gentoo.org/828001

[2] We've brought up this issue previously, just somehow it never caught mo=
mentum. See, e.g.,
    * https://sourceware.org/pipermail/libc-alpha/2022-November/143386.html
    * https://sourceware.org/pipermail/libc-alpha/2023-January/144963.html
    A more detailed discussion of different possible approaches in Gentoo c=
an be found on a wiki page=20
    maintained by Sam,
    https://wiki.gentoo.org/wiki/Project:Toolchain/time64_migration
    Discussions within Gentoo have led to the conclusion that a new CHOST m=
akes most sense, with
    the old one staying at 32bit time_t for legacy binary support as deprec=
ated option.

[3] https://bpa.st/HV6BS

[4] https://sourceware.org/pipermail/libc-alpha/2022-November/143386.html

[5] Note that this entire issue / proposal only affects 32bit architectures=
 and distributions.=20
    For Gentoo this would be ix86, arm(32), hppa, mips(32), m68k, ppc(32).
    riscv32 is special since from beginning it only has the 64bit time_t in=
terface.

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart1974747.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmbYgTQACgkQ3CsWIV7V
QSrJFBAAgGR0hF63Zmg7T6InkY719dI/mn8mroykQDXl/pFc+5zNaZfyiunzAo+7
Tsgr9tu3XOTytbORIQAc+4J/BWHkvGH4/pIkegjmIkdJcmSlqbort3KKxucKP0Bk
V0L4vBfySEtCO4ew5Cp3jFuEdvMVpTAWxlS4Q4+qXWe3M0Yq2ogjd28ci69NakxE
GHnx3P7KWNhK4yXAxx7V+fxVOoCJL12EWyVn+12IjhE7QsifZNpT5kTWOPfXjxqH
zZgx7OUgwlXRTyH2wpVjB2nIzoFHUkn9MTcfQMXacF5e1WxQUEsZ6zHqggtC0AhR
ABXU2kCVDNS5WapQPecBGEveNS6NyyV8EmUh7ZxtPGiZG2zCi00NHPG1e6umcv71
miabzmW/3UwOGJxvMOs1EuUyoZwfaAaGeRwERf5P8yULe4QlgpQuImsW0/Z75Nfj
ENU/Ue0EuFe/NV5qDVDLS5H++OaBQyEMl5tzY7kw1qJIPzdQ43rouCO0IqziaJAw
qVWMXUgF/1JKeLt/xSHfdiBgQr0hJLMps4EVLHBQhEXFGdpf4G/zJCLLkGtWbYAW
E8U02OI+2Jtg3KEuMllFQZ1DL38otJ+6shwwSojSm4afrAQUIxJvYYzeFPnljg0B
9M3/B/5uCWL3tgl7GqK/o2NAMO6wSt/z7VMN38w6fvUEWt5wjvw=
=ceDP
-----END PGP SIGNATURE-----

--nextPart1974747.tdWV9SEqCh--



