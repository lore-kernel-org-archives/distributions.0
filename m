Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85559156880
	for <distributions@lists.linux.dev>; Fri,  6 Sep 2024 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638772; cv=none; b=gEchkQBe0DKYe6EGUTBnlcMEz3tmQV2BUpU64fTD03/5EUgrau9DOUCOBiRJBVQxOZQ/5if0e/ljjMgL7lRmOzEguWkIX9QP3ryaGconzu6e02IOthJmrmzeOpVqvVT3ahdoQ9zD3UApmlBrJtE889eKDehhHxrsW605B5Caqho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638772; c=relaxed/simple;
	bh=+bBFpHwNZm0XMt+Ce3daeXNebmzA+eMJZFl2amdk7Ds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XCJV7qvl0ErLznbSg5XhbwDB4wC0gJ6TeMQxTcs2PHtwnU3++xCzwhwhafL1ZrpHoFf1tZydVk63B42ojhuOo1L5M590cimXWnwlSPsTcP+g4KuRHVlTb7Wq0x6goOLyoBxCdluRwt0LAziD0DFpVEnkLcjcvrN5yNRnGyNnpPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@gentoo.org>
To: Paul Eggert <eggert@cs.ucla.edu>
Cc: "Andreas K. Huettel" <dilfridge@gentoo.org>,  Wookey
 <wookey@wookware.org>,  Khem Raj <raj.khem@gmail.com>,
  libc-alpha@sourceware.org,  binutils@sourceware.org,  gcc@gcc.gnu.org,
  config-patches@gnu.org,  distributions@lists.linux.dev,
  devel@lists.fedoraproject.org,  glaubitz@debian.org,  maskray@google.com,
  dickey@invisible-island.net,  toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
In-Reply-To: <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu> (Paul Eggert's
	message of "Thu, 5 Sep 2024 08:39:28 -0700")
Organization: Gentoo
References: <4996568.GXAFRqVoOG@noumea>
	<20240905020617.GZ23787@mail.wookware.org>
	<CAMKF1spAZzNH3jYOnwo720nM4zQ_5JCv=ZGq4SC=TWC+WXWVPQ@mail.gmail.com>
	<3848277.MHq7AAxBmi@noumea>
	<6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
Date: Fri, 06 Sep 2024 18:06:04 +0200
Message-ID: <8634mckbrn.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Paul Eggert <eggert@cs.ucla.edu> writes:

> One possible improvement would be to append "t32" if you want 32-bit time=
_t,
> instead of appending "t64" for 64-bit time_t. That way, people wouldn't be
> stuck with appending that confusing "t64" for the foreseeable future, and=
 only
> specialists concerned with 32-bit time_t would need to know about the iss=
ue.

But that'd change semantics in non-obvious ways.  The intention behind
this suggestion is to have a mechanism to communicate to packages and
the toolchain alike that "yes, this system is Y2038-proof".  There is
currently no mechanism to do that.  There isn't even a mechanism to
guess based on your dependencies whether you should also enable LFS and
T64 (and there can't be a general one - you'd need to detect what
libraries are doing what if they have time_t or other system integers on
ABI boundaries, which is not generally possible).  Not that the latter
would suffice - even if we changed all packages we can to use such a
mechanism, there would be plenty of packages that don't (think of all
the hand-rolled makefiles..).

An alternative that I pondered was to teach the linker about some notion
of "compatibility strings" that it would compare and reject if
different, plus teaching the compiler how to emit those, plus teaching
glibc to tell the compiler to emit those..  We could have key-value
pairs in some section.  For each key K, we could have the linker check
that, for each (shared or otherwise) object either does not contain K or
contains K with the same value as all the other ones, and produce an
error otherwise.  On the resulting object, the KV pairs would be the
union of all KV pairs of all constituent objects.

... but this is for i?86, a CPU family I haven't used in ~15 years (and
I suspect many also have not..), and there are other things eating my
time.  And it'd still require a world rebuild.

> Personally, I hope backward-compatibility concerns don't require this sor=
t of
> thing. I'd rather just switch, as Debian has.

The "status quo" of some packages enabling it of their own volition, and
some not, leads to various subtle breakages (example:
https://bugs.gentoo.org/828001).  I think switching like that would not
be much different.

I do not know what approach Debian took, but if it is one of altering
the toolchain, then this is a sure way to introduce subtle divergences
between distros (this is why I've suggested we CC the GCC and binutils
MLs); if it is one of teaching debhelper (is that the right tool?  not
sure) about it, then this will break user-compiled packages (so,
./configure && make && make install, or moral equivalent).  If it is to
alter libc, then, can we do libc.so.7?  ;)

The only actually solid approach I see today is to /somehow/ communicate
to the system to not use 32-bit time, ever (and consequently, to enable
LFS).  I think that the "least effort" path to do that is through the
tuple.

There's precedent for this also, AFAIK, in the 32-bit ARM world
(gnueabi/gnueabihf, whatever that means).

config.guess would need to be altered a little bit.  My preference is
for [[ $os =3D *-*-gnu*t64* ]] informing glibc to completely ignore
_FILE_OFFSET_BITS, _LARGEFILE_SOURCE, _LARGEFILE64_SOURCE, and
_TIME_BITS and just presume 64 for all of those system integers.  This
means that config.guess could undef those (in case a toolchain sets
those) and include some libc file, then check for sizeof (time_t), or
just have glibc define something if on a gnut64 target.

> I felt the same way about the 64-bit off_t back in the 1990s. It was obvi=
ous to
> me even at the time that we would have been significantly better off maki=
ng
> off_t 64-bit, while keeping 32-bit off_t in the ABI for backward compatib=
ility;
> this is what NetBSD did with time_t in 2012. Although I realize others fe=
lt
> differently, I never fully understood their concerns.

That is history now I fear; I also wish that time_t was made
64-bit a long ago ;)

> And here I am, three decades later, still having to make changes[1] to
> Autoconf's AC_SYS_LARGEFILE macro to continue to support that 30-year-old=
 off_t3
> mistake, and now with 64-bit time_t interacting with 64-off_t in non-orth=
ogonal
> ways.

Indeed, and the "best" part is that, whatever you do in autoconf, unless
a program exists in isolation only interfacing with libc, it will break
some consumer (or will be broken by some dependency) because there's no
mechanism to signal the time_t size across ABI boundaries.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOcEARYKAI8WIQT+4rPRE/wAoxYtYGFSwpQwHqLEkwUCZtsobF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0RkVF
MkIzRDExM0ZDMDBBMzE2MkQ2MDYxNTJDMjk0MzAxRUEyQzQ5MxEcYXJzZW5AZ2Vu
dG9vLm9yZwAKCRBSwpQwHqLEk99AAQDwfulphggJgOoD6iD2ciJhCsz+htms0RlM
Woo7itip2AD+IKE0tc6t+xsBS5lH4v6nwUiI2dIMp+wxvhlQjFkzDQo=
=f6iR
-----END PGP SIGNATURE-----
--=-=-=--
