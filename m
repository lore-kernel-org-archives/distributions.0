Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E080192B8E
	for <distributions@lists.linux.dev>; Tue, 10 Sep 2024 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963381; cv=none; b=VSh92d6VR6hJNDSV2n06Sg1n2P0CaNUGzWLRZ/6y63s7HiqikBDpwtuNtX8FKKFVmAxKtWuEXj45n4C6OvQsUE+UMnOWipwAzvW03ha7dn44uxYTkMxJH63OHK1o8GHISfft2nibtOctyzMsXmPfyapuLzXbxIE221BuZ143Mlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963381; c=relaxed/simple;
	bh=U8pclU5Dnz8SBn5NSxHdFbdH3R3LPFjN1OrFVFV6eUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R7e4fcAgoGNwfQuvUUAhkV16PULlsd21uOLqNySQjxSyWW2a70cHvxnAgOMDOF+xkkPG3rBFoY2sIz9Txmt00Kd3rNaiFRVEMtlYl1CQJxQ7RCE8ma9PTbkoAEZHAPd+GinaL4e7AYN2OPx0crW6897bSqUnyUpwXivcCP13O38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Jacob Bachmeyer <jcb62281@gmail.com>,
 Arsen =?utf-8?B?QXJzZW5vdmnEhw==?= <arsen@aarsen.me>
Cc: Bruno Haible <bruno@clisp.org>, Wookey <wookey@wookware.org>,
 Khem Raj <raj.khem@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>,
 libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
 config-patches@gnu.org, distributions@lists.linux.dev,
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com,
 dickey@invisible-island.net, toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Tue, 10 Sep 2024 12:16:09 +0200
Message-ID: <3650049.QJadu78ljV@noumea>
Organization: Gentoo Linux
In-Reply-To: <86y140qvbf.fsf@aarsen.me>
References:
 <4996568.GXAFRqVoOG@noumea> <66DE3648.3040904@gmail.com>
 <86y140qvbf.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2047859.CQOukoFCf9";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2047859.CQOukoFCf9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Tue, 10 Sep 2024 12:16:09 +0200
Message-ID: <3650049.QJadu78ljV@noumea>
Organization: Gentoo Linux
In-Reply-To: <86y140qvbf.fsf@aarsen.me>
MIME-Version: 1.0

Am Dienstag, 10. September 2024, 01:08:36 CEST schrieb Arsen Arsenovi=C4=87:
> Jacob Bachmeyer <jcb62281@gmail.com> writes:
>=20
> >> At that point, we should bump SONAME of libc and simply remove 32-bit
> >> time support.  This would probably be okay generally.
> >
> > This is probably the best solution to this problem at hand, especially =
since
> > the old ABI has a definite expiration date about 14 years from now.  Bu=
mp the
> > libc SONAME major and hope that we can get rid of the last dependencies=
 on the
> > old SONAME before the deadline.  We will have 14 years to do it, if tha=
t arch
> > is even still used then.
>=20
> Indeed.  I believe the current thinking is that the existing software
> for the old ABI could benefit from libc updates, hence not breaking it,
> but.. it practically is somewhat broken already (hence the troubles that
> lead to this thread).
>=20

This is all nice and good, but I would actually like to focus on realistic
targets (ie., ones which could be achieved significantly before 2038... :o)

That's also the beauty of only appending t64 to the last quadruplet field,=
=20
most software is not impacted by it and just accepts it.

=2D-=20
Andreas K. H=C3=BCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, comrel, toolchain, base-system, perl, libreoffice)
https://wiki.gentoo.org/wiki/User:Dilfridge
--nextPart2047859.CQOukoFCf9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmbgHGkACgkQ3CsWIV7V
QSqMeg/9EhuofarFm0+dk2xBY1i9vLIQyOWsVUM3Y8DF9B6fToACD/zzEkA9WdRz
our9pNxDV0A4IGzsOaigYAhSM6Jr4Z6FEhDJZ61hEMUrVYq5N1Mi3fu3b3A7NM4G
o5rIkYrMvTI3vIUF+h/Pln4IcOEDqHCniYDr2gA9b0d6o+tJ+5FtfGNbdqk5gbkr
RZR8+WynZf2mSPX4t6jEmef2kdOYr7E8+dzqqqt6QGi2tmH0ti8F4qPxfti7kvBR
UZgx1gKaO137aVmqPLyjZYWwlve8ZBRR0ZrMmWYk5Pcb0dZIxPNCNVxVCSJdhTV5
IYPlZ97YNvOJ8ZWUXuddnAyx1sVvbH40T3QCIrbBGHQkE9LPdA5p6u9wESb3IHMw
FsYw2aK8F0sBtaU54oS/pSFSY8OZPHYwVzbG789YtnOFgOJ71+ru6+HleXLjyid+
AI7LuzH3Ud3mBk+eAoKQLOrsx0LRbJzNvCT0yhjeAfHO1ckpr8tJDT5YV8AIht56
iZppScDxWC1nS3wQ8tldlawe9YvHHKQrVvdE3wh1qQBN52n5fzfyzDiQjcr484J0
/aDpLCa80hPoQoypOFREjGtJBJnUBQnsIun+5Ofk5iBtGnq66uFRblJQi+3KPAHn
nGh8Nv1cixaebHMboT3bX6UeLHkqnLB6fA4tjHk7wm7I6DK/Yck=
=LCC0
-----END PGP SIGNATURE-----

--nextPart2047859.CQOukoFCf9--



