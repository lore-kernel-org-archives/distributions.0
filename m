Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B396B19DF58
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725544198; cv=none; b=YaxjbCjJQjfJNhDsJR24bUVkZOqe+q566ozwW9F5KHUziROAwOvZFxEnrGvVYzU9u7H21XR7r5FmVxdjAxnzTX4ukK3YiMxtkt+Y1RUCiZTY0wYBpIjHn2QGfPSVoD3nRKYCLGJt2nGZNiAbaiTmusV1iXiqyMaxetSwBCXrJak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725544198; c=relaxed/simple;
	bh=rRf/e/Fysw6ljWtbaXR0AhcSjcVx5gHMnmMEFg5Wq44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSaLrKEKlK1nLO6tryw1W4GcvJl1+ExrRpWwzJOXog+h32llGLcLM4ANtRPSeL2Qp8bIrUUtADOuJA8BqrrXmLG+qwjosJfshKN5ES/f4gK2fIKpR5EkviT4U5A/Q3SDUf4VPUKq/pBmRmnjxZofTE3UVtMmh/4CueACPw8dy08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Wookey <wookey@wookware.org>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
 config-patches@gnu.org, distributions@lists.linux.dev,
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com,
 dickey@invisible-island.net, toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 15:49:07 +0200
Message-ID: <4449180.ejJDZkT8p0@noumea>
Organization: Gentoo Linux
In-Reply-To: <20240905020617.GZ23787@mail.wookware.org>
References:
 <4996568.GXAFRqVoOG@noumea> <20240905020617.GZ23787@mail.wookware.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2281663.Mh6RI2rZIc";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2281663.Mh6RI2rZIc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Wookey <wookey@wookware.org>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Thu, 05 Sep 2024 15:49:07 +0200
Message-ID: <4449180.ejJDZkT8p0@noumea>
Organization: Gentoo Linux
In-Reply-To: <20240905020617.GZ23787@mail.wookware.org>
MIME-Version: 1.0

Hi Wookey,

> > in Gentoo Linux we want to change our CHOST triplets for 32-bit glibc s=
ystems that use=20
> > 64-bit time_t, since this is technically an ABI change which breaks bin=
ary compatibility [1].
>=20
> > * In an ideal world this change would be synchronized across distributi=
ons. Opinions? [5]
>=20
> Debian considered this issue over the last 18 months/2 years, and
> found very little enthusiasm for making new triplets.=20

I guess you mean "little enthusiasm within Debian".

I mean, I still remember your slides and attempts at clarification at FOSDE=
M, I was=20
there and definitely tried to get a conversation going. And we've also been=
 sounding=20
out cooperation otherwise.

> Every distro that is using 64-bit time (on 32-bit arches) just enabled th=
e flags
> and changed the ABI without setting a new arch/triplet=20

Could you maybe specify "every distro" a bit further? I'd guess Debian and =
Ubuntu,=20
plus Yocto/OpenEmbedded (which is in my opinion a special case, see separate
reply)?

> time, not have to install a new architecture, Debian and Ubuntu
> decided not to try and push a new triplet and do a library-name ABI
> update within the architecture(s). That went ahead between March and
> June this year and is now pretty-much done, modulo a few outstanding
> bugs
> (https://bugs.debian.org/cgi-bin/pkgreport.cgi?users=3Ddebian-arm@lists.d=
ebian.org;tag=3Dtime-t).

Which does not really change the long term problem we're trying to address.
I mean, one of the nice things about open source systems is that you can
keep legacy systems working for a long time without needless binary compati=
bility
breaks. The glibc developers are the real specialists for that.

TL;DR: Thanks for trying, we want to do better.

> seems to me that this is now a done deal, and 'everyone' has already
> switched within the existing triplets, even Debian, which is the

Again, please define "everyone".

