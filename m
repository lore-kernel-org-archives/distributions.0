Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B202B652
	for <distributions@lists.linux.dev>; Wed, 11 Mar 2026 02:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197346; cv=none; b=Ah6voPdS/3bfZXPFoLgxCniKEXyxVolnJDACFXi1xuNzlPmnF5WB4vfEGQrwW3VT5rdBEmkV9/bQiaKxWPjbWdeesTjk9OH7J1lJeJ3UcHC+rq73Y9bvBdyxFNdoN1h/QeBKgtkxaiGf5yzqXa0a6XnG6WeT403IXK48da74Tow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197346; c=relaxed/simple;
	bh=fQwbSpG+s7CysH4/FtToOZ3DoqSihYWxrzWFznx2DzY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HqYaNkD82gvWWX+B4w9P/RMjEY3zXa0MJd+hGZObEW27stPvKemnu8UQsTGbDiDA8ks47W334RRR3IHjvpU5f4eehbE+mF42DE1hE578wHyKVhn1ZqlV5n21UT2qgPMfGfmBT3DE6E7MZiFQYmvitwymdCp932UyICG2eczo0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 19B6A34223D;
	Wed, 11 Mar 2026 02:49:01 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Morten Linderud <foxboron@archlinux.org>
Cc: =?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
  distributions@lists.linux.dev
Subject: Re: Looking for advice on how to deal with potential slop packages
In-Reply-To: <aawYbre5_xvhfwKA@framework>
Organization: Gentoo
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
	<aawYbre5_xvhfwKA@framework>
User-Agent: mu4e 1.12.15; emacs 31.0.50
Date: Wed, 11 Mar 2026 02:48:58 +0000
Message-ID: <87ms0fw06d.fsf@gentoo.org>
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

Morten Linderud <foxboron@archlinux.org> writes:

> A lot of this is probably already a lost cause I think.
>
> Linux accept LLM contributions (look for the `Assisted-by` tags), and there are
> already multiple subsystems that are being developed in-part, or full, by LLM
> agents.

There is a distinction between the chardet case [0] or otherwise
massively-AI driven development introducing instability and bugs, and this.

>
> See the LWN discussion: https://lwn.net/Articles/1026558/
>
> `b4` has also incorperated llm agents for the review workflow.
> https://b4.docs.kernel.org/en/latest/maintainer/review.html#configuration
>
> b4 is also heavily developed by Claude these days.
>
> I don't think we can reasonably argue that Linux is not free software, and I
> don't think we can argue for forking Linux to remove llm generated code.
>
> My take on this is mostly apathy. I don't think we can reasonably challenge the
> use in the FOSS community. The productivity boost of experienced developers
> using these is too appealing when we are looking at overburdened FOSS
> maintainers.

It is of course your right to feel that way and I don't entirely
disagree, but I also think we have some responsibility to our users to
protect them in the way we always have.

I don't think that Linux having some AI-assisted commits means that we
can't discuss or perhaps even have some consensus on handling some packages.

Say, by trying to avoid new chardet and lobbying reverse dependencies to
not require newer versions if they do so, or to port to
charset-normalizer.

I don't think we'd have this response if some software was being made
proprietary. It's the same thing in that it requires some effort to
rebut, just like also if sometihng becomes unmaintained and has a
suitable alternative, or whatever else. We do that all the time.

> We've aleady been repeadetly DDoSed by these companies. Spending hundreds of
> volunteers hours keeping our services running while the companies extract the
> labour to sell back to the FOSS community, using their standing in the Linux
> Foundation to further cement their usage in our communities.
>
> Then the FOSS communities use these models without any care of the ethical considerations.
>
> Is this depressing? Yes.

[0] https://lwn.net/SubscriberLink/1061534/3040c9a3a6271043/

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEBBAEWCgCpFiEEJaa7iN2bdkxrVUHCc4QJ9SDfkZAFAmmw2BobFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyNUE2QkI4OEREOUI3NjRDNkI1NTQx
QzI3Mzg0MDlGNTIwREY5MTkwDxxzYW1AZ2VudG9vLm9yZwAKCRBzhAn1IN+RkHDY
AP9e7FC1SeD7kNXBnWx01JvpZkLwfCTB3ccPqwECCysS9wEA8TgvwaPBDOeHYZiK
9yQUN1c/EsP+jL2iFIu13Weryw0=
=Mwx9
-----END PGP SIGNATURE-----
--=-=-=--
