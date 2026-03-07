Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B63290DB
	for <distributions@lists.linux.dev>; Sat,  7 Mar 2026 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772885282; cv=none; b=jWK/rS6UC9iIiO8sU9DPCIPk16UZukE4iJtac0aVSZ9MWcPDA20Posd/PxyFDdqQzzEB+CZJW5xDtrgAKBDyE5hLJ4LstGxKisRSnhT3xkzLSuEXMKFQZsfuWg+2Vpel3ZqQe+LM7KMUD2fe7PF9cddbNJvGRrKXQALyyip6mw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772885282; c=relaxed/simple;
	bh=OPXDtyzLCkkV7BR7P4sBgNR8NbX7acn2myCk2yqnjqk=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ehMmPzrY8p5rjokbpZjoAT1y0LcgST1HZEKsCE3yyue7eEfdWE8RNvibm+VPSotrDxFTClQ9sxA/wV7W3iRYCz5ZP1LF3g1G1KtcGaUOkHpVYmoX3cb2FOvarVJU7b0AH/188Td8fLi+X4OrEYCJLvrisztVIAeehvECgQUam10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xn--no-cja.eu; spf=pass smtp.mailfrom=xn--no-cja.eu; dkim=pass (2048-bit key) header.d=xn--no-cja.eu header.i=@xn--no-cja.eu header.b=XIEe3K8K; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xn--no-cja.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xn--no-cja.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xn--no-cja.eu header.i=@xn--no-cja.eu header.b="XIEe3K8K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xn--no-cja.eu; s=ds202602; h=Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=29k7NJcph5jA15mno8xR9VoRjdJ5uBFqEZjgDiCKWvM=; b=XIEe3K8KjIaer1Y3SPjkOf4+zc
	MNjDPBQ16WAGcrvpneHbTX3qwf9qjAaiIg32Uwt1leJUYjuGFpPh7zkSJgosHpfEREPIu3pOLpsqQ
	fXMmg1HJ6GB0fD+DqOq0cTwZUCuirDRvoqlIgQCeVV76XR2d8Vcd0vg58d4PL/iSlGT3/hqKqXEz5
	DvR7K0+qdp44RxxsH76pqp6ozkCjsMN8lM0iWFQ2cCOCMmg+X7TL2QBb6dKILVNd91JegkDGIJ92E
	J/TYRezdLQz1vQdIMKVJO0EWuutWKqGeNfjjioO/x+2DPEVrQOzvkHQg32D3WHuMH5R7u1xFrli4B
	50sDYCeA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1vyqRl-00GnrD-Rv;
	Sat, 07 Mar 2026 13:07:53 +0100
From: =?utf-8?Q?No=C3=A9?= Lopez <noe@xn--no-cja.eu>
To: =?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
 distributions@lists.linux.dev
Subject: Re: Looking for advice on how to deal with potential slop packages
In-Reply-To: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
Date: Sat, 07 Mar 2026 13:07:47 +0100
Message-ID: <87ldg3rgfg.fsf@xn--no-cja.eu>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org> writes:

