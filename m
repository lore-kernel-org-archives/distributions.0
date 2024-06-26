Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54516089A
	for <distributions@lists.linux.dev>; Wed, 26 Jun 2024 23:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719444455; cv=none; b=jKo0tyLfEkt4Wa+2HuxY5pYrbCwYBHB/njz8RSIabupmgs7b9xQ+ekd9pB0MUEkiD0i2uCd9VxFujVx5HfNtxxmAliNM+KUpL5u0fPqCjb93kgmOKgply6cfvmTQlEhyfldLBK0RtmTgNz/qMbOyo9Skeab/cBTYO4C8PaD3dDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719444455; c=relaxed/simple;
	bh=EmU8ciCNVEqEnHLDzssOcdbU0w9TNNB73KUQnaTF/wM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikgWy5ILO90SwSi3YnxEqIQpqgAcgRLnZDRy77AmsqX3phnsyPa1aFMwUCf0Qf03ccR1u58udpoEwlyVFV9x9+6DCeA2XjNKFMJgRPCta74NER3IBAa+u5Cpbc3neKPTmWlbbqLZsFYR0oNRwlUPIHL1XaiiyNOnR48Olvqd5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: distributions@lists.linux.dev
Subject:
 Re: packages released with libtool-2.5.0 likely fail to build on mips64
Date: Thu, 27 Jun 2024 01:27:26 +0200
Message-ID: <15217480.tv2OnDr8pf@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <3299713.44csPzL39Z@pinacolada>
References: <3299713.44csPzL39Z@pinacolada>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4225837.1IzOArtZ34";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4225837.1IzOArtZ34
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: distributions@lists.linux.dev
Date: Thu, 27 Jun 2024 01:27:26 +0200
Message-ID: <15217480.tv2OnDr8pf@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <3299713.44csPzL39Z@pinacolada>
References: <3299713.44csPzL39Z@pinacolada>
MIME-Version: 1.0

Am Sonntag, 16. Juni 2024, 16:27:26 CEST schrieb Andreas K. Huettel:
> When a tarball has been generated with libtool-2.5.0, the check for=20
> dynamic library capability will fail on mips64.
>=20
> (find is not found and the linker emulation is constructed incorrectly.)
>=20
> https://git.savannah.gnu.org/cgit/libtool.git/commit/?h=3Ddevelopment&id=
=3D9a4a02615c9e7cbcfd690ed31874822a7d6aaea2
>=20

Affects pcre2-10.44 ...

checking whether the mips64-unknown-linux-gnuabi64-gcc linker (/usr/mips64-=
unknown-linux-gnuabi64/bin/ld -m elf) supports shared libraries... /usr/mip=
s64-unknown-linux-gnuabi64/bin/ld: unrecognised emulation mode: elf
Supported emulations: elf64btsmip elf64ltsmip elf32btsmipn32 elf32ltsmipn32=
 elf32btsmip elf32ltsmip
no



=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart4225837.1IzOArtZ34
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmZ8o95fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSr/PA//Xc7ohrm0r/N+cqP9rk3G/8DgktJXb3wTeh1pwuc5qQJm3JroXydH1T2q
TnYWGCkGtD6nzILxgvDYZbHAXiITYImSf+1JKk3ONxysfPiH8v8GbrWbh5JfdNsg
L2+fxpWByDgpA6jQoU7j/gzDicivWcYB8znDPzAA4rBfUAjYyoTEHlF0wQ8n9W4I
e6mFFkhCEXeQiZOo9+fQhQ7Xf0uHxJUBoAEx83aXJWF4CT/dvluXrMAuQkeM9+sY
EAxIR8HRzyJ6/8KVD8wb8NYQPQwDSLIeVV7DRDPEwUGpJhgKmaK+/qG0r//yVkZI
MtlvEyJ8vV0h+8MM4ixd2Z50spuHXcZCGrpyi1j8og8W6uQQG+smTuXQhLyKdvPz
wMQbNm9QWmh/1vJbgK1BAhgXuyqMkRAKkZD3f05hUeIHkAD36yTNxnS42nniMgLa
V6aBaDOGFgWyZE+ToiKO8/PbRVRkxW3DaG7+OUaSCI1AAk9OaTZc1zz8SCJQ2M4M
daGkwJGTAAWsKYj4o4JoMdGcLb95KllErvOIy5xkIUBAFKFavLzFoAeQ4PX+BSxr
nfNwSX3puI/VCxzQW0WN86cnrQ45P/hnvTDBHZCzj3CpIbxL5/y1McsasBCDY7Tx
GMLhoNatNeWTaCkKvh32AP1syAKJhP7vK8w08OPEGQyFrPz8Pf4=
=km+S
-----END PGP SIGNATURE-----

--nextPart4225837.1IzOArtZ34--



