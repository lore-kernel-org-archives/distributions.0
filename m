Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069C3D544
	for <distributions@lists.linux.dev>; Sat,  7 Mar 2026 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772886987; cv=none; b=sSDskQn7v9b4s4sTU97BjIAkSjbU0SPLTNYfvf4B1rG+tgZx+KXrjs9d8yDX2/WpzMAb6AC9GoZooOKxCupUUSJ0Pvqya/ElYSnYjNjPRYlU7hRVbe56LJ/29Ob5M8f/TbFAiUlQatc29rTJRad393DGB58c3iLbbhZfPUtgEu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772886987; c=relaxed/simple;
	bh=E/3Gv002ku8pfNTVCKBKHgyY5s0Iljt4M5i619WNdXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvq6SQs0n1JHXfKzc6tYK24WKsiOl0FchiuWgQNY/JxusUJrxCYa+vZhWjZ3CT54W78dwGwkXDcFNBQxN359qxAIYQPossIRGIj7lHStK/eEpgYxMHvq4/reezsnyu+ThigeltxfNAk1A9yD6EqJyZ2q0L5xWly82EYoeAB3ocg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=jKWTlYVE; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=u5qfJ3/Z; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="jKWTlYVE";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="u5qfJ3/Z"
Date: Sat, 7 Mar 2026 13:36:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1772886982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E/3Gv002ku8pfNTVCKBKHgyY5s0Iljt4M5i619WNdXA=;
	b=jKWTlYVEBveq2WY+uREyHZKTPUXh5uLVZl3rrdOcWQS8/B1W7pKm72bRmbZdw6nV6sog4W
	BHwXZvu4D0mDis2Ob1QJwSDtkIODJJmT1fFrN+oJbejesHVda7K6vXTB3UVQ7QfTxT6k29
	M2WNjJeA7cfBysfLkLs4H8hW0iqrG+ulld8eP9dxloeFaCtDzmlRtTQqNvNAk9slExNJi8
	SQA80sp2YKdTi8XJb1/ZM1pcMYJZD99IqMLH97Vb/7W0pv/qa9bx7hv7MQ8p7pcvUNypRb
	ig2pmV42M47Q4RUGW4wD6F3qSYl+XwhxrsKwt45/+s7u+iWK7cgrJPuJy2a8GhvQliZFmv
	JfjU8/Ismo7UyolhPy8tTDdiY4QnxVz2nAgp2vcLR7QaCZWb4BzC5RhquTVsyRIWKyrYxw
	ARXBu5GzsLXqoOj7naBjfSN8K3pYzjyoSStDMvFhtyRTPeCDnvNh4H3+DjfvTdXpNVdXDy
	RRrO3hTts1fhbHiu61AHcEZWy9iB38VHTDOJjRQLgG1LerBHbI9uTJctCUoULYSk417qsy
	bWDk2ecd5qKMdVZf+zyx5ip+2IFfng1osCW2W/3p1ZzYWSV6L9rcF6kT8ASDcp+syx1Rmt
	UbpkbY5m3/V0Ql4E2/kwCD364K71MvYdiVNOyAWsjlTSl2eaGhlhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1772886982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E/3Gv002ku8pfNTVCKBKHgyY5s0Iljt4M5i619WNdXA=;
	b=u5qfJ3/ZXqEw60rxqzvNzg+NEoyEhl4fFFU6vnRK0PeFHI1UVtZNbPtLgVpPSYjh0NGcEn
	UDZscByVpACN8KBA==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=foxboron smtp.mailfrom=foxboron@archlinux.org
From: Morten Linderud <foxboron@archlinux.org>
To: =?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Cc: distributions@lists.linux.dev
Subject: Re: Looking for advice on how to deal with potential slop packages
Message-ID: <aawYbre5_xvhfwKA@framework>
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kq252hwumeawohhf"
Content-Disposition: inline
In-Reply-To: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>


--kq252hwumeawohhf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Looking for advice on how to deal with potential slop packages
MIME-Version: 1.0

A lot of this is probably already a lost cause I think.

Linux accept LLM contributions (look for the `Assisted-by` tags), and there=
 are
already multiple subsystems that are being developed in-part, or full, by L=
LM
agents.

See the LWN discussion: https://lwn.net/Articles/1026558/

`b4` has also incorperated llm agents for the review workflow.
https://b4.docs.kernel.org/en/latest/maintainer/review.html#configuration

b4 is also heavily developed by Claude these days.

I don't think we can reasonably argue that Linux is not free software, and I
don't think we can argue for forking Linux to remove llm generated code.

My take on this is mostly apathy. I don't think we can reasonably challenge=
 the
use in the FOSS community. The productivity boost of experienced developers
using these is too appealing when we are looking at overburdened FOSS
maintainers.

We've aleady been repeadetly DDoSed by these companies. Spending hundreds of
volunteers hours keeping our services running while the companies extract t=
he
labour to sell back to the FOSS community, using their standing in the Linux
Foundation to further cement their usage in our communities.

Then the FOSS communities use these models without any care of the ethical =
considerations.

Is this depressing? Yes.

--=20
Morten Linderud
PGP: 9C02FF419FECBE16

--kq252hwumeawohhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwQA0ZnZjToDJQPuenAL/QZ/svhYFAmmsG7AACgkQnAL/QZ/s
vhYBQw/+KqxmLyyKb1uhBPbBcK2Rwq2OZ6y5uYmM/uTHCeDHE8jXuzpUV4kiatS0
yq6kbcRopZ3/FXcedmQfsGCuE/+8BOmaFW9z3zk7TgFYJwibXfonC02BqlCBj3MS
fctNF11t6nkJTYPr03Aa2hjLzaYu4H+YuiXSJkAeJQaMdTH6M06cei+PVzI1rPn/
1hAKidZxQCcfL3kCrXHzJIKau2PizLVG0Sb+4DaSP3loRVOeyxh4cQCCQgxhGL0J
Rv35nshnyaVsxNF2Bbi01VTaHAHtTWrfQlkWCGVCoZuBoUg5AQj1UDpSz0qFrTJL
rZws1KbMhVzXZQPhFJlnUkQ9bLrHomDaFeX6AA+lA8FINrvfItbM0oSsCzy7JxMN
TeXtDL3qUD8ZyTPDngy1O0IRIdtTvW9COuLwuZIUBy8b9bCDWJbtHaPZb6WFUS6R
2chV6YG5lHHiGfcox/59Y9EYknrjmgRMbPjAHfUHpZHH7PnYVHnx+XWyjbGZijg+
Ao6WUApKYekTJRuVHh6QqYHYwgBkPt0UyqUyFdoeANgZbqbI0Wecl1hWDVZX6M1F
3/nwRPFZPhdDykeheBHt+AM2nSmSZ6RsELLk8jMD5DIYx6J9DPSsEzgmrVpuJ2Xq
OkHiwBx23HaJ0kfgTVgCcXo5+Jy8vBgHZ87UC5tQHh7C9pPPqvo=
=N8MW
-----END PGP SIGNATURE-----

--kq252hwumeawohhf--
