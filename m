Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE272459EA
	for <distributions@lists.linux.dev>; Mon,  9 Feb 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639846; cv=none; b=RIcdhrJr1X1p7K+tgKzfNe0t9/5PBJr4Bvu0aiGwGheFoLsMrkiovEck3LQVljYdl3tHarvFFfDDiADVXE81+E334pLmvjl4TBVLwMUzFIzLiSn/Ir65b2tBVTNauU3c1AEKgr943PsGVWVQxkch0IsaexOPJdkDoWGezuq3zbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639846; c=relaxed/simple;
	bh=ug3GseWWBe5rA8gjKDITgmtGQl4XLW80Bbk82FFJgCQ=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=BxqSmlU9IQr2+2tyMHHVuDEC0IJMFjvUZVB0cGyu1YYUOC/23dli3tEDaUbvGds6JPajhH/MOHbe1QmSgV5F2YTYq7sh0Y2zD4hl1PI/2aW6J5vLwdQcwoha9dNi2fK68DSJiYjazEQ1C5P0yV5RWhfSdnHQDHoHTrC4J50vQW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.0.1] (c144-132.icpnet.pl [85.221.144.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3A8533427FD;
	Mon, 09 Feb 2026 12:24:03 +0000 (UTC)
Message-ID: <f067f68c88630dd1cb6180d2773fe4b6588d2013.camel@gentoo.org>
Subject: Python: pkg_resources removal from setuptools
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: distributions@lists.linux.dev
Date: Mon, 09 Feb 2026 13:24:00 +0100
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qS01xpiXjv1HAOkCs9Rp"
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-qS01xpiXjv1HAOkCs9Rp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, everyone.

setuptools-82 removed the deprecated `pkg_resources` module [1].
I suspect this change is quite likely to cause some fallout,
particularly from Python packages that aren't actively maintained
anymore.  I've opened a thread on DPO [2] to ask if anyone in the wider
Python community is working on a solution.

[1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
[2] https://discuss.python.org/t/pkg-resources-removal-how-to-go-from-there=
/106079

--=20
Best regards,
Micha=C5=82 G=C3=B3rny

--=-qS01xpiXjv1HAOkCs9Rp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iKQEABYKAEwWIQQcFD0bEK7NPNmWHtiOMjR69AVa6AUCaYnR4BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDISHG1nb3JueUBnZW50b28ub3JnAAoJEI4yNHr0BVro
WrgBAIS+aeLfQr7fuo1CfR1xnuauwpAxeHJMrwnmv+7945swAP9WSkczGdLPAXsR
lT4PoE+4RJovNVZmD3WVvOgwqcZTAA==
=MFnL
-----END PGP SIGNATURE-----

--=-qS01xpiXjv1HAOkCs9Rp--
