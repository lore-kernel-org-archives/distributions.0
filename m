Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC81A0707
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725555829; cv=none; b=J6TAlpeVZx9Nx2+wmFv6DZA0QiXgXMhqPI8Tm4ezIdWS6ZgjNIPdQFkszBj/XhEY59qKTas2+6ykZR261g5fw9mm5ru1OTrCRyXUEBYFnuDYTXqNnydj6uYmv5Sc4eQSrmvr62nzI4PEIvWHLmV2DMsKoVtwv4GmhVmfPB+VMUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725555829; c=relaxed/simple;
	bh=xQqqwUaFpOiw1zBailbUgUbtITzj0NsLWZ7pw8JKAQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/hEi1Cv7GcLhq0YVsSN+oOH3xUx0IdEL3/EpeYxpFmcTHxjrbLlnpZW6Ox8AFj8XEXg5pAGKi/GdMaI79uObURy1T5phRA+qMNUv0mXsekwtBYVb6Er6GOnx5wXtCOu38HdnZ0FfFahjVuXcOOsahPYPHf3AJVOThVMuvFlixk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Wookey <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>,
 Paul Eggert <eggert@cs.ucla.edu>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
 config-patches@gnu.org, distributions@lists.linux.dev,
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com,
 dickey@invisible-island.net, toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 19:03:35 +0200
Message-ID: <2015989.tdWV9SEqCh@noumea>
Organization: Gentoo Linux
In-Reply-To: <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
References:
 <4996568.GXAFRqVoOG@noumea> <3848277.MHq7AAxBmi@noumea>
 <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2314430.irdbgypaU6";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2314430.irdbgypaU6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 19:03:35 +0200
Message-ID: <2015989.tdWV9SEqCh@noumea>
Organization: Gentoo Linux
In-Reply-To: <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
MIME-Version: 1.0

> One possible improvement would be to append "t32" if you want 32-bit=20
> time_t, instead of appending "t64" for 64-bit time_t.=20

I hope you aren't earnestly proposing this worst of both worlds idea=20
(let's change CHOST for any system with no ABI change).

> I felt the same way about the 64-bit off_t back in the 1990s. It was=20
> obvious to me even at the time that we would have been significantly=20
> better off making off_t 64-bit, while keeping 32-bit off_t in the ABI=20
> for backward compatibility; this is what NetBSD did with time_t in 2012.=
=20
> Although I realize others felt differently, I never fully understood=20
> their concerns.
>=20
> And here I am, three decades later, still having to make changes[1] to=20
> Autoconf's AC_SYS_LARGEFILE macro to continue to support that=20
> 30-year-old off_t mistake, and now with 64-bit time_t interacting with=20
> 64-off_t in non-orthogonal ways.

Well, at least time64 implies largefile, so that will get sorted as side
effect.


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart2314430.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmbZ5GcACgkQ3CsWIV7V
QSqSaRAAt19Hnk1PviO+t1RYEEzKWVoRqhdH4CBh2zrxARQ68euzaxm7mTo++8FF
wmhgWrIA1/YT+0udgCH9Kbo/jJvG1MDLhZ3kypTcQDHddy+zKANsvF4Ow55o9sg2
Y3GlrIK7bAw4jX93Uqi+NMoUSswyJCMopr/dmABwVCt5GPFwjyKS1GlhJGSxidOS
APXQt/MEWGZR82R685a5xH5BBf1Wo+2qyRBWH9EX/AoVk2dP5JX2jfG4Aclmgxja
BAactksAqaRJC4Yy0W/eNzafjtuzJXHAG0lwZmPQa9X1L3WvK8kMs3pkxIzBF5UR
+GG+cRyVv7Z6T5+qcRhA5oqApGVXeNC9UI7wG8dwKomVUNFWqdP3gr1foHXjmKPr
bMVDqB63nHBoxt1TbJx3JhD0G3lopRK89TdO1sGyR2svYkHb27Pvv2kajZZAv63R
iXqK8J8fXAE2zGpgEOFdxh+woSOS4Rg2ohdl90cyKi7rGGn/m5mCDkroJ2BNop0s
LVYK6mRpgxwH/9wCMKeJbm/Dj5DfpegEGqtRYLY0lWQ99nubGvTN7y2+Jq8G92zw
QXOhs011Uc1glf8uR3WpWSJAF5SfuA1DJFcWxLThE+sY7aSfP9CC5iAIknBa+5u9
BAUvBji8ys+c4sN3MpkDM0rp7hKl3b2PnVQ9wQ7KSwFnCQccYUg=
=4RQy
-----END PGP SIGNATURE-----

--nextPart2314430.irdbgypaU6--



