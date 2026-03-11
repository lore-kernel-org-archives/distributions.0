Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB8B652
	for <distributions@lists.linux.dev>; Wed, 11 Mar 2026 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197492; cv=none; b=lE18L6djEg1Syt9drLTPjvwbywCRJE7+jeO4y64ylrBpbJTyD3WV1L+iRJ3gN1fl5YGKsPS7xGbWvlSXCUf5MvrlXjRBkt/0dL4EPqxtROjZ5L2XmkbMF5niaSCHSREX2vvrzfHx4ZVmHo3blLitPFt11ib+QoLkY8mpHgBjWbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197492; c=relaxed/simple;
	bh=CpDSEoHco/1lXfVwvH0YvsB7u1yi4bzO5MjUc2X8/Gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gN/o5UZggAUg5pik9NHRG1NNkwlVF4Pd0cvtwo75saXV8PUSTYfz4O+/W+ugfm1TpzKFjutTzIwsONrtkkeQcyphHaXDnoE7Ox6XQ9kkOLa4GyJWB82/+DiXsIALxQHnd0tUjr8oHvkMK63hK0wPw0ES+VDP7uIOW8Tv3JSFUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8355D3421F5;
	Wed, 11 Mar 2026 02:51:03 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: =?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Cc: distributions@lists.linux.dev
Subject: Re: Looking for advice on how to deal with potential slop packages
In-Reply-To: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
Organization: Gentoo
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
User-Agent: mu4e 1.12.15; emacs 31.0.50
Date: Wed, 11 Mar 2026 02:50:59 +0000
Message-ID: <87eclrw030.fsf@gentoo.org>
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

Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org> writes:

> Hello, everyone.
>
> Seeing more and more packages embracing LLM-driven development (to the
> point of "vibe coding" or slopware), I'm looking for your ideas on how
> distributions should deal with that.  I'm basically torn between three
> things:
>
> 1. My duty towards the users to deliver up-to-date versions of software.
>
> 2. My duty towards the users to deliver *good* and *secure* software.
>
> 3. My ethical concerns, both directly related to LLM use, and to what
> people are using them for.

For those interested, we've started discussing it on the Gentoo side at
https://public-inbox.gentoo.org/gentoo-dev/fd8fea8a469a11e302dfd66dad76bbfa=
230198cf.camel@gentoo.org/
now too.

> [...]
>
> What are your experiences, thoughts and ideas how to deal with this?  I
> mean, staying on old software versions and hoping people will change
> their minds (or more precisely, LLMs will stop being subsidized and
> people will have to start paying serious money for their usage) is not
> exactly a good idea.  Going around and telling people "please switch
> from dependency X to Y because X is slop (and Y isn't yet)" doesn't
> sound like the best use of our time either.  And forking?  With the
> depressing state of FLOSS these days, I can't even find energy to
> maintain my own projects, let alone take anything else.
>

You know my position on this but saying it here for the benefit of the
list: I think some collaborative effort is needed just like we ask
people to port away from unmaintained dependencies or something that is
otherwise broken. chardet has an alternative AFAIK:
charset-normalizer. And we can lobby upstreams to not depend on new APIs
introduced only in "infected" versions.

Of course, that's still work, and I'm very tired of all of this already
too.

>
> [1] https://wiki.gentoo.org/wiki/Project:Council/AI_policy
> [2] https://github.com/crossbario/autobahn-python/issues/1716
> [3] https://github.com/crossbario/autobahn-python/issues/1735
> [4] https://github.com/crossbario/autobahn-python/issues/1782
> [5] https://github.com/crossbario/autobahn-python/discussions/1818
> [6] https://github.com/chardet/chardet/issues/327

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmmw2JMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkOnr
AQD4L2pP+aovtgy01GFPMeu0e8rLHOw2E4afoxz9UkDEKQD+P1U6Mol3RKrn2tea
cop4SE2Llz4CZHUIjSc6HKlCHwk=
=A6Ms
-----END PGP SIGNATURE-----
--=-=-=--
