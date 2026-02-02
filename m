Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737235B65F
	for <distributions@lists.linux.dev>; Mon,  2 Feb 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032620; cv=none; b=XAIJpX8XDE7+lnpQQAGIYRhzNpkDq4if4ls4EllcEjBurHtN7IwopKBdpJGcJDToou+MjyCiRJTYL662BgQpO7IKUhJ5IzvXPJNurJ2OU7tDu0pulKQUJ7+EDjmoMw7CIcg+78NtE9x1u+THFadNattggRi4ZnapcJ2B11ZCAHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032620; c=relaxed/simple;
	bh=2xXl4OXZl3H39Lwwxd001jE6X49uLukB/6Ge5f8as8I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSHSjfkLpngAbCyhztGTslivQDNkRC5BH5NoUmnhm3L1R897F/qpAQlWhOU5ODNNsV7AbXEU/NAGvaR+5T5a1iR6KwY3QHKx9xMGIJ79kYBYylNnCBfOBFGZm60Bx7L58fgiP6LstW3h/MzcQnxYQ2aTmFRq7BHFskco6vo1zlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from noumea.localnet (unknown [IPv6:2a02:a03f:697a:cb00:7bcd:44af:1751:8c7e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dilfridge)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 054B0341EC0;
	Mon, 02 Feb 2026 11:43:37 +0000 (UTC)
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: "Bernhard M. Wiedemann" <bernhardout@lsmod.de>,
 distributions@lists.linux.dev,
 =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Subject: Re: year 2038 is only 12 years away
Date: Mon, 02 Feb 2026 12:43:19 +0100
Message-ID: <2503217.NG923GbCHz@noumea>
Organization: Gentoo Linux
In-Reply-To: <957948e7cc92d61e41c883e1eca3def8ffc2cf19.camel@gentoo.org>
References:
 <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
 <957948e7cc92d61e41c883e1eca3def8ffc2cf19.camel@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart885057723.0ifERbkFSE";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart885057723.0ifERbkFSE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Re: year 2038 is only 12 years away
Date: Mon, 02 Feb 2026 12:43:19 +0100
Message-ID: <2503217.NG923GbCHz@noumea>
Organization: Gentoo Linux
MIME-Version: 1.0

Am Sonntag, 18. Januar 2026, 04:18:20 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Micha=C5=82 G=C3=B3rny:
> > I opened a discussion with the gcc devs at
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D118326 about adding=20
> > warnings for int=3D>time_t conversions. It did not yet get very far, bu=
t=20
> > at least a collegue at SUSE made a PoC patch and identified some corner=
=20
> > cases.
> >=20
>=20
> Thanks for working on this.  Personally, I think the biggest problem is
> that a lot of people don't test their software on 32-bit platforms at
> all.  And the primary cause of that problem is that a large number of
> popular CI platforms don't provide 32-bit environments at all (and
> people obviously don't go out of their way to, say, run a 32-bit
> container on top of the 64-bit CI environment).

^ This, very much.=20

During the glibc release process I had a hard time finding true 32bit
installations for testing.

(For general glibc testing it might even be more tricky because testing=20
on a 32bit *kernel* would be much preferred. That should *not* be needed
for the time issue though.)

=2D-=20
PD Dr. Andreas K. H=C3=BCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart885057723.0ifERbkFSE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmmAjdcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENwrFiFe1UEqgTwQAJaY71preU5kWOqdk83J
opphZ7hFNyO566pvpeYiO+0oIVgoil34lFjQe1njiOFUHznLYA0RPUhLPeJ9j9WY
joJr/GOYf9wrEsFPCdEWQy4biKaZQYKOZTk5lo1mxwE8zolNbkMEZFBWCE+aTyp9
FxbVprq1sidG2NCjnlEsvO0xEjoxVjDtHeLcYp7u9u2TjNauFP7eDuY+wie1wQ2P
HeheiH+K2/gdwJPebc96qJ0JQv1umlsnr30SFV0OtdRoxwM6pG4MoAAK71y3Tj4J
oYKcbNHFNGlLXBEP+Z9ud8eAKrugICp6ACDmmVPq1PcxhZQcky7jKa6v5dv5CU5i
jqrBTBazeleI2r7GNodkRyJCBhAj7qYOsYJ4rT0+pbotYENi1kcNmXLBgeoZ5G1O
E0Wug9U3MxWnmKWN5Q9PLdflRgzl6CfK8rVSrAqEs5GOs+UQD+ae2lyXuhBE5blm
9pro7R7Tb+vrGWguflLaSsfiu2GelDoRhS4MDozbQG+KN2W8o98rcQMlg8+6XSL5
RlY19gfydp9vVZhXjuZAktewrmiXcLKMvURVoiXxsV/zJNOV2kmHiGwIdaSWycaJ
ZJ/ieh0TiDIsvEe+Pvyt3JpV9ME38UorI0UO81m/92m35r03//pVH5MZwaucDkWG
bejty+jjANDLjStAR1tni8Hq
=eTlD
-----END PGP SIGNATURE-----

--nextPart885057723.0ifERbkFSE--



