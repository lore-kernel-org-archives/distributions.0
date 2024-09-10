Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB951EF1D
	for <distributions@lists.linux.dev>; Tue, 10 Sep 2024 00:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725927444; cv=none; b=GBak8ik3pvGqZ7B3J7Nh8Q68VCJuTAOjqtFslBGmDYz1UxfIeZRwYO4yYU9ZV9FgF5J14aZkWjiP0kI4ALZMcIZgEGGDc6uZTPz5vjUCjOxrM7ekpEzS3sdRd14X5+gyOOU4TWc0Q6f7gNzktxZ0xXAnjETm/v9+WXcV5P/3CFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725927444; c=relaxed/simple;
	bh=ZnGSrQkEokN3bmld+5i6qL5y9vHGoAk+UKuHAtCHayo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GU0vqNlBZep9PspDNWAxltWbAQ/ukzMbNepe9rarZ9FDzRyaDlec7j+aQzXEhBfDrd2sSIt5LW451tB+puVWmfgj5rbBLjS+r2mjuwkDK05m+hyz0pra19JsCKwbsoUIxcaXuvA+NtXLrn2LdymB0vFIho7q57jD2xVGl/cyN2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: tzdata-2024b chaos
Organization: Gentoo
Date: Tue, 10 Sep 2024 01:17:17 +0100
Message-ID: <87jzfk1hwy.fsf@gentoo.org>
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

There's two issues with the latest tzdata-2024b release.

1) "Apr" vs "April" which has confused some broken parsers;
there's a patch for this post-release [0].

2) Both libc++ and libstdc++ appear broken with a separate problem
[1][2][3].

This manifests in Waybar, for example [4].

It's not clear to me if libc++ is broken or not, as people in the bug
may have been testing a clang configured to use libstdc++ (the default),
and I don't have a system to test it on to hand.

--

Paul Eggert, the tzdata maintainer, notes on the ML in one of the
threads discussing this that rolling back to 2024a is a reasonable
workaround for now, as there's no critical data changes in 2024b [5].

[0] https://github.com/eggert/tz/commit/926b507fa5c3192b1b68fab5910cbd3ba9377c97
[1] https://github.com/llvm/llvm-project/issues/107779
[2] https://gcc.gnu.org/PR116657
[3] https://lists.iana.org/hyperkitty/list/tz@iana.org/message/TECYKLZV3BBPYEJ73YWRQWFCKN62P67Z/
[4] https://github.com/Alexays/Waybar/issues/3575
[5] https://lists.iana.org/hyperkitty/list/tz@iana.org/message/HSKHZBRALUYDSSSQQ73E5VMJMEWEI4OO/

thanks,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZt+QDl8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZAxHwD+OupkC0kTxhxfUFvDLoDp8e9yGvmzlrZC5ojI
+qYcJpkBAO95WJFdcISv3rGXwR1K8yNSLYZU8fg14GWn5oBC/k4I
=Wlxj
-----END PGP SIGNATURE-----
--=-=-=--
