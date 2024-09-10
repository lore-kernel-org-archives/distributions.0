Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092FF1850A4
	for <distributions@lists.linux.dev>; Tue, 10 Sep 2024 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725957327; cv=none; b=UVHW0878No1jAZCTVoB7k/CFWH7inP2c+0L6Cw2gtPRYvj6vB2BxXXae+GzmTsF16cQv7xn/FI0EbfYOFwks5l925XsSrMdhpkn/jY7X4nO3wnSBsoQMH78rj7UwdfvLBUnQ+D5c3TgM9zxz+T0q0/hmDAjWz/BiYi3VMfk1IoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725957327; c=relaxed/simple;
	bh=9zhJQ6HAh+M32WjXdlOHZ3qUEA5BpWX8NQ9MM4jR+hM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fv1tDOaknQ/5DRjPdtH/gQD8clk0yMYtyY/pF1p2GvvI0aeGJT2jCePsC6dcdVRc8M9UwN+eFlnJNrAAHDShHRdDsozvRq2eo26MAMqlM4kkeDv7TsJKGmhnEsdT3H9MrBO5NJOjmXgqHdd4/yQvgLF0czjklzHPWQKf88MxmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Message-ID: <7b3b2810840aff63f7edc1dbf6ff11462c7c4a09.camel@gentoo.org>
Subject: Re: tzdata-2024b chaos
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: Yao Zi <ziyao@disroot.org>, Sam James <sam@gentoo.org>, 
	distributions@lists.linux.dev
Date: Tue, 10 Sep 2024 10:35:20 +0200
In-Reply-To: <ZuABcMcHqR7VqTma@pineapple>
References: <87jzfk1hwy.fsf@gentoo.org> <ZuABcMcHqR7VqTma@pineapple>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lPCxt+HEXrSXoWGQIw3E"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-lPCxt+HEXrSXoWGQIw3E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2024-09-10 at 08:21 +0000, Yao Zi wrote:
> On Tue, Sep 10, 2024 at 01:17:17AM +0100, Sam James wrote:
> > 2) Both libc++ and libstdc++ appear broken with a separate problem
> > [1][2][3].
> >=20
> > This manifests in Waybar, for example [4].
> >=20
> > It's not clear to me if libc++ is broken or not, as people in the bug
> > may have been testing a clang configured to use libstdc++ (the default)=
,
> > and I don't have a system to test it on to hand.
>=20
> libc++ 18, the latest stable release, seems not to support these
> timezone related functions yet.

Replying to correct both posts: it does support that (under -std=3Dc++20
-fexperimental-library) but it supports new tzdata correctly.  Only
libstdc++ is affected.

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-lPCxt+HEXrSXoWGQIw3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmbgBMgSHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQOvSQH/11R6C0wJ+RJIoY0f0oExAe3AaVaGK47
5E5BA4ulm7KzNv9FlpHh1IVBnxsIl6tBmsBhwHcFtlKGp5bBygIQ36pTKPi9wkwR
+Bi28S7v+VKaDXJq20IO5YjqfBVeoZMqdz4KY1awJ9YKIsOzF86EbjaRc97hpyIT
cUrJVJlEfum/VIFt7vPKqtItUx4I9Ita5sHgaNXCHkTr4B5+WehE61rtwDVNQLee
s6oJ57RfE7rUD8h9Ovp93QPwOaJBrUuV6bylp2v6dHo06n4u43W9xLe3r97t1m7U
MYdBe+h6MqGy6XTFMnw2qeGycZbeUb/0qZ7ZrsudcW/51c1C01Gvyfc=
=Z19T
-----END PGP SIGNATURE-----

--=-lPCxt+HEXrSXoWGQIw3E--
