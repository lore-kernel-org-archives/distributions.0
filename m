Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E9679CC
	for <distributions@lists.linux.dev>; Tue,  4 Jul 2023 20:09:58 +0000 (UTC)
User-agent: mu4e 1.10.4; emacs 29.0.92
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: gnupg-2.4 breaks Emacs EasyPG
Date: Tue, 04 Jul 2023 21:07:24 +0100
Message-ID: <87v8ez30c2.fsf@gentoo.org>
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

gnupg-2.4 breaks Emacs EasyPG (which does show up in test failures
too, but IIRC it hangs at runtime as well).

Upstream don't intend on applying the fix to gnupg-2.4 so distributions
will need to backport the gnupg patch (see below).

I haven't yet dug up the patch that gniibe mentions they sent to Emacs
though.

Bug: https://bugs.gentoo.org/907839
Bug: https://dev.gnupg.org/T6481
Patch: https://dev.gnupg.org/rG2f872fa68c6576724b9dabee9fb0844266f55d0d
(https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=2f872fa68c6576724b9dabee9fb0844266f55d0d)

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZKR8jV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZD7OQEAqhrOPYELnrFqenuNwdaXbVnowgnWLr3ds6vu
gq6+770A/iyrLdFFzxqrWAjhvzSEf2PSF5Fjgwh9v2gGSb9unCkF
=Co7z
-----END PGP SIGNATURE-----
--=-=-=--
