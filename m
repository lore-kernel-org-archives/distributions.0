Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA87C2D4
	for <distributions@lists.linux.dev>; Mon, 17 Apr 2023 05:50:14 +0000 (UTC)
User-agent: mu4e 1.10.2; emacs 29.0.90
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: zfs-2.1.10 bug with SEEK_HOLE
Date: Mon, 17 Apr 2023 06:48:11 +0100
Message-ID: <87sfczvz04.fsf@gentoo.org>
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

Please either don't upgrade to zfs-2.1.10 or instead ship a revert of
4b3133e671b958fa2c915a4faf57812820124a7b (2.1.x) /
519851122b1703b8445ec17bc89b347cea965bb9 (master).

See https://github.com/openzfs/zfs/issues/14753 for details, but the
gist is that it's likely a repeat of the kind of problems we saw
in https://github.com/openzfs/zfs/issues/11900.

You can grab the revert we're using in Gentoo from
https://github.com/gentoo/gentoo/commit/a64fff9b8106dec5affc6a9e82bb9cbbb1fe6fec
if you wish.

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZDzeC18UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZDrWwEAtJvsGbm9QEe5zx3Bet/JubwkEBWX8Awg00Jn
lFTshl0BAOPGWQTC3ClTT2B0LBCQCSehsz3b1FLvC9JOp1Hy8pQF
=TRQ0
-----END PGP SIGNATURE-----
--=-=-=--
