Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C790340D9A
	for <distributions@lists.linux.dev>; Mon,  6 Jul 2026 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366666; cv=none; b=k+qJofqH18NRITuthm+fTC/FXgBowsLCXBjIrWoSdEZnbPdml07aNqp1DBZMey59jO2+3p6QsdX2LYn6vEZyyB0UDx0e+4SxrY7gPTtM6qyxBlDkcGzTe0pmegDr4GOLI3dZUitjPSn3w9MLQ3TcwOqAR6suyBk4LsdH0yrcwpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366666; c=relaxed/simple;
	bh=qJBmG9A50TkhkeopedOoutUI0xjYmxTtBxoV8GCDIlA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QOEcnmPvf5mm/nx/ZQVH5TIUAGzBeXf5p5OGWj5Lm2huf1lL+K+EwcyRg1MIkBPDZy0xWeTxcZiryda/dH3OlzMfmwqT6N3HE40m7N1TCBm3aM9e16rgKsHi+ZkYyNDoPm9q49uQm6sSI1HmVNa5TN5uEqJOu0d3sv1kJz2WB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EE0C2341CFE
	for <distributions@lists.linux.dev>; Mon, 06 Jul 2026 19:37:42 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: lmdb-1.0.0 incompatibility
Organization: Gentoo
User-Agent: mu4e 1.14.2; emacs 31.0.90
Date: Mon, 06 Jul 2026 20:37:37 +0100
Message-ID: <87se5v9af2.fsf@gentoo.org>
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

lmdb-1.0.0 seems to break at least Postfix but seemingly a load of other
applications with incompatible changes, see
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=296530.

cheers,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmpMBAEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkGaY
AQD8tgQ0qnHPGN8kv1TnuE62MEFshrNuu3Xrkl1Z7d2cRwD/SwPY+1M4Qmm23A6q
tmWKzadoAgRzx2FlsxIHU5+qpA4=
=ofuP
-----END PGP SIGNATURE-----
--=-=-=--
