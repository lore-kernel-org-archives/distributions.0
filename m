Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AF6AA4
	for <distributions@lists.linux.dev>; Wed,  7 Jun 2023 07:53:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 9E110320085B;
	Wed,  7 Jun 2023 03:53:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 07 Jun 2023 03:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1686124397; x=1686210797; bh=7P
	u9P01bWkKjzYeaZZX6GSihE8FFB3j+qWnaeKzRzP8=; b=WMza2Yvh7wCzazKi/n
	QJMJjJno+QPOzptBELV4L/W8Hi2iKAcbpKQ9CEHLovmFscv6LSrTrxJEE4kp+aSc
	M26EYqk0cuEusZ6bwN08UTiCDeZNlEhnCisITWhkWIh9Icr1fuC2yku5JL9FeKAN
	TFhSvN7U/kEVQrcBqItPoZrS+gEwGcawb5lMnbJuC40twJI1snsIlGZSQ5vszytF
	flUNExcqGymOGSFQubk/+N65yyc3R3a5p5w8H3sfr+0Jkr/dT3pe1qHA8mKwqmbW
	1TyNVBT1e4o1lZQmfpPrwter4t0R38J9ZJVMM5k8uNmgrRvJ4AY1+u7rwdpiRGUg
	jvHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686124397; x=1686210797; bh=7Pu9P01bWkKjz
	YeaZZX6GSihE8FFB3j+qWnaeKzRzP8=; b=atjoaqucqMZBtSGNbX9aVKeXBmPiN
	Vdw3T9gHtw66xlwAshLBQoJFt3EhMZ7D1EJG6fxR0v8GIFVa9qhchgv/Tj+OHKxF
	2pA0J96TkkswL3IjvxFkeKV53wKFYrdXqXpUsUW/Z2s8D2OMcKj2GRDxgm0lyNkS
	zwe0n2JtQwJPHQrxWBxWuSb9TKwviTXWwjFZeUPH1K+itvyaxh1rli0lSUh6EFVI
	PXR8C7NjBQNQ9g6soTWbSOt7E9y0vookvdTe2z7S3X3hbNwWCj+Cvxo6KbTmrUXg
	xXpw2rXY6XQHSf6yLUluHS/KN0/PBevhIyEqSOQsDko9nEPCC/98ZIncg==
X-ME-Sender: <xms:bDeAZO1djG-SlTRpml75RuAffFZqEo4lZCU3yzkWBI1deWxE5KGYsw>
    <xme:bDeAZBEImf9n52Zt7NEftoeJ95hm5UAxF8pCnd52-vLBS3M6P7aScLaapAp2VAMG8
    KByROUzbxlVGSI2SQ>
X-ME-Received: <xmr:bDeAZG4NdHYuB_cKKSD_HkQ2F9Asp61MEgxGoDcNCqXX1JBWDvBd6q-u_cHky6Be33AZD2Bk7nCG7lr7ALg6okmwi2PjI4u8vA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtfedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufgjfhffkfggtgesghdtre
    ertddttdenucfhrhhomheptehlhihsshgrucftohhsshcuoehhihesrghlhihsshgrrdhi
    sheqnecuggftrfgrthhtvghrnhephefhtdffueetieffkeejgfeggeetkeduieefjeeuie
    fftddtfedvgfevheetudeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehhihesrghlhihssh
    grrdhish
X-ME-Proxy: <xmx:bDeAZP33xb1yt33SFd3vKDgn90p0yP2zGwuVA1S29H-xUrOpV5DQKA>
    <xmx:bDeAZBGpl-mAvqz_U8PNtsy8JHaNFdljGT14Kdkph4W5_kWjC1Q1FA>
    <xmx:bDeAZI_eCtKA_-lT4I_MMVUNKlm8JM0FiAX8AEOMqI7Y7mTFtkOX1Q>
    <xmx:bTeAZEMqgMQJipBcoIo3fWanaPXtLERw2U_TzZAvXfBvEvRjei6k-Q>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jun 2023 03:53:16 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
	id 268A75859; Wed,  7 Jun 2023 07:53:14 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: Sam James <sam@gentoo.org>
Cc: distributions@lists.linux.dev
Subject: Re: util-linux-2.39 mount broken with older kernels
In-Reply-To: <87y1kw9t4j.fsf@gentoo.org>
References: <87y1kw9t4j.fsf@gentoo.org>
Date: Wed, 07 Jun 2023 07:53:06 +0000
Message-ID: <87jzwfyahp.fsf@alyssa.is>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Sam James <sam@gentoo.org> writes:

> This is a bit late, but given 2.39.1 is taking its time
> to be released, I figured I'd send it anyway.
>
> util-linux-2.39 rewrote its mount handling entirely
> which has caused some regressions, e.g.
> * https://github.com/util-linux/util-linux/issues/2247
> * https://github.com/util-linux/util-linux/issues/2267
> * https://github.com/util-linux/util-linux/issues/2238
> * https://github.com/util-linux/util-linux/issues/2283
> * https://github.com/util-linux/util-linux/issues/2287
> * https://github.com/util-linux/util-linux/issues/2298

We've also seen a blkid regression:

https://github.com/util-linux/util-linux/issues/2291

A patch for 2.39 is available:

https://github.com/util-linux/util-linux/pull/2293

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmSAN2IACgkQ+dvtSFmy
ccCkERAAnnUWGK2ZRptTCbYAhiVcGAltiZtoYB3oCNXxaOVWYebN0w2y7O4Jt035
aZQhpY3FF+s1YakdqkqCYM2xxQTkXGbkfC1giAHPSfbraArv5JOnyTghZXJzwED4
fjknV93+ek8IdN7ubr4jBH//2vRQDKzV1f+4NxnO1QilcMjUMP0m2sUQAhss5TW7
smvuoJPujDDJSSW87QwGWhXLGLIcSciqLrKGNo56DFQ/FNYS5OGUnOoSVdEQObRS
OMkUGSpXGtjwdbWbn/1VKCvgADfZq0YN59YCgwoPbjbFSn9wWHcg+8tXibq0m2TV
jjDExZly166YkKeA73MVBcszPxmeoHlyx3qftU8cr9po9a/rqWkNvy/1QDISWSUz
Tl1bUxTfOTyBCa1ySqD7ZF3zeOnwrOFB0ExB0gXx2HSs4CAIEDr5tDZy3Gud8/Tn
/IDB+pWfw1mmrvYr/Y6GzYSBiRxdBw3+kzRMNxY3QAgBtFljHLvEEFzhQERQHTY4
bWOyJT7mJmZnahj3jW5B/+I1OEukkBwBgEvZOwhGcD6frj2AtupSqbiVNb8XJSe7
JLEBQ1AfGSkWtavm+ogrZS4u7UVeXHCqGMLk0h0K66loszfV9udiaYnrAsJBWeK0
/gDuysfT2lzFKmq1udBUoUCl34iOG53D6HoUDKQhjCSLkn6Hajg=
=+X6o
-----END PGP SIGNATURE-----
--=-=-=--
