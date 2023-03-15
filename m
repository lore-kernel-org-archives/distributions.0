Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907B17E
	for <distributions@lists.linux.dev>; Wed, 15 Mar 2023 04:24:03 +0000 (UTC)
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: libevent changes ABI on >=glibc-2.36 upgrade, breaking e.g. Tor
Date: Wed, 15 Mar 2023 04:20:29 +0000
Message-ID: <878rfy7icf.fsf@gentoo.org>
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

libevent hasn't made a release in a while, so this is probably worth
getting out there.

If libevent is built against a libc without arc4random, like
<=glibc-2.36, it'll provide evutil_secure_rng_add_bytes. If
it's built against a libc providing arc4random, it'll stop
providing evutil_secure_rng_add_bytes without changing SONAME.

This breaks consumers like Tor which uses it if it exists in
libevent, leading to runtime issues:
```
Feb 15 04:57:23 systemd[1]: Starting tor.service...
Feb 15 04:57:23 tor[1321]: /usr/bin/tor: symbol lookup error:
/usr/bin/tor: undefined symbol: evutil_secure_rng_add_bytes
```

This originally bit us in Gentoo [0] and there's an upstream
bug report [1] and patch available now (but no new release)
to always provide evutil_secure_rng_add_bytes, but stubbed
out if libc provides arc4random.

[0] https://bugs.gentoo.org/894536
[1] https://github.com/libevent/libevent/issues/1393
[2] https://github.com/libevent/libevent/pull/1427

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZBFIYF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZDMnwEAi5+jt9YrQzx1poeHN+EV6UaoJlr9Jc3HTpNa
gAvHIiIBAMfOPUyXwF3McUdQ6TcZsKLe2ay9QQavohON32IDkIAI
=xoSx
-----END PGP SIGNATURE-----
--=-=-=--