> Hello, everyone.
>
> Seeing more and more packages embracing LLM-driven development (to the
> point of "vibe coding" or slopware), I'm looking for your ideas on how
> distributions should deal with that.  I'm basically torn between three
> things:
>
> 1. My duty towards the users to deliver up-to-date versions of software.
>
> 2. My duty towards the users to deliver *good* and *secure* software.
>
> 3. My ethical concerns, both directly related to LLM use, and to what
> people are using them for.
>
>
> As you may recall, Gentoo has already a strong policy prohibiting "AI"
> contributions [1].  However, this policy applies merely to contributions
> to the Gentoo projects themselves, and it does not affect the software
> we package.  In fact, compared to binary distributions, Gentoo has had
> rather relaxed approach to what's acceptable, that could be summarized
> as "as long as it's not outright malicious and somebody is going to
> maintain the package".  But over time, I'm having more and more concerns
> about the state of FLOSS in general.
>
>
> The first really doubtful case I've hit was the autobahn project.  I've
> learned that it started using LLM-backend coding after it had a series
> of releases with *really weird* issues (like "how that could even
> happen?!" kind of issues) [2,3,4], and my bug reports were met with lots
> of AI slop generated replies, and pull requests that were also complete
> slop.  I've eventually called the problem out, and upstream pretty much
> lashed at me [5].  Since then, I haven't pushed any new autobahn
> versions.  While the issues I've hit were largely related to packaging,
> I have no reason to believe that the actual code is any better.  So this
> is a case of rejecting slop on basis of low quality.
>
> The second big issue which you probably heard of is one of the
> maintainers of chardet using an LLM to rewrite the code while erasing
> the original autorship and changing the license, and then being an
> asshole about it [6] (you don't want to read that thread, it's complete
> shitshow with almost everyone cosplaying lawyers).  Here the primary
> concern is copyright and ethics, but it also makes you wonder what the
> actual code quality is.
>
> Of course there are just two examples.  There is a lot of projects using
> LLMs to various degree, and raising different concerns.  On the other
> hand, I feel like a lot of these concerns existed before already, and it
> is just that we previously didn't pay attention that much.  I mean, it's
> easier to say "they're using an LLM, it must be slop" than actually
> inspect the code and say "it's really bad quality".  And people were
> being assholes long before LLMs.
>
>
> What are your experiences, thoughts and ideas how to deal with this?  I
> mean, staying on old software versions and hoping people will change
> their minds (or more precisely, LLMs will stop being subsidized and
> people will have to start paying serious money for their usage) is not
> exactly a good idea.  Going around and telling people "please switch
> from dependency X to Y because X is slop (and Y isn't yet)" doesn't
> sound like the best use of our time either.  And forking?  With the
> depressing state of FLOSS these days, I can't even find energy to
> maintain my own projects, let alone take anything else.
>
>
> [1] https://wiki.gentoo.org/wiki/Project:Council/AI_policy
> [2] https://github.com/crossbario/autobahn-python/issues/1716
> [3] https://github.com/crossbario/autobahn-python/issues/1735
> [4] https://github.com/crossbario/autobahn-python/issues/1782
> [5] https://github.com/crossbario/autobahn-python/discussions/1818
> [6] https://github.com/chardet/chardet/issues/327
>
> --=20
> Best regards,
> Micha=C5=82 G=C3=B3rny

Hi Micha=C5=82,

Contributor for GNU Guix here. This same topic is bringing up a lot of
dicussion too.

In my point of view, an easier starting point is to know if
LLM-generated code can be free software or not.

If one can conclusively say that LLM-generated code is not free
software, then we can relegate these projects to the nonfree channels
where they can live their best slop-life with their proprietary friends.

For me, that would be the best outcome.

This is also important community-wise, so that existing free software
projects don=E2=80=99t start using slop libraries, at which point it will be
harder and harder to maintain a completely free system.

I also imagine that LLM-generated software will break compatibility very qu=
ickly
with older versions so it will be pretty hard to keep previously free libra=
ries.

Good day,
No=C3=A9

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQHGBAEBCAAwFiEEXVTPJVeyOOiNwYCiLSIyQQq3QEMFAmmsFRMSHG5vZUB4bi0t
bm8tY2phLmV1AAoJEC0iMkEKt0BDAlML/1HrsXgdlLaNzRwFpJ0klGydIh7nOX0W
bJnS0S/1FzUVDAXu0cWOzeUns0HFotU5jvCKwrt3ZQVf12o8DGyK0q3LTx0PrXVe
5pSXAMgTLQPqJfipC8atCxe4hJ0TjXaCw8l07MpX/fdo2m+KeFIuBFHxQjCVxrUr
JRny7GqW+6ksILZMEd/Vjm+kv7WtRrtqVMf4JxyjGbWYTg31jx//+X7Q8SD8fUCR
dS4HWQyCLv0p8FtyiO5UIVE0gRHPazvkShjNfb00k9/0myK+CF1jvcbqPEnQuqIx
DwCAciMTQFbbd8s1RPSa0qmWTCdNLFidHrC2kgIJAnDUgrPU9rfL0Xw0gYCABOaA
hbbveUPJHHU8N7dahwnQ7YLY0Gp4g/v9H9//XdznZ7cOaCCC+oEf9TFw0pBmrBdG
fwUKMiEtejSStdRQsII8INzIsC5k/xrG1x9L5fKYXna8LgCKxOwXBB1YeVjr5LcS
4a6gnNftmm7OEst8Rx+hylLwNzEQu5MMVQ==
=bvz3
-----END PGP SIGNATURE-----
--=-=-=--
