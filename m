Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38BF1A0705
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725555599; cv=none; b=pSTLIcRWBm6Qr/8NwsJepIqjoPHmxZMIy8uG0xcMs5AC/HFrLreS77JJf69HIXn2e5lrSmFrzPzPBdAPLVYdCcIo3S9KDbYd59Ylr6vVYt3zXY1+/wGDZKF+Rfqbq322FoGVnNKwMMLhwm7hdxnR4zzvxthdOAgyE18Gc03cQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725555599; c=relaxed/simple;
	bh=ugInPoWy31xlRkrV+h1z/G07TQrOlrum6V4uP7db+vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O650ypqfwJJAS3Q6QG24HlMfwhL0YJqygFQ/epovhe7cl2SAX9b2E0JtTwFzNJ/iRk2Xxji+m+4c/MMLvx/D8gWlcIcybJUPT8bpmusESP/HNKsubNR/vDYfNUBIoN+cYLY6glGLLF2EMGe1ZAu5793sYzgdTGzMEv7+2lrp7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Paul Eggert <eggert@cs.ucla.edu>, Wookey <wookey@wookware.org>,
 Khem Raj <raj.khem@gmail.com>, Todd Vierling <todd.vierling@oracle.com>
Cc: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "binutils@sourceware.org" <binutils@sourceware.org>,
 "gcc@gcc.gnu.org" <gcc@gcc.gnu.org>,
 "config-patches@gnu.org" <config-patches@gnu.org>,
 "distributions@lists.linux.dev" <distributions@lists.linux.dev>,
 "devel@lists.fedoraproject.org" <devel@lists.fedoraproject.org>,
 "glaubitz@debian.org" <glaubitz@debian.org>,
 "maskray@google.com" <maskray@google.com>,
 "dickey@invisible-island.net" <dickey@invisible-island.net>,
 "toolchain@gentoo.org" <toolchain@gentoo.org>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 18:59:41 +0200
Message-ID: <5066141.31r3eYUQgx@noumea>
Organization: Gentoo Linux
In-Reply-To:
 <CO1PR10MB467524D51DAB97012807DE11929D2@CO1PR10MB4675.namprd10.prod.outlook.com>
References:
 <4996568.GXAFRqVoOG@noumea>
 <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
 <CO1PR10MB467524D51DAB97012807DE11929D2@CO1PR10MB4675.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4711099.LvFx2qVVIh";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4711099.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 18:59:41 +0200
Message-ID: <5066141.31r3eYUQgx@noumea>
Organization: Gentoo Linux
MIME-Version: 1.0

Hi Todd,=20

> Versioned symbols in glibc should mean that old binaries will still run (=
even if they=20
> misbehave when they look at the system time), just like with most previou=
s ABI changes=20
> to libc over the years.

That is irrelevant here. glibc takes care of its own interface and is not a=
 problem.

The types exported by glibc, as used in *other* libraries' interfaces, are =
the problem.

> Generally the triplet has never changed except to flag that something is =
being=20
> intentionally built for an *older* API/ABI. For instance, autoconf had fo=
r some time=20
> a separate triplet to identify a.out/libc5/glibc1 when ELF/libc6/glibc2 h=
ad become the=20
> new standard, flagging the deprecated rather than current revision.

That's incorrect, else we wouldn't have -gnueabi (on arm) or -gnuabin32 (on=
 mips).

> What matters is whether it's "easy" to pick up a mix of shared objects bu=
ilt for different=20
> ABIs which are representing a data type differently. The thing being aske=
d here is=20
> fundamentally a search for a technical solution to this risk, but changin=
g a triplet=20
> alone doesn't address that risk at all.

Maybe not alone, but it minimizes the risk of accidental confusion, and mak=
es 100%
clear which ABI is present.

>=20
> Some technical options to address the actual question include:
>=20

Most of this is actually irrelevant to the specific question I'm asking, be=
cause...

> 1. Total flag day. No versioned symbols, no compatibility.
>=20
> 2. Partial flag day. Provide only the bare minimum of compatibility libra=
ries, and=20
> intentionally change the versions (sonames) of libc-downstream libraries =
so that new=20
> binaries won't pick the old libraries. Applications that dlopen("libfoo.s=
o") will break,=20
> but... please don't dlopen() an unversioned .so filename kthx because tha=
t already risks=20
> ABI breakage.

=2E.. how this is done exactly during the transition is something each dist=
ribution can
easily organize on their own. Doesn't mean we can't talk about it, but it's=
 right now and
in this context not important.

> 3. Keep new libraries partitioned; no more installing directly into /usr/=
lib{,64}=20
> depending on your distro, rather everything must now go in a new place, a=
nd the dynamic=20
> linker needs to know which paths to use and which to ignore. This would r=
equire new e
> xecutables being tagged in some form at link time.

Yes. I was already joking about 'libt64'. (That was a JOKE, please please p=
lease dont
take it serious.)


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart4711099.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmbZ430ACgkQ3CsWIV7V
QSrheA/5AeU+7T6HThVrIYMnw0pQ1ouDcg12X/46kimnwT3I2HAqEqmPPUE4ZZc+
uFf47n+nzOfqs9O4s46a3thL0Rbg1izbtBCaFo/QUptt2ALvkb6Dr6g/TbZD4Vdy
mIXNaYWUS6H4GBQVoG6lezc2GVlN5WDZU6/T5CdkvBJXW7uyFkO+fo6+BzKCzgIK
Mf9KzbU1zzWOZmmyU602pxOcqZ1BOqxG66xJhHIkZniEiO1A/eWWnDsSdINWkw+m
QxLygpUrnLJvYY03yAEMcd2YprFIRmlPodyEgDkh9aKxdmBZdU74NBu7vRuHlJtb
OLWe0dlGJr93R1j+0zf7FWxY4c4BdfQbI/mCSrtNki6lu77+2rq1KvBaOxF7Uo4J
jegt8PEBdmHFsByBCQgClTXKkemguVnWq4SGvAeWp+doFlWAGv+aTbZBnBVtc8D1
OjQdSjywI9TH4weHa8SZI7v76Baa1CERyIegtLMHwM4ePK4S5jRIaOTU7Ds3I5Ip
ABehjm+/lPCIt09n/6jX7JmmN68wTVfy+nyrPO4nyIHKjvcIoTlBzL8WPV5GcVxd
HvFYfD+6kyIi+10vD+pojs4dDXQP+ji2jUWPxKjHdTJ9ML6HPnVH0nhhE8TUKbic
DriOvpRrnOHDMhuYQgxpV9sufxzyB6tVHXiztbSOxk+txjAIUEM=
=cOi7
-----END PGP SIGNATURE-----

--nextPart4711099.LvFx2qVVIh--



