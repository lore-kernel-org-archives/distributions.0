Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38871B85F2
	for <distributions@lists.linux.dev>; Sat,  7 Sep 2024 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725712353; cv=none; b=hIwiFXqA7yExRRrKKAk9PoMu/tI7UciLpYmkzcChWSAILuea+g1HjQnGdesp36ZMAWL/pAExFCGgVQbDtVwjrUL4XIzGgzB7QX7ef3wEQ09ZKtghcLaUKrYV1ryQUDKdGhNqnQpIlUQ3hV1oDZ3DUWF+g7zfXtKidc3B2dQla6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725712353; c=relaxed/simple;
	bh=+HtRqxaTYrF7zHM6v74Xxnnwn9/2I8PF+9kdc/XLcJo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gm8C5YSwalRryN9Vxj2rZFoRp5dyIWCMTEter3iajzX6ipzI1pIy7my2Wjo6g1tvdZInKS+JQvZkSlBjzeaAgHc290PW5gRdX9LCxvALJ6Spvqn5Ue9joCqZ5e6K9mnwx4S/FSM6q95CeTDKEkaz8h0puaZr8n9ygj6jN3YLZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Message-ID: <42bc983414b3231b7bfecc209e56f348217b6aaa.camel@gentoo.org>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: Wookey <wookey@wookware.org>, "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org, 
	config-patches@gnu.org, distributions@lists.linux.dev, 
	devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com, 
	dickey@invisible-island.net, toolchain@gentoo.org
Date: Sat, 07 Sep 2024 14:32:24 +0200
In-Reply-To: <20240905020617.GZ23787@mail.wookware.org>
References: <4996568.GXAFRqVoOG@noumea>
	 <20240905020617.GZ23787@mail.wookware.org>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oCwY/NglvM6LNxdmZ5dQ"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-oCwY/NglvM6LNxdmZ5dQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 2024-09-05 at 03:06 +0100, Wookey wrote:
> So it's interesting that in fact Gentoo _does_ want to do this, but it
> seems to me that this is now a done deal, and 'everyone' has already
> switched within the existing triplets, even Debian, which is the
> hardest place to do this because it involved 1100 library transitions,
> with another 3500-odd rebuilds.

I disagree with this claim, and I really feel like in this whole thread
people are underestimating the gravity of this situation.

In the case of Gentoo, being a source distribution implies that
the vast majority of users are building everything from source.  While
binary packages are supported to some degree, this is not something we
can rely on.  As such, we need to assume that the transition will
involve rebuilding everything from source.

This in turn implies rebuilding whole production systems, bottom up.=20
This means that there will be significant periods of time during which
production systems will be running with ABI incompatibilities between
programs and their dependent libraries, and these periods will be much
longer than if binary packages were used.  In other words, production
systems will be quasi-broken for extended period of time.

What's even more dangerous is that any particular rebuild can actually
fail -- and then the user may suddenly be left with a quasi-broken
system, pending urgent recovery.  I mean, just imagine that one of your
dependent libraries failed to rebuild, and you end up having a 32-bit
time_t program with some of its dependencies using 32-bit time_t,
and others 64-bit time_t already -- and you suddenly have to figure out
how to make the problematic package build again, or revert everything
back.

Now, I'm not an expert on ABI but I do believe that the potential for
breakage is pretty serious.  After all, we are talking about doubling
the type size.  So we're talking about function parameters being
shifted, struct offset mismatches, stack corruption, heap corruption...

I think it does make sense to clearly indicate that this is a serious
change of ABI.  Furthermore, I personally would even go as far as to
change libdir, as to ensure that we can rebuild everything without
immediately breaking production systems in place.

On top of that, we need to account for the fact that users may have some
executables that they've compiled and linked to the system libraries
themselves, and these also may start suddenly misbehaving.  So perhaps
the right thing is to ensure that you can't even run an executable
unless all its linked libraries use the same time_t variant.

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-oCwY/NglvM6LNxdmZ5dQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmbcR9gSHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQOX1QIALi+vR85BaKoBFFVDth6Dzz/+9Xpl6mL
L/1dOWK/cQu5B1QTNl7cNRXTaW56RUxO++JZC6EaYxNo3MzjVNQM1i+Zo7Glil4J
fV6PzEuKQIPkr8cAZzPloxMkbirGF9MOTReyIHesp88jjwViKYHJE/6w8JNEz7lB
oMi9RFKi7yoIk1nYxlKMp1vuCeMpBXKn+vUu4nNfAMqoeDbyC5tc7KCtDzp6vODo
zCB7E7vz+ZGCQy6hFxwZ6T2NIW3d4BrpauqD06/PybsmsJ/TfAk1sewfLsdXmYT/
vc+fH9+Uz7SZYDauoZ0L1Z2WzRaJYq3YO+uYnq89WuYxM7t/UNqTNEA=
=BbGT
-----END PGP SIGNATURE-----

--=-oCwY/NglvM6LNxdmZ5dQ--
