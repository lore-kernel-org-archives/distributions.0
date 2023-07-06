Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7D8474
	for <distributions@lists.linux.dev>; Thu,  6 Jul 2023 08:17:23 +0000 (UTC)
User-agent: mu4e 1.10.4; emacs 29.0.92
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: systemd-253.5 regression
Date: Thu, 06 Jul 2023 09:15:54 +0100
Message-ID: <877crdcv3q.fsf@gentoo.org>
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

systemd-253.5 backported a problematic commit which has since been
reverted in systemd master.

Please see https://github.com/systemd/systemd-stable/issues/302.

You'll need to backport https://github.com/systemd/systemd/pull/28000
which is a revert of the problematic change.

Quoting the revert commit:
"""
[...]
The change in question also breaks user level socket activation for
`podman.service` as the termination of the main `podman system service`
process is not properly handled, causing any application accessing the
socket to hang.

This is because the user-level `podman.service` unit also hosts two
non-main processes: `rootlessport` and `rootlessport-child` which causes
the `cgroup_good` check to still succeed.
[...]
"""

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZKZ4iV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZA48gD+PJ2XE2tF+AtJFxMMOToutXo0sPLXRe6YiVeR
tD3a4TUA/R6CGgmzvsNYTHNN8BO1PuHDiSik2EnTg/R0AjlKmuIA
=jdOr
-----END PGP SIGNATURE-----
--=-=-=--
