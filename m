Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D1DDD4
	for <distributions@lists.linux.dev>; Sun, 16 Jun 2024 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718548059; cv=none; b=OfZxQ6I/6OHdDd2PBPJ8AyF8OZriC3xiCExEoOT8tU/cZImtbLBx57Q1hiy9bZ0VYdhK1CVQ9ap/lyZZplu/3//xijPlfS12QajwoaPXPGAniTjJIndLnHEfkqm31hGKDVxmCtPW33rRkyZWn4oxX++XrykvoSMOgsK6CFHULO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718548059; c=relaxed/simple;
	bh=3cLdro0QnLmeb5aYALj5WVTjq44bG8b17ThghV4yXlE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YsNFowez9forwQPO9+k5OHkLK6we+66G7QmZxhdpbynTyIbAW6H6YXUAqoPAAStrIUehYxMCbfBBMT0kqhlh+7AtjlOUvruyojcnGWr1OZ23OujzKdfo9FMMUtzkVeTg+n2aW7YJ/unOo6hax6qN81IeYVngFn8RB26WxACkwWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: distributions@lists.linux.dev
Subject: packages released with libtool-2.5.0 likely fail to build on mips64
Date: Sun, 16 Jun 2024 16:27:26 +0200
Message-ID: <3299713.44csPzL39Z@pinacolada>
Organization: Gentoo Linux
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8384318.T7Z3S40VBb";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8384318.T7Z3S40VBb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: distributions@lists.linux.dev
Date: Sun, 16 Jun 2024 16:27:26 +0200
Message-ID: <3299713.44csPzL39Z@pinacolada>
Organization: Gentoo Linux
MIME-Version: 1.0

When a tarball has been generated with libtool-2.5.0, the check for=20
dynamic library capability will fail on mips64.

(find is not found and the linker emulation is constructed incorrectly.)

https://git.savannah.gnu.org/cgit/libtool.git/commit/?h=3Ddevelopment&id=3D=
9a4a02615c9e7cbcfd690ed31874822a7d6aaea2


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart8384318.T7Z3S40VBb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmZu9k5fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSrJdA//Zqrb2OMMW49fre4s3ycLmKp8OJMnKq044rdrB9R11g18kAjOOaa++u+u
64ElakWoQRSQW4aSGeT7ShO3Zm0c54hWmgdNRr9QDWoSWp1W0wopqTKMYDN4Y17V
YyIkvOtRlXUvB9sj568NBvDXO5t4DQUYgxSWO8gXDbL93aN61xF3q+4YcBklmmVH
9nprIokNah3NG65LR6Uc3fYU6mBBwe4cNVQeHcOJg/PzCgy9cWghS3V1Ajl/RydB
pspY2qRL+PHkpj/NhkfrMe/zSCFCOFFuRA66fZt+8rjAU6KK6A+Y+IWpvAzf/4vp
SdJYCt0oS/+or+YhpubwXEfdYSaRfkyF5S+pOBdXOe6mjWcVz8AkptUi6RI3BQDw
5DE2AMCEOulHouM1KMYxfTnUIWDW4DQshSSo4MUwvElPOoqKxW1LPp+4tK7tZWnE
+I6wex5ZjWSgaNOIj+4UMGLsUAxct0mCuhBa6G6MRwPspRkqdiPs/iVeHF+9TnOW
BPmBNxZdSKl5c/OFUy9QL77MWZJbBTYpnk0h+vLBLUoiMyWln9boXLcmrGn8/FZ8
CH0/ezBPjP3qhwzn0BoDLe573F5uPA6E8DTSnVRvXrE8Eb3GHtV2T1+sM33y/xQY
W8RvOZB44LehkxH0QeftsEO9XWv1SI5ff1xjI2lRdNo6vxeXPWI=
=ubtg
-----END PGP SIGNATURE-----

--nextPart8384318.T7Z3S40VBb--



