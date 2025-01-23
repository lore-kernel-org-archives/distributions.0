Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3DA20F083
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737643396; cv=none; b=fUlVbXfHU1dEzSvYvBThbYXENhoYYaXPqbxD5uxRxegztIR8u0Cg7VkhOKM5sfHUu3mkKor7cUI5Et6AAn0ePmVklY80fatxKo4ISkrUiuM8PeZE7EiW7zyc0/Mxg52DoGTue1iR+uzzSKKmpl4rHMlOgmp6hx6JkYLg2Os57yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737643396; c=relaxed/simple;
	bh=UBI1kjO/HRApONXSmdp9TlVq+SXc+jhj5V+HiXS/tII=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IxeM8+sN95iurNrw4GO7u+MnXgOadbeepyWX0ij1apWd6qhruVKuE2TxAKl0/Ne+XFwXTnfv5RA4KmAu81ngZ+Hzkb+k4jq8UNvEQv5J1+az47sVoIqy4O23KCFuQgroUE5C5clmpJ3f1SZZDiLIoemvy1p2D4nqf47ZK8Djtyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.1.1] (c144-147.icpnet.pl [85.221.144.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id ADE7F3434F7;
	Thu, 23 Jan 2025 14:43:13 +0000 (UTC)
Message-ID: <953fcf6e532a6b7764f2af7cae713263f31a1d9d.camel@gentoo.org>
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment
 variables
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: "Bernhard M. Wiedemann" <bwiedemann@suse.de>, 
	distributions@lists.linux.dev
Date: Thu, 23 Jan 2025 15:43:10 +0100
In-Reply-To: <aad2b06f-df80-4751-a667-8fc4c4e10482@suse.de>
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
	 <aad2b06f-df80-4751-a667-8fc4c4e10482@suse.de>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-e4XbZ5AURm8Ffm43ay/O"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-e4XbZ5AURm8Ffm43ay/O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-01-23 at 15:04 +0100, Bernhard M. Wiedemann wrote:
> On 1/23/25 2:14 PM, Micha=C5=82 G=C3=B3rny wrote:
> > Hello,
> >=20
> > As a packager, I often find it necessary to ensure two important aspect=
s
> > of the build process:
> >=20
> > 1) that the build process itself doesn't access the Internet,
> > in particular that it doesn't download any files on its own,
> >=20
> > 2) that the build process uses system shared libraries and other
> > dependencies whenever possible, rather than vendored (or downloaded)
> > copies.
>=20
> For openSUSE, we build in Open-Build-Service (OBS) that runs the build=
=20
> in KVM without Internet-access. It is the only way to be sure.

I think all major distributions use some kind of Internet sandboxing
now.  Still, I think the more correct solution is for packages not to
attempt accessing Internet in the first place, rather than us to rely
that we will be able to actually successfully sandbox them.

> We try to un-bundle libraries to use our system versions instead, but=20
> what if there are too many incompatible versions required?

As I've said in the other reply, then the decision should up
to the packager.  Yes, there will be cases when we will decide that
unvendoring is impossible or "not worth the drawbacks".  Still,
disabling vendoring by default and enabling it when necessary is better
than having to disable it every time separately.

> What is the problem with
> configure --use-system-libfoo

I've already explained that in the reply to Bruno Haible [1].

[1] https://lore.kernel.org/distributions/aad2b06f-df80-4751-a667-8fc4c4e10=
482@suse.de/T/#me20568c9c4267a16b1e096fa12224e980042f77a

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-e4XbZ5AURm8Ffm43ay/O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmeSVX4SHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQO9qkIALS3O3am8vbTlZrNCTW39EHJZKJIAOE3
3rBhovv1lVaEQ3v3Lyvt7NRfpfztu3smbmBMyqH3fJSO1Mmwp06yT2HyrNrRk2g3
qa54VU/hxZk2t0b9ze9Q7WDpUu+SgSvc/lBduEMbuEBO7ToLo6Ppo5yjmKO+l/QA
Q3hytgIMr1jh1XylxkyTzbWQJhQg6x3E9ZCLNwaPc3/Kwt3cQiRkXXpezkqRw6gP
DoHLe6rmMWdYB55MUttHfYnJqvA92jNRLDb7GGtrttYBzHy/zTUu5DgPfv0wMbTQ
1hF9SO1ZewICYFqRE5wK/uGvJK3pkY4JfH6gDgTI5XEpKxf3v6UQCdA=
=OYqQ
-----END PGP SIGNATURE-----

--=-e4XbZ5AURm8Ffm43ay/O--
