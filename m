Received: from uggla.sjd.se (uggla.sjd.se [178.174.241.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE3214831C
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.174.241.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737661347; cv=none; b=sgiviorjRE+b3nAoHLlNPgR+V4mpB8sDbmJZ9wDbQPgxVR0q/t8M5xlo3qzLK8viWTiOQpa7QOsVPdjZfxLi/up+Tc38e5dm3PAre6n61fQh2HPe2cyiE+asiE6o+UQnxfjsuIzSGgHWavKK9QPggXi5weavtJNEtFvEsJO8yIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737661347; c=relaxed/simple;
	bh=C+uhPwKEagSR6MegukqOcgvFvLdmYGwN80LPAKFJNsg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rAzbTlUVsiKylbVT5FLPvdbVwDvaEqRcSnNfrHW2bppGD8mDiE5BjgpkBnG/Fx6+GvFNIhqTon85YHDR9nNI2xdXBMb7uA+5HvJHe2lHUyJLtt7WE5MzSL19Es5Tlt1FQiOE2p8iRvHngiJNj/nCDEF8BmE45TWLGLe54yzXB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=josefsson.org; spf=pass smtp.mailfrom=josefsson.org; dkim=permerror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b=iRRGwtRK; dkim=temperror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b=iw7ExUZp; arc=none smtp.client-ip=178.174.241.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=josefsson.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=josefsson.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b="iRRGwtRK";
	dkim=temperror (0-bit key) header.d=josefsson.org header.i=@josefsson.org header.b="iw7ExUZp"
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=josefsson.org; s=ed2303; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tbyTo8z+Btl7A1AibHJJwDS1ULqXp+eZWEShFYnghiQ=; t=1737661325; x=1738870925; 
	b=iRRGwtRKxeNQOkquWcaLkhhtZ3P4Hccz6jDKg8NiXioYjaQzk+1S2iPBmpK45sQ1uzEKU+k5hoo
	u5h/sDKBbCQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=josefsson.org; s=rsa2303; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tbyTo8z+Btl7A1AibHJJwDS1ULqXp+eZWEShFYnghiQ=; t=1737661325; x=1738870925; 
	b=iw7ExUZp26eIDvnGlGH2wA68cW7/nrNJQ7tUEyNuT3j9IA3mqQf5nxCipxNKHgoeMyjjgd7WFYv
	BNCHpOR9Y6t2RQKv8P8PTWapvKGysc1xMjnbYpESTDBFmEzfCl1/AjIyuUDsLN0slSGUejAdcG1rK
	73h0WzDYB93VlYavYZ3Plo+sHfZrO1hIlCH2Jo83hUG9xYndZnEWMAvgoVf2iIMt2iGSMFwhaR+Lt
	NQxq+ad7/rKX/PIbiUEL6PJZll7bLpW04K9ABRlOfOp168BNCO6yJRR5/o5W/aolhbL82ARHHPbL4
	Qr2055S+TgfBUGf63JUtVKmvl6uWo9haEym4J5sT5YyyymoW5U5MkD5maZ+eBdOHBtPpg2SA68G3C
	ri7s2kZLF2J/jLvuxQidN6RpqWNxu7SzksjEwErCngcS7gqADJNNuBFbOFQOLNk4t7C5BS0S0;
Received: from h-178-174-130-130.a498.priv.bahnhof.se ([178.174.130.130]:54734 helo=kaka)
	by uggla.sjd.se with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <simon@josefsson.org>)
	id 1tb35W-006AGu-G7;
	Thu, 23 Jan 2025 19:42:02 +0000
From: Simon Josefsson <simon@josefsson.org>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: mgorny@gentoo.org,  distributions@lists.linux.dev
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment variables
In-Reply-To: <20250123151916.476793-2-uwu@coelacanthus.name> (Celeste Liu's
	message of "Thu, 23 Jan 2025 23:19:17 +0800")
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
	<20250123151916.476793-2-uwu@coelacanthus.name>
OpenPGP: id=B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE;
 url=https://josefsson.org/key-20190320.txt
X-Hashcash: 1:23:250123:distributions@lists.linux.dev::j3iztYghkuSKou+S:oiGp
X-Hashcash: 1:23:250123:mgorny@gentoo.org::7KPsz50eWumT4z2n:0il/9
X-Hashcash: 1:23:250123:uwu@coelacanthus.name::9mJtklI1lawuHYoL:y6m4
Date: Thu, 23 Jan 2025 20:42:25 +0100
Message-ID: <87y0z1mi5a.fsf@josefsson.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Celeste Liu <uwu@coelacanthus.name> writes:

>> 1) NO_NETWORK -- if it's set to a non-empty value, it requests that
>> programs don't access the (TCP/IP) network.
>=20
> It may be better to be named NO_INTERNET. Network is a confusing word in =
Linux=20
> world. They can refer to something from only Internet to any protocols in=
=20
> network subsystem, even include AF_NETLINK... I have been asked why my ud=
ev is=20
> broken when my program is in a netns many times. Systemd also have to inf=
orm=20
> this point in their document of PrivateNetwork. So use more limited word=
=20
> Internet to avoid this.

