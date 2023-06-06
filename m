Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDA4FBED
	for <distributions@lists.linux.dev>; Tue,  6 Jun 2023 21:14:09 +0000 (UTC)
User-agent: mu4e 1.10.3; emacs 29.0.91
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: nss-3.90 breaks w/ earlier x86-64 CPUs (SIGILL)
Date: Tue, 06 Jun 2023 22:12:22 +0100
Message-ID: <87ilc0b8fc.fsf@gentoo.org>
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

nss-3.90 unconditionally uses adcxq on x86-64 which breaks on <
Broadwell.

See https://bugzilla.mozilla.org/show_bug.cgi?id=1836925. There's
an upstream patch to just rip it out for now, but you need a
pre-requisite patch too.

Patches:
1. https://github.com/nss-dev/nss/commit/c07c4e073d95a25343cbf56b4a830a71e432869e
2. https://phabricator.services.mozilla.com/D180068?download=true

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZH+hl18UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZBPowEApaIej/ZiKbem34WMaUv5kmjbtqEE0kP/iSk2
mzzIO3cBAMfTFvRgo5h4ncouAJ4IE0+UkzljeIdKC1RCkE3K9QEM
=j4cR
-----END PGP SIGNATURE-----
--=-=-=--
