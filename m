Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939CD17733
	for <distributions@lists.linux.dev>; Sat, 13 Jan 2024 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: distributions@lists.linux.dev
Subject: Re: 64-bit time_t
Date: Sun, 14 Jan 2024 00:00:59 +0100
Message-ID: <24319099.EfDdHjke4D@noumea>
Organization: Gentoo Linux
In-Reply-To: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
References: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9786257.EvYhyI6sBW";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart9786257.EvYhyI6sBW
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: distributions@lists.linux.dev
Subject: Re: 64-bit time_t
Date: Sun, 14 Jan 2024 00:00:59 +0100
Message-ID: <24319099.EfDdHjke4D@noumea>
Organization: Gentoo Linux
In-Reply-To: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
References: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
MIME-Version: 1.0

> In https://lore.kernel.org/distributions/6614772.670kD7asE2@nimes/
> Bruno Haible wrote:
>=20
> > Regarding the distro people:
> >=20
> >   The outcome of a discussion, about a month or two ago, was AFAIU that
> >   Linux/x86 and Linux/arm distros have a choice between
> >     (a) enabling 64-bit time_t for all packages, thus breaking ABI
> >         compatibility once and becoming year 2038 saft, or

CHOST=3Di686-pc-linux-gnut64

> >     (b) staying with the 32-bit time_t, and announcing that their
> >         distro will stop working in 2038.

CHOST=3Di686-pc-linux-gnu

> >   An incremental or partial move to 64-bit time_t would be too expensiv=
e,
> >   did the distro people say.

That's the option "pain without end" (instead of an end with pain).

> or option c)
> One less troublesome solution could be to patch glibc to redefine the=20
> 32-bit time_t as unsigned so that ABIs could remain compatible and at=20
> the same time it would support timestamps until 2106.
> Though that would break any application that uses time_t for dates=20
> between 1901 and 1970 (are there any?).
> Do I miss any other downsides?

ENOCRYSTALBALL - how do you find where it's needed and where not?
it was perfectly legal so far...

> option d) would be to adapt all libraries that have time_t in their API=20
> to have both 32-bit and 64-bit time_t variants. The former for=20
> compatibility with old binaries and the latter for new future-proof=20
> binaries. This could provide a smooth transition because not all=20
> 3rd-party binaries can be rebuilt.

But please please please no ugly fiddling with soname.

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart9786257.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmWjFiwACgkQ3CsWIV7V
QSqDfg//U1LzmreokIPDGlsUtWWJsbsfNsMcr2Ze4NLxNUl0e0HpbcSE+GfTwSPn
h5aB3aHGG2QahrEbPTFBymDPl7w3wD3GHwtOCWp2O2KAO3ES3kG3Stiy8gd1UGyS
CLa+buylcCyb44+pGErs6QRtaYCV/5z5mdvd4vEvtVQVJNvSa/qaJWvPSWK8WmJa
ZIIaOR1/Wq9Dxg0VmRz0PyhFrA37LCqmLxrTZNfPtYbXcvxIU6Og8N1FGeTYC4GD
vDv0hXBEOENFFdMv7QuVkjrCBWdfX/al0e3dkBwYg/bSiE7E8UfUb14DohVpn32V
/pxDaMyxx9y6QUcfUD7Wo5VXl6NtQPK6dlWRaQ5zFETHU/EP7FApIlDBcUWRH1Mw
9w9Lj5330E4s7E2fofY3VxTdBlVomp/wmacqyk5dGQON7q7/Gn+ZkJO2VHviAGnX
QhcJPnwpY00Ccz8RMEDdLxhIzRYghaeuEKDzAyVNdgMXsn7s6oOXM64pQ1j+t5Pv
1Ltx3+fNpK/R1HWd61tm+jkKJxrpXyu3azil+Tdhj9uJJHJNbRd2KEE5r0FOp1uw
LnfbXbRFLhN0osTXt4UpgOrpTvb9v3DA3iganJdpvwiRbq0+zeDvmoUrxOk4PWx9
MyQlVeqMmZc/Q4887drVCxa1Z6fFtkB4kq9z79X1QxPxtzDVM3U=
=Tqsq
-----END PGP SIGNATURE-----

--nextPart9786257.EvYhyI6sBW--



