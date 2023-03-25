Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38B379
	for <distributions@lists.linux.dev>; Sat, 25 Mar 2023 01:40:01 +0000 (UTC)
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: SQLite 3.41.x substantial performance regression
Date: Sat, 25 Mar 2023 01:36:26 +0000
Message-ID: <87wn35bod7.fsf@gentoo.org>
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

SQLite 3.41.x has a substantial performance regression which
can be fixed with the following.

Patch: https://sqlite.org/src/info/aa6bd6dff751223e
Patch (downloadable): https://sqlite.org/src/vpatch?from=71215599cd8ebb97&to=aa6bd6dff751223e
Bug: https://sqlite.org/forum/forumpost/3a180ba0d4
Bug: https://sqlite.org/forum/forumpost/f9346b11a6

The fix will be in SQLite 3.42.0 and will not be backported because
it's "only" a performance issue rather than a correctness problem.

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZB5Q5F8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZCooQD+IvIbKR1ceEhlPKzrALGslwJhdqVQq93gi+Y4
pGyvm00BAKidtU8Ilhoq2bHbW1NN/0hiCgsfLlsOi8sKRkBdiLEA
=m3P8
-----END PGP SIGNATURE-----
--=-=-=--
