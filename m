Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA5621CC58
	for <distributions@lists.linux.dev>; Sun, 22 Mar 2026 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774223636; cv=none; b=oLlOYhrLFsv4VVO8WekmXp+kyfMsX5xTMYmeBa4ZWLIZF9urnNuM1bcSDDYeXTDL1FDV2MGtJ19jk8usifpWAwP3Sh59SigRPsavimX+WbQqrA9hICKZ7F1i2zQFRZ8zDbasqHDips5TChNgAq8Ip98JX1NSjfOMZKNQy2ftt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774223636; c=relaxed/simple;
	bh=Km27sfNBweAG25bxzNZ5QoTWxYknU61ObpfFSc4DHw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pS3x8fSHZqCSIMzQ0uzN92xZNbvZcp667HnWjHTboEyCs/jzIQxrNjcRtjAsua/X0aueuePpLqG2axg1L3aIEWfWriZ+u5A+i3DLIOTlZBlwjZ8OUCpgzUo5Duxzeu5nL9CVdjMiRNCSe3Ge71ZQFw4Zz0avcxeAweoND2OB0Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from noumea.localnet (unknown [IPv6:2001:16e0:27d:501:8586:869d:132f:b39b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dilfridge)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CC21B34203F;
	Sun, 22 Mar 2026 23:53:52 +0000 (UTC)
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Morten Linderud <foxboron@archlinux.org>,
 Simon Josefsson <simon@josefsson.org>
Cc: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
 distributions@lists.linux.dev
Subject: Re: Looking for advice on how to deal with potential slop packages
Date: Mon, 23 Mar 2026 00:53:45 +0100
Message-ID: <2081671.zToM8qfIzz@noumea>
Organization: Gentoo Linux
In-Reply-To: <878qc38xmh.fsf@josefsson.org>
References:
 <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
 <aawYbre5_xvhfwKA@framework> <878qc38xmh.fsf@josefsson.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3607836.cLl3JjQhRp";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3607836.cLl3JjQhRp
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Date: Mon, 23 Mar 2026 00:53:45 +0100
Message-ID: <2081671.zToM8qfIzz@noumea>
Organization: Gentoo Linux
In-Reply-To: <878qc38xmh.fsf@josefsson.org>
MIME-Version: 1.0

Am Samstag, 7. M=C3=A4rz 2026, 16:31:18 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Simon Josefsson:
> Morten Linderud <foxboron@archlinux.org> writes:
>=20
> > A lot of this is probably already a lost cause I think.
>=20
> +1

Here's another example of a (cryptography-related) package gone full auto.

https://github.com/cpan-authors/Crypt-OpenSSL-RSA/commits/main/?after=3D5d7=
e2e6faf3d6938b55aeebd40f5fb2379248c36+34

Lost cause or not, shouldnt we even try to fight this tendency?

I mean, it's one thing to vibe-code a sandboxed browser game where graphics=
 glitches are
the worst possible outcome... but...

=2D-=20
PD Dr. Andreas K. H=C3=BCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart3607836.cLl3JjQhRp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmnAgQkbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENwrFiFe1UEqtPIP/34aJLIfaubgIR3tUZ2m
qXL1zHTaQqCIQ+ACvRsKl/dg2tLyqAsc8N/1UeI8521f91qCJQpfVGWenVakLFpY
gm3aSQNxMGkhNmC0JhOBeGc86tjcLX79tuxLS8mYx8oTTjfN/un41EYHRKzgF1wb
BH5EcAZvPembrvTosUKUiQ2mEfRgFkyK5bec/NMMhaqKx2JwbQUUkLegI6dogOgX
aHfI6IgqaUg7uiVmCwY2EbTaoHlmGkVLxN6WtThUkvlJcQlubN7OFRYePwYWShLM
2bTjcl2vsHfkmb17XfNFi4Nli5anAYi/j5dD3ibLLbM+Rdxta90Fj/IVt7RoVrLY
kybUUVX2DPkigt84zdKLhFJ79sXrj6ODyWi+ETYggahwP3xsIav3yuUe4b0k9hy9
XGFv27lMiqsnlUGYUsgZHmgH0zZUZoXWtP8gtZSIhPjyZbtviqfIu6O96O27vvKi
fUs7oZoWUgBx53RwxObU7Uffuso1elzllWLsHoYvoF1/R7gFDDx7raslppIgUjhA
UqIJkqeJzw5zYTifdxA6BIYVXhKgWUKblVVSDlBPbbmTNdioVU0pX6Pc0tn30gK3
aZV4irn9cPo9QxA3J705x8QSWbM+wST42sAX7uyKtoxQMxv/AZYcaOhAdxF/ujSq
m1Z0fAqTPjKyQWMJlE74IKJG
=97Ar
-----END PGP SIGNATURE-----

--nextPart3607836.cLl3JjQhRp--



