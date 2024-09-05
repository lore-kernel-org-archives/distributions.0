Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA951EA85
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725544297; cv=none; b=LfXn5FNcPwvrGlnwuSUg6zLlf6oBZQnRc/m1ObVvUlVIIUx/rUwtB6tHABW7siMVcrQfa26ykOnpIvXWgyGQ9LpqFrDvZyoxR0kMvYaVbr3QmlimjXe4kivhtejxAPwX0F/9DHylvN4twzQm0fA+HaeNd2ZDb7Ufv9D4qtUiVq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725544297; c=relaxed/simple;
	bh=AIyhIj81PLAVv2DxHugGNPy/euu34ij/iU1Wnq8AgH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sw31+2/1ZYLEpaFrUUO7BJPDW7aNihbAeLXENm6nSGLQEE/Pss2XZwEXRXJXh/7Ei0MjlbpZ0PMmGU+Am8wg+0YMq8F9Uud2TkXUL6OqmJEb0NUgcJHpdLCIWuCFkQ3Qniww6epm0x7vikgli9SzdDwcVQkzaJm5llIOWD29Sq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Wookey <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
 config-patches@gnu.org, distributions@lists.linux.dev,
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com,
 dickey@invisible-island.net, toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 15:50:56 +0200
Message-ID: <3848277.MHq7AAxBmi@noumea>
Organization: Gentoo Linux
In-Reply-To:
 <CAMKF1spAZzNH3jYOnwo720nM4zQ_5JCv=ZGq4SC=TWC+WXWVPQ@mail.gmail.com>
References:
 <4996568.GXAFRqVoOG@noumea> <20240905020617.GZ23787@mail.wookware.org>
 <CAMKF1spAZzNH3jYOnwo720nM4zQ_5JCv=ZGq4SC=TWC+WXWVPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2021708.taCxCBeP46";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2021708.taCxCBeP46
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Wookey <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 15:50:56 +0200
Message-ID: <3848277.MHq7AAxBmi@noumea>
Organization: Gentoo Linux
MIME-Version: 1.0

>=20
> FWIW, yocto/openembedded have also done the same and offered a distro
> setting to the users
> to select 32bit time_t if they wished to but defaulted to 64bit time_t.

In case of Openembedded, which (as far as I understand) mostly offers
complete system images for download or build, I might have done that
similarly at the start - this is a different situation.

That said, nothing would keep you from trivially still switching the CHOST
in case of enabled 64bit time_t, to be able to keep the two variants apart.

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart2021708.taCxCBeP46
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmbZt0AACgkQ3CsWIV7V
QSrnig//eQXBWVsVZSQfYwvK1ujbqMMRAQhYL8wFKAxoc7cSpCFz00oAZw3xWOtT
DjtBB/8As1L7fXW3wGwTmXrNamm+YAZBAz9ktw/xpDgpp95UaZop1ly3ZeXTbyzY
aqBmiaLkxlduEofBPgo1bcUNsOus2cXBj2SGaMRdfyuGLToP6upgHHNTib0gz+Iq
R9KCvbupQX513BUlqSoVg0Q6VdAc7qNjWYFx8asgM5+DVrIeowpIU9exCxEwz6o7
YCLz0E53gJqPEQPz6Lc9kv+Yg5gJG06SseUY6HH57wV9xBYPjnRYOsqQVdQzNPj5
UFmAuLg2Jo71FX3BpPHHsnI3DfIGNEtEDTTkx0ghaOAieeDEAjwyQZoIGYaeDdef
CCyE+NSQSznHttJ3lVhsh/IzztN2aAPQv5xL6yQXjCqu+kyMO2hf+MoFr8kj6A/2
6TQCBGIOQXbPmIO1zZoNKlqLPXUe6ruOdtmp/rhTG+gN6V317thU/9ZvQiBfSoNB
xp1EN7NeWLf4LkBPyYFdpvGPa8xK1DuDGy/8vNTo3HFCUmeYAkFh2rxWRWxF0/BM
TollBzHr9zmMwK3GbjwQXOYfNgagGCgG2BRxBSVRXZ3MM/JgjZkhB+z/t8vhjmh0
jUZ5VhvCjMStHz/QMNt/HSgTHGZsX3hBDo5HK0SmD0pKlQvMuTY=
=XZ5O
-----END PGP SIGNATURE-----

--nextPart2021708.taCxCBeP46--



