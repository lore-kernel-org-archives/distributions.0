Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C581B85DF
	for <distributions@lists.linux.dev>; Sat, 21 Dec 2024 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734793949; cv=none; b=Up5PTUP0zGd50DquLZPpr1+Y2IV9PpZwixyoJdRRGQSnyhPKRZEhW90KDRo+2QoSEUavM2CVdqge6CccSEtuEqFm8OWhzGt0nIw5XKTyfbO7hPSCxTr16pS7sDjLk5pJxVkqngusE4AS1Z7VYgSXZBwFOkhXJKqtPrd+OjvG6Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734793949; c=relaxed/simple;
	bh=zVvqhnvYktxLCQEPlLoiPHKP/4i/ruM3qhoVSddimhQ=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=YxVbHJXwHot51vuTl+6mk/180RTiGjq/SPYn3vZXEs52ULpjZA/+qSadeitItEN6qeWrYYLI2iJZ1iv3t0/z3zQX4EiZL/+sHxNaCx41KmCsb+W3BbY3wpNvzHH/g9KVpIxEDGX6tgp4yXyhUPw4AdXlomFhCoS7f8Zd1fMqUPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Message-ID: <18418467af0f3d14c4bc4d297dd4a9e30313043c.camel@gentoo.org>
Subject: The uv project is working on a new PEP517 backend that may
 negatively impact Python packaging for distros
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: distributions@lists.linux.dev
Date: Sat, 21 Dec 2024 16:12:21 +0100
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-OWa2x6YANOU5+z9bYDB/"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-OWa2x6YANOU5+z9bYDB/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, everyone.

I've learned that the uv project is currently working on starting to
provide their own PEP 517 build backend [1].  I am significantly worried
that it will negatively impact our ability to package Python software in
Gentoo, and I think other distributions that do not use wheels will also
be impacted.

Just to make things clear, I'm not opposed to uv itself at all.  I think
it's a great packaging tool, and I use it when I can.  However, this has
a flip side that once it starts providing its own build backend, it will
become immensely popular and people will be using it for pure Python
projects.  This will mean that -- unless we resort to some kind of
downstream patching or workarounds -- building wheels for these packages
will also require installing uv, and therefore the portability of pure
Python packages using the backend will be severely limited.

The way I see it, if the backend starts being officially recommended,
things are going to become much more painful for us.  If anything,
Gentoo will probably have to resort to downstream patching the packages
to use a pure Python backend instead to retain compatibility with all
the targets we support.

[1] https://github.com/astral-sh/uv/issues/3957

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-OWa2x6YANOU5+z9bYDB/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmdm2tUSHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQOoBEH/jajzC5+ImOSa/poGK3LQ2ftWCf1SdnM
oG3kiSnSru2TJly8Pg50G5vueXIehUB09catZFl6F5q46PCWEJKjb5oa/SbJTUld
l7OgVYLnZtl+qIQN0nyUslpOrDOqCUaKQdtUeJLYtJy17VkseJhQWMrJURLenjyX
s+gphJ0OlNAumiCessyuCd37qiEooUj4V+/QOrxL3+TweanbLe2FDi1jSAy5gHsO
TH7YBgkbcaRrGZOGQ38yyLLik7i4HiIehKgHSpIVg1Y0YDGqwM+uvMWFK6lKiSfi
cnEH3kfSDdirm9GN3iER3jVh/VMA12E6C9hl3iTDxpwfzYcKamu2WQg=
=iDs7
-----END PGP SIGNATURE-----

--=-OWa2x6YANOU5+z9bYDB/--
