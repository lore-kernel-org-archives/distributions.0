Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA02213212A
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737642390; cv=none; b=d7Ffk0xAglriJ5TzSzLQ7yRtobeXNvTe3AtFOtYwsgzovDuS3M5zXCdGQqhnMaT6LeOkWnyq52dRquPSqM71dcLaqxDUd7llUm5vMdP/lA2rNWvGdt5XGJMUXOFw0O8XXrgbCuiZu/rIuCSApcdSIb9rRLwqqj1MtTaEc2lERqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737642390; c=relaxed/simple;
	bh=kyT36t/9UL+c6dflAC2BWjF6A4w8vPjuTVKmIGDaMGc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HJDkMHZ6pEnkrt+YRozrYZQOMujFi75Tfm2/jj0CF2GvGXRxMaU3xSdlIIKX0n5hn7QKEu+xxItPS3mVV/xQ34set/euETLSvPTQnq3cBPvR0zVcKijVBiGS2DFW+MirokOPncaG0jUdzxhpHAAJmfYX3IvOR38FMKU97/NUQvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.1.1] (c144-147.icpnet.pl [85.221.144.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5693F343366;
	Thu, 23 Jan 2025 14:26:27 +0000 (UTC)
Message-ID: <8c59f9bb5145bd73b30014210397be318270ed5a.camel@gentoo.org>
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment
 variables
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: Bruno Haible <bruno@clisp.org>, distributions@lists.linux.dev
Date: Thu, 23 Jan 2025 15:26:18 +0100
In-Reply-To: <9658083.GK2ZErXSoo@nimes>
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
	 <9658083.GK2ZErXSoo@nimes>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qi08h7Di8OkPeFvjUKy2"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-qi08h7Di8OkPeFvjUKy2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-01-23 at 14:50 +0100, Bruno Haible wrote:
> Micha=C5=82 G=C3=B3rny wrote:
> > 2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests tha=
t
> > the build system does not use any vendored dependency for which it
> > supports using a system version instead, and that it links to shared
> > libraries whenever possible.
>=20
> This contradicts the GNU Coding Standards [1]. For GNU packages,
> configuration of such things should be done through --with-* and --withou=
t-*
> options. NOT through environment variables.
>=20
> Proposing something that contradicts the GNU Coding Standards is a non-st=
arter.
>=20

The problem with explicit options is that 1) they are different for
every build system, 2) they require explicit support checks, and 3) they
assume you have an explicit control over the build command-line.

The first problem means that we simply can't standardize of anything
like that.  Even if we agreed on a single name, you'd have --disable-
network and --without-network for autoconf, -Dnetwork=3Dfalse for Meson,
-DNETWORK=3DOFF for CMake and probably a dozen more.

The second problem is that we can't simply enable it unconditionally
and be done with it.  In Gentoo, we already do the messy thing of
checking --help output to determine if we can pass stuff like --disable-
shared, and that has already backfired.

The third problem goes much deeper.  I largely come from a Python
background.  The most problematic packages I work with generally involve
something like a PEP517 backend calling setup.py calling CMake, which
in turn may involve some subprojects.  Having an explicit option means
that I need to ask everyone to add an explicit option at every layer,
and ensure that the option is passed down.  And that's assuming that we
are dealing with layers that actually can accept options, which is not
always true.  We aren't living in a perfect world.

Just to be clear, I do not mind at all having explicit options to do
this.  I'm just saying that having these options default based
on environment variables would be very helpful, and make things much
easier.  They mean we can just unconditionally set NO_NETWORK=3D1
and USE_SYSTEM_DEPS=3D1, and with some luck, it will just work and make
our lives easier, and in the worst case it won't do any harm.

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-qi08h7Di8OkPeFvjUKy2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmeSUYoSHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQO5D0H/igDKjxUy5GAAgGcHCvopdAodF5yQCCU
hXZlv/7Wiiw5NgDgSVKaFaXgUOgybQWp7UYR1Wl9YxKBYfb1SjakjCijhv3QUO0B
zT6T+Mb0KqvCH7wBAJaHjrY2zE/IQzNEDH20XpUsOxvZBZIB//dqxoKu7RvMlITU
0aogALeJQuekZ2QetGriNLMoAPmUFZuMLztMcO1jA1alRJGuLkHF4uHQ7uHUWeGj
UdIaVOc8QoxJ3wiapO3LMICKexqKhaux0M3xloICwvo51ikG+C/92iq+U1wnN3EG
93kJ8IvOgQ9nwPinqGlraFJ2LF0tMoCKA+0RHZRu3MJAxlDY2vDu0zE=
=7FdW
-----END PGP SIGNATURE-----

--=-qi08h7Di8OkPeFvjUKy2--
