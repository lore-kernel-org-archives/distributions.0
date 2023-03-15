Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BBB7E
	for <distributions@lists.linux.dev>; Wed, 15 Mar 2023 04:18:33 +0000 (UTC)
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: OpenSSL 3.1.0 and OpenSSH
Date: Wed, 15 Mar 2023 04:16:49 +0000
Message-ID: <87lejy7ilz.fsf@gentoo.org>
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

OpenSSH currently has an overly restrict version check
for the runtime OpenSSL version vs the built-against-version,
so if you upgrade from e.g. openssl 3.0.x -> openssl 3.1.x
without rebuilding openssh (and you shouldn't need to, as
3.1.x is ABI compatible with 3.0.x), you'll get:

```
$ ssh -V
OpenSSL version mismatch. Built against 30000080, you have 30100000
```

I've reported a bug upstream and they're already on it, but
an FYI to avoid breaking your (or possibly other peoples' ;))
systems.

Upstream bug is https://bugzilla.mindrot.org/show_bug.cgi?id=3548.

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZBFHCF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZDavAD/c/FBRsB0NCcodtQGqXYENISFNYTCD4BSECdQ
8DX1uJkBAOjCPSvHAYBq2+2zDmqj8qLg7nkMgHx3GiLsc2/yASYE
=VGuw
-----END PGP SIGNATURE-----
--=-=-=--
