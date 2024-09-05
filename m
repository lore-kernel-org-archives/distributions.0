Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F81A01AD
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 21:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725573279; cv=none; b=hz24+i+SqlNde120oni8KzQvNM+7MdlLxVGJOiWMCmUiPzngO0UArFpYzUa/KNBi/z/uTAf5ed+8c3bOh+AaTAkE+VdSt0so/HM3bTYX2+3WYdGeZ9q9GL3A2iEvpATyzezoNOnMxnx2REKzbS3HDPc7AXvT2zMNaU6smAWrCtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725573279; c=relaxed/simple;
	bh=JbNZ5ny6t0AFTafrUlXYbHF3ntcLBb/x/BTNARQ00cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9G8YF9+JBxrdDpj8aRZMwD1pKc0enVkO1SdKxIv5QLnKr+PVLjPT7ON3qFxdqTde3vhByD3B+rYAMl0+kmCvAbIcI48Altf8AvDcuaeSkbFCFiVlk+TMLrTv7xCfCbMleGEqh4p/DsruPLL3p6EnRUO7I+03no0GvFQYwfHX84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Wookey <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>,
 Paul Eggert <eggert@cs.ucla.edu>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
 config-patches@gnu.org, distributions@lists.linux.dev,
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com,
 dickey@invisible-island.net, toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 23:54:22 +0200
Message-ID: <2398337.iZASKD2KPV@noumea>
Organization: Gentoo Linux
In-Reply-To: <edbc4f0b-69bc-4c93-a46a-0e3cf2d82b3e@cs.ucla.edu>
References:
 <4996568.GXAFRqVoOG@noumea> <2015989.tdWV9SEqCh@noumea>
 <edbc4f0b-69bc-4c93-a46a-0e3cf2d82b3e@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2096196.PYKUYFuaPT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2096196.PYKUYFuaPT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 23:54:22 +0200
Message-ID: <2398337.iZASKD2KPV@noumea>
Organization: Gentoo Linux
In-Reply-To: <edbc4f0b-69bc-4c93-a46a-0e3cf2d82b3e@cs.ucla.edu>
MIME-Version: 1.0

Am Donnerstag, 5. September 2024, 20:20:32 CEST schrieb Paul Eggert:
> On 2024-09-05 10:03, Andreas K. Huettel wrote:
> > at least time64 implies largefile, so that will get sorted as side
> > effect.
>=20
> Right, but this means the "t" in "t64" is somewhat misleading, as it's=20
> not just about time: it also affects off_t, ino_t, etc., effects that=20
> are in some cases more important than the time_t effects. It may well be=
=20
> a good idea to use a different suffix, to remind non-experts about these=
=20
> other issues. How about "wsi" for "wider system integers"? E.g.,=20
> i686-pc-linux-gnuwsi.

=2E.. or -gnutf64 (for time and files)?

No objections against such variations in principle, just we should keep it
as simple and straightforward as possible then.

> Is the plan to call these APIs XXXt64 or XXXwsi forever, even after the=20
> year 2038? For example, will i686-pc-linux-gnu be withdrawn in a few year=
s?

I'd expect that all the 32bit linux variants will slowly sink into obscurit=
y.
(By 2038, we're probably more concerned with the 64bit to 128bit transition=
=2E)

Apart from that, I see no real need for further change later on.

> How would you deal with the problem that i686-pc-linux-gnu would mean=20
> one thing in Gentoo and something else in Debian? (This was what I was=20
> hinting at when I suggested adding a suffix for 32-bit time_t instead of=
=20
> for 64-bit.)

Well, of course I would hope that I can still convince them that tacking on=
 t64
makes sense. After all, it's easy for them now. ;) Otherwise...

=46ollowing the logic of riscv versus riscv64 versus riscv32, one could com=
e up
with a "global" definition of
* t64 suffix =3D 64bit time and lfs
* no suffix =3D can be either, your fault for not being informative, distro=
 default
* t32 suffix =3D 32bit time (and ...?)


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart2096196.PYKUYFuaPT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmbaKI4ACgkQ3CsWIV7V
QSonDw//cG3Ro1cKyjdlPdT2Lp5Wo0yDks/0xCx/yVBy88jMRY5nzDEpYcHr5Qqm
4TktV2hVu0qQhQuUkQ+EdSEGYNe4/kknfKRk3D4MThPR/4Zl0q00M3f6xMo07pT/
Aa/lvW6nmYgd7b2FTIqNJ1mpA2Zs0mAlWinwJTIb/yv39KkJe7+Map5XVu0gq9vk
zv3ECsD8HofCCw7ZPpzWYnhxGjqNhe+6CtHNYAEPy1i807bm6G9kKR3ieBgvAGxm
DYD+MZjIhWThKYdTeYlgxCVKq3D+iUSxAGZdhjF+PrY0czglapFy1AKaFHc7H7Su
UG5r5Xlz1vySBA+SF+8vSmyQxgqJgQfb6j/fq92tfWlPIC6NCtggYsm6JkU42z9m
7JILYvgZTrJ67CFJh+NZpYHa132ExIqHw1vmKLs3YX3M9Fqz73PVaI/DuYfCXwgp
+/ZmlMS95Wc7qxizvE13Hx8rDks3hOWLxFXgpW1JotKbu2QXjRU27kMmlA/7mSIN
zLaFymB403di8ki0+MH1ZJ9EQ+hegqutqx0Q48S/WEeKNpTsP8TbD3gSo8at6Egr
r/P4G9UL/6KvQ50vDS2l4oa9GhwcNAgjY/ZCLFbQrxT4uHZT9SSHYzm0Q1kTWaJg
rC94ywJY87HCeVF8MGxoGuy/XD/tCqte20ibaQ8vx1Be7NSiIcE=
=WnC/
-----END PGP SIGNATURE-----

--nextPart2096196.PYKUYFuaPT--



