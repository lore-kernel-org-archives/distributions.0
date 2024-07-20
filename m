Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F68E9441
	for <distributions@lists.linux.dev>; Sat, 20 Jul 2024 03:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721445613; cv=none; b=QJkSAthKZYoF9mYkreRZpoi8HZCM13hNObL0VgilLhBtB3Pma6FgoeLhy4QCJ+WlBLfE3M8T9iEGjVAuUveqoONhHWJiUR8ZlgKzwSVgA5g22rxY2wAgeNbPLlmjojgNl3KyBByl3qMT43QWPtszM+p1Lvc2welM0IfhLUQBXRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721445613; c=relaxed/simple;
	bh=bJrr5tLOWaBhijrIA554xuAGV6/V0GssU7dwfe5DvZE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bJ37xSgVGZNfPDQGUhSGBr0by1y9aRQcA4Ya1JI83e4ipjHB7mP7H28e48b9EhhcgVYvt8Awu64tQMu8R2tuT5s/WpCUtAb4oe53T9mw+s/e5y4rzIlfkjj5DYiV+y/wK3zSxeE4tfmWWC9odW+DFWrhYkTEcLEyFJ1rNjYpbo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: fail2ban compatibility with openssh-9.8
Organization: Gentoo
Date: Sat, 20 Jul 2024 04:20:07 +0100
Message-ID: <87h6ckyck8.fsf@gentoo.org>
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

Hi!

Those of you shipping fail2ban with >=openssh-9.8_p1 may wish to
backport https://github.com/fail2ban/fail2ban/pull/3782 to fix filter
compatibility.

See also:
* https://github.com/fail2ban/fail2ban/issues/3747
* https://github.com/fail2ban/fail2ban/pull/3782

thanks,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZpss518UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZAxlAD+NYLEvceqgXW/vgv+NDoEAuIIWfoO2f8J86nb
83e7OlEBALGZ7g8f+Dwj50MlDaH6RhA/9DJQRXZ028HyA+qE7tQE
=RfIV
-----END PGP SIGNATURE-----
--=-=-=--
