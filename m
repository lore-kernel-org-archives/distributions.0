Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927BD8F44
	for <distributions@lists.linux.dev>; Sat, 20 Jul 2024 03:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721445990; cv=none; b=HA4HgwlQOmnhGCnzLOBYPoYHa4Srg3kKg8+D/ejVb6qylPpEowz8Zo3+nXNgxRizuRzLxFh0q7fVNRiX5l7saywKzR5yRO95ycjSnSbhSVSasuymI9G79P3kjx1q5oq7bdKjak5o0NNfu3yumH+DSUhfGXY2MtLYp9AYfEeh/+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721445990; c=relaxed/simple;
	bh=Fyjndikoc8NdErsDNDlK2gD/515IXu7qXeelOj+o9vM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jfg2jUx8xjDiSCAVRo+TQ6wcERydDBQ7axIARANSn4KT2UBIIji6D4l78pzwdaOQ7IL3tZ4UuNyCr8Mfl6N1N9XLYJCeU29CHGyMcNEorgCWjOqwp5ZJGyPoNVn/0mOgr2eRi+9nKx+acxbmpTGPtRwHJrFpd1zK7quwGZnHkks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: mesa-24.1.4 incompatibility with unpatched ffmpeg
Organization: Gentoo
Date: Sat, 20 Jul 2024 04:26:24 +0100
Message-ID: <87bk2syc9r.fsf@gentoo.org>
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

For those shipping mesa-24.1.4, please check whether your copy of ffmpeg
has the patches at https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29400#note_2432971
applied, i.e.:

* lavc/vaapi_decode: Make it possible to send multiple slice params buffers
** https://github.com/FFmpeg/FFmpeg/commit/fe9d889dcd79ea18d4dfaa39df4ddbd4c8c3b15c
* lavc/vaapi_av1: Avoid sending the same slice buffer multiple times
** https://github.com/FFmpeg/FFmpeg/commit/d2d911eb9a2fc6eb8d86b3ae025a56c1a2692fba

At a glance, I don't _think_ those patches are shipped in any release or
backported on any of the ffmpeg branches yet, but please don't take my
word for it as I only looked briefly and will check properly
later. Apologies to ffmpeg if I'm wrong.

Firefox's bundled ffmpeg is also affected, see below.

Other references:
* https://bugs.gentoo.org/936310
* https://gitlab.freedesktop.org/mesa/mesa/-/issues/11533
* https://phabricator.services.mozilla.com/D216919

thanks,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZpsuYF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZBeygEA0RLEixZsWxut7TXyfUBzNz6Tsa2xS6CkPmnj
s9ey8jcBAKMqzm6svTKquB7ns1dyExKzRwlEuN/hJQIteoyT6KsE
=MjPs
-----END PGP SIGNATURE-----
--=-=-=--
