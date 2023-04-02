Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73E53A2
	for <distributions@lists.linux.dev>; Sun,  2 Apr 2023 18:05:02 +0000 (UTC)
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Cc: Harmen Stoppels <harmenstoppels@gmail.com>, python@gentoo.org
 <python@gentoo.org>
Subject: cython-0.29.34 allows regeneration via environment var
Date: Sun, 02 Apr 2023 18:55:00 +0100
Message-ID: <87bkk6f9qz.fsf@gentoo.org>
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

It's a common issue for distros to need to forcefully regenerate
Cython files in Python packages for e.g. newer cpython compatibility.

Thanks to @haampie, cython-0.29.34 now supports setting
CYTHON_FORCE_REGEN=1 as an environment variable to force regeneration.

See https://github.com/cython/cython/commit/a121544a0a5117f194e99c363e23c3d3596cc080
and https://github.com/cython/cython/pull/5307.

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZCnB5F8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZCkSAD/YtI/rNs96cYgOVDN9kGHE04pGClJh7PyOYFX
wElWuBQA/RX4cg1vZ6PUzRIojIop19q13dQl3qQy7RI0WceSBJ4H
=Ci7J
-----END PGP SIGNATURE-----
--=-=-=--
