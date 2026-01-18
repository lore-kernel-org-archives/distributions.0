Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDC500954
	for <distributions@lists.linux.dev>; Sun, 18 Jan 2026 03:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768706307; cv=none; b=DPyt+Vsw4jVArg366kZvUeAvB+GKOSRZ/dNtqF78AAVe+7pMsoDlyIH426bq4kV2XZSkj2ANFZ4MemouknmIuhanVXcqyGHp2X/n/iNoaCi4UQk50jFDZuVVrk96AaogHezwO3xSqem9ta9ZEwRqyuvpoh5FJsbnwC8hDnbw7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768706307; c=relaxed/simple;
	bh=5jpAnRpUeePlJCYXkqQIJ2gNW2CH57TpS+VyYaXuNGk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odaNofNNunph1FGl6MfvifJ8nJIE1WlcRm8rdo9dh56hMJ1Ki5hFiw3AP4ZhZ7MpHjDgkvGVtm9O1lH3jGTTU9tavEasoXpUx2XJzcxDjMD3LBLk3IvNVU1o1XmjVCVIP9PMgmKtEgRmvBxHHDob/drMqx3pZ4zhQygFd++1lo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.0.1] (c144-132.icpnet.pl [85.221.144.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BFB01341075;
	Sun, 18 Jan 2026 03:18:23 +0000 (UTC)
Message-ID: <957948e7cc92d61e41c883e1eca3def8ffc2cf19.camel@gentoo.org>
Subject: Re: year 2038 is only 12 years away
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: "Bernhard M. Wiedemann" <bernhardout@lsmod.de>, 
	distributions@lists.linux.dev
Date: Sun, 18 Jan 2026 04:18:20 +0100
In-Reply-To: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-urdaYAK4fIcPsXH7GS3f"
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-urdaYAK4fIcPsXH7GS3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-01-18 at 03:28 +0100, Bernhard M. Wiedemann wrote:
> I think, some distributions already started to compile their 32-bit code=
=20
> with `-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64` but that is only part o=
f=20
> the solution.
> Code that handles timestamps regularly gets added or rewritten and every=
=20
> time, developers need to remember to not use `int` there (nor `long` on=
=20
> 32-bit systems) but `long long` or `int64_t` or just `time_t`. I myself=
=20
> sent PRs in the past using `atol` for timestamps. We should not do that=
=20
> anymore. same for `scanf("%l")`.
>=20
> I opened a discussion with the gcc devs at
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D118326 about adding=20
> warnings for int=3D>time_t conversions. It did not yet get very far, but=
=20
> at least a collegue at SUSE made a PoC patch and identified some corner=
=20
> cases.
>=20

Thanks for working on this.  Personally, I think the biggest problem is
that a lot of people don't test their software on 32-bit platforms at
all.  And the primary cause of that problem is that a large number of
popular CI platforms don't provide 32-bit environments at all (and
people obviously don't go out of their way to, say, run a 32-bit
container on top of the 64-bit CI environment).

--=20
Best regards,
Micha=C5=82 G=C3=B3rny


--=-urdaYAK4fIcPsXH7GS3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iKQEABYKAEwWIQQcFD0bEK7NPNmWHtiOMjR69AVa6AUCaWxQ/BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDISHG1nb3JueUBnZW50b28ub3JnAAoJEI4yNHr0BVro
9fQA/0KgvS3Sz5p8FN0ZsZR1G3qv0KwbLZdEE35lTABrky6wAPwOMVhuBFcHLpky
YbjCHB9WEIHjNciG2uoIEiUtAsQtCg==
=HLk2
-----END PGP SIGNATURE-----

--=-urdaYAK4fIcPsXH7GS3f--
