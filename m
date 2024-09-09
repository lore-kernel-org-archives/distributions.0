Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC3018DF73
	for <distributions@lists.linux.dev>; Mon,  9 Sep 2024 23:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725923329; cv=none; b=OAr6gzU2ac6JzSLscRkZrX7ppuK0yxuvN+RtFrid7AQzOpbqpG16l09fg78SwX93ZFm0r43k0P2uC3mzh6WGBM4z7LMHawyPosXHggfBidp60gqjhsgiqPPpp7wsQJOZjxLn3cr7b7DScaiWiwFoJ3t0oNIyo7jMhtSGBK+o1M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725923329; c=relaxed/simple;
	bh=RcPuffvaGK77dwN28yBaY1coP4XRuXQN0qFtSWEmd34=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zpec8yCp5Ykc1trAR+B1CzcSJaFNQojDgw3bnUVLkJcDim22Ta2IvdgyF9p9AGXRmbOntV4v8DP/v097Ng9ScBoo4PVgmb/+qwQF/pgwdUiFo0rQTHWNo+zb4AL2lyHIidiRPLCLPU2VmSL6sdifyJip9mKHp/fN0j+eCs9EHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me; spf=pass smtp.mailfrom=aarsen.me; dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b=EOfrBtFG; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aarsen.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b="EOfrBtFG"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4X2jF62zYTz9tDP;
	Tue, 10 Sep 2024 01:08:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001;
	t=1725923322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RCu4BE+QVLvyQPNyNSUYATqnXwt3hlXRjSPvjH/NMic=;
	b=EOfrBtFG6FaXnucejMHUz6SWWdGAuHcWDyuUDeK4ZPt8aft3jlUMByDmdKRYk4zNqw5cMU
	UELLelxbyRNY6KY9TNSX/PxOuORufgFaV4TPBRczI1KxfFXT8sc5AtWJ2Ygm/ocp/Bhsd2
	dwdc/Uxc9IZNrsZ+9t0KsY+dHMgBPXpmbpai+Ca0W1TqjDFoGXAdPEt8Xw4NrmkeaCUYs6
	ApBQrMpsDW/fq3EuEzQ4n1KMlYhxmhqsw5fsykgPnnDjTFj+chH03GGRc6VIYHPjf4xj0U
	kilSrNSoAooswUvOcQD5EQHAiRiItT8LS3pUCI8g7trhEeSuAjyP3cS6a5nxzw==
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>
To: Jacob Bachmeyer <jcb62281@gmail.com>
Cc: Bruno Haible <bruno@clisp.org>,  "Andreas K. Huettel"
 <dilfridge@gentoo.org>,  Wookey <wookey@wookware.org>,  Khem Raj
 <raj.khem@gmail.com>,  Paul Eggert <eggert@cs.ucla.edu>,
  libc-alpha@sourceware.org,  binutils@sourceware.org,  gcc@gcc.gnu.org,
  config-patches@gnu.org,  distributions@lists.linux.dev,
  devel@lists.fedoraproject.org,  glaubitz@debian.org,  maskray@google.com,
  dickey@invisible-island.net,  toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
In-Reply-To: <66DE3648.3040904@gmail.com> (Jacob Bachmeyer's message of "Sun,
	08 Sep 2024 18:42:00 -0500")
References: <4996568.GXAFRqVoOG@noumea> <3848277.MHq7AAxBmi@noumea>
	<6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
	<1868152.c1hCyg87lr@nimes> <86mskitf0d.fsf@aarsen.me>
	<66DE3648.3040904@gmail.com>
Date: Tue, 10 Sep 2024 01:08:36 +0200
Message-ID: <86y140qvbf.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4X2jF62zYTz9tDP

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jacob Bachmeyer <jcb62281@gmail.com> writes:

>> At that point, we should bump SONAME of libc and simply remove 32-bit
>> time support.  This would probably be okay generally.
>
> This is probably the best solution to this problem at hand, especially si=
nce
> the old ABI has a definite expiration date about 14 years from now.  Bump=
 the
> libc SONAME major and hope that we can get rid of the last dependencies o=
n the
> old SONAME before the deadline.  We will have 14 years to do it, if that =
arch
> is even still used then.

Indeed.  I believe the current thinking is that the existing software
for the old ABI could benefit from libc updates, hence not breaking it,
but.. it practically is somewhat broken already (hence the troubles that
lead to this thread).

>> [...]
>> But, in the case we don't do a bump, why not update the tuple?  This'd
>> allow easy communication of whether we have 32 bit time to all
>> components of the system, and, in lieu of a better detection mechanism,
>> it'd allow anyone at a glance to look at a hosts tuple and see whether
>> it is compatible with something based on the tuple it was built on.
>>=20=20=20
>
> This is closely related to the idea I floated a year ago of redefining
> configuration tuples as lists of tags (with a canonical order) progressiv=
ely
> narrowing a broad architecture.  Start with CPU architecture and work
> "narrower" from there.  In that system, adding "-t32" and "-t64" to indic=
ate
> time_t width would be the simple solution.  In context then, it was to ha=
ndle
> different libc choices on Windows.

Yes, that's about what I imagined as the effect of the suffix.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOYEARYKAI4WIQT+4rPRE/wAoxYtYGFSwpQwHqLEkwUCZt9/9F8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0RkVF
MkIzRDExM0ZDMDBBMzE2MkQ2MDYxNTJDMjk0MzAxRUEyQzQ5MxAcYXJzZW5AYWFy
c2VuLm1lAAoJEFLClDAeosSTzb4BAJiMlOFEYyM3DO6iTLvmf1EtV2EsyUbekECB
TDyox7eJAQCtgY+PqJ1X1GPe1iDW5PvQWpDj4/vjERA6kPDiU1bpCA==
=naHm
-----END PGP SIGNATURE-----
--=-=-=--
