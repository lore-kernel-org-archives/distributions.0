Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9EB3D6D
	for <distributions@lists.linux.dev>; Sun, 28 Apr 2024 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714270816; cv=none; b=lCWMH1RG09DT1NjjrXfzk7MyE8oEgsGIaYfm7dGcgXNqGB2mxk7oWJqC7+EPisScJibXXlREawy9qtVetOydKKjo7PdGOwL7txm7gCRFDm5nse8o68cKx1EzP5xycP5p0ignwLj36bGb5P1M60hF5q0/o+bSOsrdvSuH+8VDzso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714270816; c=relaxed/simple;
	bh=awlaBduFIiKon/AmT5qnC1oi1nTiDqBTp01V3NhFGKw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i+IEDuc5hl3I8/VyHsrobzEI4Wewsu24IWd0x38DOMjx4/VbuqUD4nlfbanoH7FFtS7KkhW3yckYUgSynMaBfCLD13YpyCzLZMknduxuxvM8muD5pq1UFdDtG+K4lwbEInT/RfuxImmxf7gmxsv2Bz1PlSREk7+hlIJvZRrhNpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: ABI break for tree-sitter
Organization: Gentoo
User-Agent: mu4e 1.12.4; emacs 30.0.50
Date: Sun, 28 Apr 2024 03:20:10 +0100
Message-ID: <87il028bz9.fsf@gentoo.org>
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

I'm writing about this a bit late, but hopefully it's still worth doing.

tree-sitter broke ABI between 0.22.2 and 0.22.4:
https://github.com/tree-sitter/tree-sitter/issues/3296.

There are discussions ongoing about fixing their SONAME, but the
recommendation from upstream is that distributions rebuild all consumers
on each new release:
https://github.com/tree-sitter/tree-sitter/pull/3302#issuecomment-2061838409.

This manifested for us in our main QA tool crashing (pkgcheck) but
others have seen it with tree-sitter integration in Emacs.

thanks,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZi2yW18UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZCntgD/bdatWOAoeRrKdUyN4db2dDGyAlN3zLSz3lal
UvXamh0A/0t5BCvMnJm40FCRmvQCXuK/0CXNxFQAGv+gVqhLzn8H
=Cy59
-----END PGP SIGNATURE-----
--=-=-=--
