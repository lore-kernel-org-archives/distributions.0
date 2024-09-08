Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC2158528
	for <distributions@lists.linux.dev>; Sun,  8 Sep 2024 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725804500; cv=none; b=Vt6VDAamDJe9JkcrvVo2QR4d0kpUsXNv1uofmz4Mhbomt930iMXkmefdbg9pW9Qak7mRidwAary7URp0Yn0N3kJjaleEI76ElkZfoma48sDPsYanhhIT7oGcW2e3OlURlR0TYdUZ2Nl6FJ0TT/Bk/8ZerEV2uHq17bUP5jWLNzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725804500; c=relaxed/simple;
	bh=D+3opGe8jPfLOA1Jaq2pPU3gS2ZFvz63pqXXRliMqMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XM66BovrgFQAG7GqqZoMh2PIu8Q16ZjnVleLUy3K1eBSnfn8Mg0ZhujNBmoSjMHcggsFtDWN3Us0jq2/PWoPJXcGsc2yBLDY/dOfPvbvD7oS+22SHddXgehistt3UGmEvF4lEQLbeOeom+ytpk5TAedh2W/TO2zi6ujeifmkDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me; spf=pass smtp.mailfrom=aarsen.me; dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b=pVH7cLRR; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aarsen.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b="pVH7cLRR"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4X1sHq5lpcz9sLy;
	Sun,  8 Sep 2024 16:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001;
	t=1725804487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqrMEGFtOJ/sqAmd1St1JKUMKSb8bIrc86HgdAcw31Y=;
	b=pVH7cLRR4LTeAeEJw9gvXnHj6ynxRA80OCZzAxK3qhUemq3Ne+7j0OqGN6JRlG8w70TRmS
	AYQebSARsOX/L0ZIxIadg+A8U5UzlpgtPjKq6oLg5IrDP/g3r5fwc1Jx8NoPJ4uEHpNRY7
	BveVrn/KyrIEvesptWdcG/m8ZxnP4R1d0jQKRpivHeHcHZ1F+dk7oYG3h2Dd7IpbP01lEU
	aCrL8Jxz3TRSnRd/nOVzlSt3q9le0r//IRyxDJuX27MZj3SR6lfvFEZ+WH+5PcxIbhAty5
	5yIsFvxo901lwtT1hduhUQBhv9Bjj7weTOH0Yqr5b4M2gSwqrYHaBKiQghDXRg==
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>
To: Bruno Haible <bruno@clisp.org>
Cc: "Andreas K. Huettel" <dilfridge@gentoo.org>,  Wookey
 <wookey@wookware.org>,  Khem Raj <raj.khem@gmail.com>,  Paul Eggert
 <eggert@cs.ucla.edu>,  libc-alpha@sourceware.org,
  binutils@sourceware.org,  gcc@gcc.gnu.org,  config-patches@gnu.org,
  distributions@lists.linux.dev,  devel@lists.fedoraproject.org,
  glaubitz@debian.org,  maskray@google.com,  dickey@invisible-island.net,
  toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
In-Reply-To: <1868152.c1hCyg87lr@nimes> (Bruno Haible's message of "Sat, 07
	Sep 2024 02:16:49 +0200")
References: <4996568.GXAFRqVoOG@noumea> <3848277.MHq7AAxBmi@noumea>
	<6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
	<1868152.c1hCyg87lr@nimes>
Date: Sun, 08 Sep 2024 16:08:02 +0200
Message-ID: <86mskitf0d.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4X1sHq5lpcz9sLy

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bruno Haible <bruno@clisp.org> writes:

> Paul Eggert wrote:
>> I'd rather just switch, as Debian has.
>
> I'd go one step further, and not only
>   make the ABI transition without changing the canonical triplet,
> but also
>   make gcc and clang define -D_FILE_OFFSET_BITS=3D64 -D_TIME_BITS=3D64
>   among their predefines.

At that point, we should bump SONAME of libc and simply remove 32-bit
time support.  This would probably be okay generally.  Just doing the
predefine doesn't really fix anything - all the problems of not being
able to detect whether t64 support exists still persist, with no
mechanism to prevent mixing.

But, in the case we don't do a bump, why not update the tuple?  This'd
allow easy communication of whether we have 32 bit time to all
components of the system, and, in lieu of a better detection mechanism,
it'd allow anyone at a glance to look at a hosts tuple and see whether
it is compatible with something based on the tuple it was built on.

AFAIK the only reason not to do that is cosmetic - and it is ugly, but
this is for a dead platform, so I'm not too worried.

> Rationale:
>
>   * We want that a user of a distro with the new ABI can build
>     packages in the usual way:
>       - ./configure; make; make install (when using Autoconf), or
>       - make; make install  (when there is just a Makefile).
>     This *requires* that gcc and clang get patched, as indicated
>     above.
>     (Only changing Debian-specific files or variables won't do it.)
>
>   * Once this has been done, is there a need for a triplet change?
>     Not in the toolchain, and not in the packages either.
>     Needs that have been mentioned in [1][2]:
>
>       - Users would like to know in which ABI they / their distro lives.
>         This can be done through a property in /etc/os-release.
>
>       - "risks incompatibility with other distributions" [2]
>         What is the problem? Do we expect users to build binaries
>         on 32-bit distro X and try to run them on 32-bit distro Y?
>         Or do we expect binary package distributors (like Mozilla,
>         videolan.org) to do so?
>         It was my impression that this approach is doomed anyway,
>         because so many shared libraries have different major version
>         in distro X than in distro Y.

It is, many do it anyway, and what's worse, many users misguidedly
prefer it to better approaches (like the ones you mentioned).

>         And that such binary package distributors use flatpak, AppImage, =
etc.
>         precisely to get out of this dilemma.
>
>       - Building gcc and glibc might need some particular options.
>         Such options can be documented without requiring a new triplet.
>
> References:
> [1] https://wiki.debian.org/ReleaseGoals/64bit-time
> [2] https://wiki.gentoo.org/wiki/Project:Toolchain/time64_migration

=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOYEARYKAI4WIQT+4rPRE/wAoxYtYGFSwpQwHqLEkwUCZt2vwl8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0RkVF
MkIzRDExM0ZDMDBBMzE2MkQ2MDYxNTJDMjk0MzAxRUEyQzQ5MxAcYXJzZW5AYWFy
c2VuLm1lAAoJEFLClDAeosST7cABALNQrDvswcacwe9yh7H9AOVExQG6hf3VxZjt
9cA78bdzAQD2D1V8KUhLFU+ZomWXkoNr58qlAdj+dk+IfOd7tyCcAQ==
=Tr+U
-----END PGP SIGNATURE-----
--=-=-=--
