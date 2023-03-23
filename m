Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52E919E
	for <distributions@lists.linux.dev>; Thu, 23 Mar 2023 22:34:24 +0000 (UTC)
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: cksum regression in coreutils-9.2
Date: Thu, 23 Mar 2023 22:32:00 +0000
Message-ID: <877cv7drmg.fsf@gentoo.org>
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

coreutils-9.2 introduced a regression to the cksum utility
where it may incorrectly say a file is "OK" even when it's not.

Note that its *exit status* is accurate, but it prints the wrong
message in 9.2.

Bug: https://bugs.gnu.org/62403
Patch: https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=76f2fb627118a26c25003dbd98c22c153b7ee1d2
Patch mirror (savannah is slow/down for me right now): https://github.com/coreutils/coreutils/commit/76f2fb627118a26c25003dbd98c22c153b7ee1d2

See also:
- https://old.reddit.com/r/archlinux/comments/11zdecf/sha256sum_c_prints_ok_for_a_failed_checksum_when/
- https://bugs.archlinux.org/task/77969

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZBzT518UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZDiDgEAwhJSKQJ3+FDfKxpPqHk4ff3r8Cj7LiUsB38S
T3H3SLMBAOUQcunBDy+9IB/eIgzKQoeXEMbZ+ZBEHpG5aavd93MH
=VWK7
-----END PGP SIGNATURE-----
--=-=-=--
