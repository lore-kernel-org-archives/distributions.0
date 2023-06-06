Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE525FBED
	for <distributions@lists.linux.dev>; Tue,  6 Jun 2023 21:29:52 +0000 (UTC)
User-agent: mu4e 1.10.3; emacs 29.0.91
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: util-linux-2.39 mount broken with older kernels
Date: Tue, 06 Jun 2023 22:27:10 +0100
Message-ID: <87y1kw9t4j.fsf@gentoo.org>
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

This is a bit late, but given 2.39.1 is taking its time
to be released, I figured I'd send it anyway.

util-linux-2.39 rewrote its mount handling entirely
which has caused some regressions, e.g.
* https://github.com/util-linux/util-linux/issues/2247
* https://github.com/util-linux/util-linux/issues/2267
* https://github.com/util-linux/util-linux/issues/2238
* https://github.com/util-linux/util-linux/issues/2283
* https://github.com/util-linux/util-linux/issues/2287
* https://github.com/util-linux/util-linux/issues/2298

Not all of these have patches yet, although some do
in the linked bugs.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZH+lTF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZDOtgD/QbG7JdeO4WVxPReCJWRX+5oOZ+AthGveJXr7
OInd0sMBAOq8SycaupquDGLuKcYwM45WgBvo61xmd2ui3LUzSz0F
=HN9M
-----END PGP SIGNATURE-----
--=-=-=--
