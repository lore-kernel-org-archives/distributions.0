Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BF023746
	for <distributions@lists.linux.dev>; Thu,  4 Jul 2024 17:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113630; cv=none; b=vDJ0/xbmf3kTTVIHfIG79HUwQjeY2MHSKEytx1gzHx5ogsC2V5qBdvoitiBwaYXXWnmmRwJlDAifh9pxzrS8p1OPNyn8g2b9YCztCebwxIujRxtQWMUaTazkhBfgomVxyErwucm3Sp3cShHajUvSlAr32FGYqWAcvoZcQmcoG4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113630; c=relaxed/simple;
	bh=MHAbpAeRzssUTEWOa1qfRR8nvOg3+MGoHIiE7kyl+vI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cv0CjhWnkJHaq2dQq2bQqwEt2DduA562Zq37gQvU59NdACU7nGzit4x23BQDBkUE+JeAdalg49XH6A02D9mocnMAKvfXC7nWIamUxWLjbb6+2oIMMWCK5QCRo7Q3AChgd2LIDFU61lJqW4/4MEsMVMTh78f+/1XEwspLcP4ysV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: Aliasing violation in boost-1.85 (container)
Organization: Gentoo
Date: Thu, 04 Jul 2024 18:20:24 +0100
Message-ID: <87cyntm5uv.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hi,

boost-1.85's container module has an aliasing violation so it may well
be miscompiled and give bad results.

See the following:
* https://bugs.gentoo.org/932780
* https://bugs.gentoo.org/933289
* https://github.com/boostorg/container/issues/252
* https://github.com/boostorg/container/issues/281

The upstream fix is https://github.com/boostorg/container/commit/20ad12f20e661978e90dc7f36d8ab8ac05e5a5a9.

The backport we applied in Gentoo (mirror) is
https://github.com/gentoo/gentoo/commit/4bbea521152678132cf0b02e3a152481523b3078.

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZobZ2V8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZA7GwD/U0oCd0cBA8v7KtvISUfJ5xMR31BgYr7sLVXE
cdCOI7gBAJlyG9tt8AL9OVgTlWsplz1GuBBO82LLqr1KQMrmVbMD
=rA68
-----END PGP SIGNATURE-----
--=-=-=--
