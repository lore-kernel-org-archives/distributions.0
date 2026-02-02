Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2EC34D3AA
	for <distributions@lists.linux.dev>; Mon,  2 Feb 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029531; cv=none; b=d6jHL+lgOVFeL30Ao2qXzUzNCVpK5R/4LKjMG06aad+M1YVzYQZyJtb5UbXPJA8piwNpADrXKo59MsezY7UFGQ5MyJvy8V8s4AR7075//H8vFqcfiVDhgr5+qwUKSAnYaEE6XHdur+r2yimF+PPpSrsVsfTTiG7ts81tzp8oH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029531; c=relaxed/simple;
	bh=eLb1MT+fA8A76VXhEctkJ13ecSc2nU7AfuC49mOAU9s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2ojKxxHTxFrPRjhMmqO3Syy29xYM4Zm2r23TzzEiKiWD8zmGYzPLTcH2nv8uqA5dWR55KrRjaMIP83mLAtRIhU/s2eTG2QVIhWTuVr7dqaKxuqDKm35fAAr8zud6u4j7mXrL+7Gtbj1n3k3+gVMMk/N1EMRANpsOqzO3CCOUag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from noumea.localnet (248.10-240-81.adsl-dyn.isp.belgacom.be [81.240.10.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dilfridge)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E3835341E80;
	Mon, 02 Feb 2026 10:52:07 +0000 (UTC)
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: distributions@lists.linux.dev,
 "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
Subject: Re: year 2038 is only 12 years away
Date: Mon, 02 Feb 2026 11:52:00 +0100
Message-ID: <47880055.fMDQidcC6G@noumea>
Organization: Gentoo Linux
In-Reply-To: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2301994.Icojqenx9y";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2301994.Icojqenx9y
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Re: year 2038 is only 12 years away
Date: Mon, 02 Feb 2026 11:52:00 +0100
Message-ID: <47880055.fMDQidcC6G@noumea>
Organization: Gentoo Linux
In-Reply-To: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
MIME-Version: 1.0


Am Sonntag, 18. Januar 2026, 03:28:13 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Bernhard M. Wiedemann:
> Today is Y2K38 commemoration day T-12
>=20
> I have written before about it multiple times:
> https://www.reddit.com/r/linux/comments/10fqx1t/today_is_y2k38_commemorat=
ion_day/
> https://www.reddit.com/r/linux/comments/19a95cl/today_is_y2k38_commemorat=
ion_day_t14/
> https://www.reddit.com/r/linux/comments/1i4otpo/today_is_y2k38_commemorat=
ion_day_t13/
> https://www.reddit.com/r/linux/comments/xjtf3q/in_the_year_2038/
>=20
> It is worth remembering that in 12 years from now, after=20
> 2038-01-19T03:14:07 UTC, the UNIX Epoch will not fit into a signed=20
> 32-bit integer variable anymore. This will not only affect i586 and=20
> armv7 platforms, but also x86_64 where in many places 32-bit ints are=20
> used to keep track of UNIX time values.
>=20

[...]

> I think, some distributions already started to compile their 32-bit code=
=20
> with `-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64` but that is only part o=
f=20
> the solution.
> Code that handles timestamps regularly gets added or rewritten and every=
=20
> time, developers need to remember to not use `int` there (nor `long` on=20
> 32-bit systems) but `long long` or `int64_t` or just `time_t`. I myself=20
> sent PRs in the past using `atol` for timestamps. We should not do that=20
> anymore. same for `scanf("%l")`.

=46WIW Gentoo is ready for testing 64bit time_t on 32bit architectures; we =
have bootstrapped=20
all (*) our 32bit installation stages also separately with this force-enabl=
ed. The 64bit=20
time_t installations can be recognized by a ...t64 suffix of the CHOST, e.g=
=2E,=20
i486-pc-linux-gnut64.

We will prepare an orderly migration for our users sometime this year.

[*] OK, with exception of 32bit sparc, hppa, and 31bit s390. I didn't bothe=
r with these yet.


=2D-=20
PD Dr. Andreas K. H=C3=BCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart2301994.Icojqenx9y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmmAgdAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENwrFiFe1UEqQkAP/273oiKHR2ZyNmRIPYwW
buFiv7wbCLsRFuUz1FETJfYy0PcFKc4Q3jjLWbqNKpd7jeRX7z0goHWnL18A/Mcx
jDgdR68I3fOqTUieYNxyk+OD9D1Yx+f29h1GX86MgeXcYCzsv7yGj+tQVnmyDUVg
jTe971nMvwtmYkiBGEEbmjZuTK5WOwi98VCX5ePNGL2h4Ru10Es+0vDvFupkAou0
V+gOS5gy2tu7P2m/lwFZ6LvH43MuKYYtuKqs4TWCCqXLr9Z7uvTaUTrpzBP4yVq+
lGqSkSRydVdmF6Q/fcbsobo/sp6qxwVPJ9cQ+XJuVB7Hmm4ATHgTObOGGorDH38b
mHxEZOcKBS1aqDqF4HYI1yO8wUiFGrWonTmiAhPuDUZu7JDPVa2Pk5yxpkdRFu4x
VicpbFHO22pr5Npyeu7aKAsuEbq7f0UeLfV1KZ+sr/9ckx4SQJ0BXuxr0ZPGZ9Ny
YhEnhoZ46S8++50fRwxBT/Njht5VNkwwFa5i+yCj79B9XWbO5OU2HIndV0w6K26q
nIWOpfoCLy/tofIil7fTLWROc95t+pTZNFCdnZd8EUuWPQ/Zkk1JY4VDjoJK7FfS
2hOK13qabYn5GBDQ4mG2xOnSTEZPkCKIZpCX3wqM/WvV3XZaGpJ95573Iys4WsoR
6wjnxqYPMBzzZh1wqtMjZbmL
=oi2F
-----END PGP SIGNATURE-----

--nextPart2301994.Icojqenx9y--



