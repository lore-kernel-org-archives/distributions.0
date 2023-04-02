Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A617953AA
	for <distributions@lists.linux.dev>; Sun,  2 Apr 2023 18:48:52 +0000 (UTC)
User-agent: mu4e 1.10.1; emacs 29.0.60
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: Possible issues with arpack-3.9.0
Date: Sun, 02 Apr 2023 19:46:13 +0100
Message-ID: <87zg7qt90v.fsf@gentoo.org>
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

Hi folks,

I came across this a week or so ago and it came back to mind because of
the openblas kerfuffle [0].

arpack-3.9.0 will in some cases give deterministic failure as the
randomness in the retry mechanism seems busted.

This can cause e.g. igraph's test suite to fail.

References:
- https://github.com/opencollab/arpack-ng/issues/401
- https://github.com/opencollab/arpack-ng/issues/410

Ths discussion is quite long and the second bug linked tries
to summarise it. It's complicated and for now I've just yanked
arpack-3.9.0 in Gentoo (masked it).

[0] https://lore.kernel.org/distributions/CAE6_+UeiCzpyA9-XVgX1x5Ucjccng0rdw-+WCZbtMnLX8VOKgQ@mail.gmail.com/T/#m6ed52b95d975ae3b047f5704e6f2cc9914e112fe

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZCnOEF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZBqkwD/WE1V+PDmcA60Z+Jq7jb4nghlEcjnOL8tFEJF
lFLA0KEA/12ndmL8ByBf2OYn4+ORC/SvmIoCiP7WIuia622gNPYD
=q0gX
-----END PGP SIGNATURE-----
--=-=-=--