You are right.  While my initial reaction to NO_NETWORK was positive, I
have realized that there are subtle issues that is really hard to
resolve.  I considered adding support for NO_NETWORK to GNU InetUtils
but I am beginning to feel that even NO_NETWORK has the same critical
concerns that USE_SYSTEM_DEPS has: What exactly should NO_NETWORK mean
to a package?  What can it assume and what MUST it fail on?

=2D Can it use localhost IP connectivity?

=2D TCP?

=2D Multicast?

=2D Can it rely on non-DNS /etc/hosts name resolution working?

=2D Can it rely on /etc/services being able to lookup network service
  names?

=2D Is it allowed to inspect routing table on the system?

etc

Disabling all of those functionality when NO_NETWORK is probably not
what was intended, right?

When doing self-checks for 'ftp' and 'ftpd' it makes sense to start your
newly built ftpd and test interop it against your newly built ftp
binary.  I don't think the intention is to forbid this.

/Simon

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQNoBAEWCAMQFiEEo8ychwudMQq61M8vUXIrCP5HRaIFAmeSm6EUHHNpbW9uQGpv
c2Vmc3Nvbi5vcmfCHCYAmDMEXJLOtBYJKwYBBAHaRw8BAQdACIcrZIvhrxDBkK9f
V+QlTmXxo2naObDuGtw58YaxlOu0JVNpbW9uIEpvc2Vmc3NvbiA8c2ltb25Aam9z
ZWZzc29uLm9yZz6IlgQTFggAPgIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgBYh
BLHSvRN1vst4TPT4xNc89jjFPAa+BQJl/YgIBQkLehFUAAoJENc89jjFPAa+CboA
+wUa06RD5e5VTCxvSWtPS75Wq2qBeYGZnf0jvUMxa2n4AP4xkUeAPPnNuMsTm2fs
FCDIGaEM2Yn6Vb2huzzT1Fw/BLgzBFySz4EWCSsGAQQB2kcPAQEHQOxTCIOaeXAx
I2hIX4HK9bQTpNVei708oNr1Klm8qCGKiPUEGBYIACYCGwIWIQSx0r0Tdb7LeEz0
+MTXPPY4xTwGvgUCZf2IKwUJC3oQqgCBdiAEGRYIAB0WIQSjzJyHC50xCrrUzy9R
cisI/kdFogUCXJLPgQAKCRBRcisI/kdFoqdMAQCgH45aseZgIrwKOvUOA9QfsmeE
8GZHYNuFHmM9FEQS6AD6A4x5aYvoY6lo98pgtw2HPDhmcCXFItjXCrV4A0GmJA4J
ENc89jjFPAa+GcYA/26YQY05bLtnXiIjTiAzrGQrRXxTHPA8Av7TDFHvIetWAP9s
HSoU8OfTwmTiEnGwLlsV7QJclZg3YNz/Ypcp9TqQBrg4BFySz2oSCisGAQQBl1UB
BQEBB0AxlRumDW6nZY7A+VCfek9VpEx6PJmdJyYPt3lNHMd6HAMBCAeIfgQYFggA
JgIbDBYhBLHSvRN1vst4TPT4xNc89jjFPAa+BQJl/YgwBQkLehDGAAoJENc89jjF
PAa+phoA/jrDqIrl/55vUMBhIQv+TP635d2iCTEnyFmbUcP9+gh6APoDsXalVd2c
OGxQtSC+TF8PkZMn1TLkJKAjVxr+xx40AgAKCRBRcisI/kdForTrAP93Z/L+Zfi/
CZVezQYY42lcFt8B76Z3aAJJWba4xoEsigD/ec9ltxS0FyjmfpYnp5833/Loy88J
dr6gKEojtuezkQY=
=b+Fo
-----END PGP SIGNATURE-----
--=-=-=--