> > [1] The ABI of glibc does technically NOT change, however, the type def=
inition of, e.g., time_t does.
> >     And as soon as any other library includes that in its public interf=
aces and data structures, that library
> >     changes its ABI.
> >     An example for an affected library (found real-world during testing=
) is gnutls, see=20
> >     https://bugs.gentoo.org/828001
>=20
> Yes. We did a big ABI analysis to find out how many libraries were
> affected (including LFS which glibc ties into this transition) and it
> was about 700. (there were quite a few more where the automated ABI
> tools failed and it was easier to do a transition than work out why,
> so we ended up transitioning 1093 source packages
> (https://people.canonical.com/~vorlon/armhf-time_t/source-packages).

Very nice work. It shows the overall problem is actually larger than I assu=
med.

Doing the transition without giving a d*** about historical compatibility
would be fairly easy for Gentoo, after all, we are a rolling release,=20
source-based distribution, and rebuilds of packages are normal for our user=
s.
That said, we tend to take the job serious and minimize the breakage.

> So yes it's an ABI change, but we don't always change the triplet for
> this, sometimes we just move the baseline along. This happened in the
> last for glibc 5->6 and libstdc++ v4 to v5 and the long-double
> redefinition in s390,alpha, sparc, powerpc. In fact, considering the
> whole-distro collective ABI, this happens every time there is an ABI
> change in a library. The arch/triplet remains the same, but the new
> release has a different ABI in some number of libraries and
> dependencies.

Most of the examples that you are listing here have a built-in mechanism
for coping with the upgrade.
As an example, a library changes soversion, and there is no reason not
to keep a library with the old version around if you need it still.
We have, e.g., in Gentoo a security-masked library-only package for
openssl 1.0 and 1.1 should anyone still need it, or even libstdc++ 3.

About s390, alpha, sparc, powerpc - yes, even our criteria might be a bit
looser there, however, that's mostly because the ecosystem is much smaller.=
=20
There should be by far not so many legacy binaries floating around in=20
comparison to x86.

> This was
> a borderline case that could have gone either way, but people decided
> to do it as a transition, not a new triplet.

I guess you mean "Debian decided". We certainly haven't heard from you.

Cheers,
Andreas

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart2281663.Mh6RI2rZIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmbZttMACgkQ3CsWIV7V
QSr61g/9FGIh/JGY7KdScp1fXptFnE8x4iTtb8d03AQCZVoC2FGMahbkicLNYris
6Xqe+LiguRNiTxYuLPp6AWKNErbtiru/Y+ib1dULIZ4XpdAoacbsvaIKq3+unAlu
01Nm4ISmBJuYPlBfCufkZtRXR5mhYEdRXxVLKlkUHpz2oPazYkxguAQUPAHR7AJb
p48c/30cuGijry7d1oPHMQrKPlsAV2x28MX82uG357C5PO2CYfeoVJRHibsRTOqB
92CL3WIM+t753x298ZxACGpxMyh+s1rrAVJD+5YmDb58P7MwTYbsdBQt2rHxkrop
X1LX5ZqWmNxxvNhebKSgjf81naIs9EeAPHjv/XsYJfIJA+VcU7duVjmra8E5d/JH
BytTgLB1XajwTnRwL3abnJH9uJkpw/F9QGEAl2+P7VIFLf8w6/2BjkK5Bg+qwqe6
pfEXL+JUZKLC53rpFmye2XWM20HD+07+FzWsQWx2iaQBu+DHdreWHqVHfBaNopKv
Z5Sv04XrE6Tfs0y7pPi9S2TNIzjTbrBWKFka/6yPBoGKfe8Ux/DVK4U/O2AWFmoY
6HHr5RFWzjdbfAyeNsYIdYnyMELYex3rnMJx+4qvWQusZyS/7uwbJjRokKz3SlUm
KbrLrHNiiPv3DvySKg6l1xHXkJejDkor0euK/ik2Gkx5wYr6IQ4=
=QNRW
-----END PGP SIGNATURE-----

--nextPart2281663.Mh6RI2rZIc--



