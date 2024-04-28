Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FBBEC3
	for <distributions@lists.linux.dev>; Sun, 28 Apr 2024 02:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714270955; cv=none; b=MXXKsNwkWip0LGWVFn1tzy/+qxfwewyGGcTH8DdX5/a+C7PsYguZC3F8Kxa/krPIi48Z8efnt9HyTLVM/Yt9M/r+nPWl/Fnb8LfHZfWXDb4tFYkUgayGDJn9W+IMAbPIDvYdT2SrNoDpNFCtGLYSHXEvA/t0SomLU69WLixJVEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714270955; c=relaxed/simple;
	bh=P0H/oPNXcRbHgNCT+aXYF0YoNcTeYDWSWwspeqSmzTg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E0xO5NJSLR6PQQrOjCfuv0d2QCskcI2z7iz+MLC1uCVA9Si3khM9caJd3/BDPYDVURaReqKcOC2/pWWdki3zgDHwaOey1HwvuPq4b+bFRto2qKro/kZ0JfdFFKkT1YuEvq9YQ2jIo05uaMrR/SKkEmG5LS7avX9bhwvlVM4jXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: gnutls-3.8.5 regression (causing e.g. wireshark test failure)
Organization: Gentoo
User-Agent: mu4e 1.12.4; emacs 30.0.50
Date: Sun, 28 Apr 2024 03:22:29 +0100
Message-ID: <87cyqa8bve.fsf@gentoo.org>
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

Hi,

gnutls-3.8.5 has a regression which breaks e.g. Wireshark's testsuite [0]
and also broke nullmailer [1].

The upstream bug is https://gitlab.com/gnutls/gnutls/-/issues/1540 and
the fix is https://gitlab.com/gnutls/gnutls/-/merge_requests/1830.

As noted on one of the Gentoo bugs [2], a workaround appears to be
creating an empty GnuTLS config file.

I suggest just applying the fix though [3].

[0] https://bugs.gentoo.org/930529
[1] https://bugs.gentoo.org/930752
[2] https://bugs.gentoo.org/930752#c1
[3] https://gitlab.com/gnutls/gnutls/-/commit/2d73d945c4b1dfcf8d2328c4d23187d62ffaab2d

thanks,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZi2y5V8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZCQewEAzYJu6det92ZVG2wVxqm4x2CtUTA28JEg41Z3
b7YXVlUA/i6HeKco1rvLOv8YDUOYjUDkpSfcjfQaFgqaFIwS+fAO
=uWyY
-----END PGP SIGNATURE-----
--=-=-=--
