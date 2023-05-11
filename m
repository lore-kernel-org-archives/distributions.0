Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090765B
	for <distributions@lists.linux.dev>; Thu, 11 May 2023 11:43:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 81DFD320051E;
	Thu, 11 May 2023 07:43:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 11 May 2023 07:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1683805390; x=1683891790; bh=4k
	d/pfRrU1gnS2xTuGpmAY6FH6rEaXuLZ5EJZ96dmsw=; b=GUPRq620kSQfZqBMYD
	vVDbxnY44eFSLq+EEnBl8H1lkiqpllL+z2qYnoEBbvJ2DMsvgr42Z6r/pdbMJAnO
	H6SchdPBW5JKTvmhnGP77bEqurKvAyEIje0P1/IDOLF58eLPev+S5/R3rZxESVi8
	kqZPNynYxTkPc4whoDXHtBHiyfU/JaTwIA8FdFJwo+lN5iipJ0pecRLXoJkfbSbO
	vKylcJ1iGYQzSGFmKsNz+JfGT+rQct/92SyLe1TQ7xqQCRxOVamHF8nie7Rq7env
	FKWketohhxN2zDXiYT5ijawOGWf8ZcfY0zlzmOtx+r58Tfwbx4zQ62R4AZcdhI9/
	tPJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683805390; x=1683891790; bh=4kd/pfRrU1gnS
	2xTuGpmAY6FH6rEaXuLZ5EJZ96dmsw=; b=akPUYtBUMONYavU3dz4wdbG5VpxRB
	e5dP1gexGUBp/HRpKB8hG+Xoz0Cf2MASPaPlvQlCFKYOzjM/MznYbJ0d9ZxQ2yB9
	hXJb/e5H2OyGyj/5mgYIFnZzha2O7It8pcdUSFmJFWGCNvTsdVFRKwwjGmb0JDsD
	sMhWD67R0AKJ9QCgJrQsfbrpbs/h1cMaHqOXZqwEqHdHTsTx9O+L90V8Y8I/Uq6l
	FgHskYI+BxERlgfyNg4VV8mR76HslVhVkGSbD81ke6tSX2Mh5+z+BjvaBTDvyO9S
	5Lxwcdh4210HQvXyqswLpi1p4L2k1Ffi1tmFuGTGvRr7HRAa2RnyTUeKw==
X-ME-Sender: <xms:zdRcZHepOYal9I1SguvDcnVvDyKib054uwF4GPEJE01zZ3gUo_xwZw>
    <xme:zdRcZNMteKgMl1lwqyXxMxGyKQUBs-7ygYQsgzZQmE7-x7Cv9wiuxMRvgHJtKfGTV
    b5EG74dC8PKvM7gwg>
X-ME-Received: <xmr:zdRcZAhtO-SfD5rtnGjdOISn0RtlUIzzjCVIl-DfxAxMf7MTuTc5YJc7f2T_SAbHMEJVt58HNJaRXROY8uV18kZUq9qh2qwkvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomheptehlhihs
    shgrucftohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnhepue
    euudehveevhfekteffteektdehvdekhfevieetfffhvdevheffjeethfehkefhnecuffho
    mhgrihhnpehgohhoghhlvghsohhurhgtvgdrtghomhdptghlrghnghdrmhgunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihshhs
    rgdrihhs
X-ME-Proxy: <xmx:zdRcZI8IhklELah_PZeO7dmTLHsidaq3fbjE5kBbRClxc2MpK92sUA>
    <xmx:zdRcZDvj2dujUVBJ-jY8iyz3ULy2UhJ72J-nAefP2jvJC0Wmz6zKTg>
    <xmx:zdRcZHFeN4OOSn9gHB0Eoyq7D2wavWmKSY7GPp5zDesEG4a4YPEquQ>
    <xmx:ztRcZJVEexozZ4dO3RU58fAl5Vvn3b_kjSpX-h7QHBRUE5FcwHgw4w>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 May 2023 07:43:09 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
	id E8EC346EC; Thu, 11 May 2023 11:43:06 +0000 (UTC)
Date: Thu, 11 May 2023 11:43:06 +0000
From: Alyssa Ross <hi@alyssa.is>
To: Ryan Lahfa <ryan@lahfa.xyz>
Cc: Neal Gompa <ngompa@fedoraproject.org>, distributions@lists.linux.dev,
	primeos <dev.primeos@gmail.com>, Lorenz Brun <lorenz@brun.one>,
	Tom Callaway <spot@fedoraproject.org>, Than Ngo <than@redhat.com>
Subject: Re: Next Chromium release will require unreleased LLVM
Message-ID: <20230511114306.vbkabhmytl5dpzp5@x220>
References: <20230511092745.l53qykvz7roq4dqj@x220>
 <CAEg-Je9R02XBCsjP2ZLYKHzNjPvwYVdgO7qND65WOYzR9BWbLg@mail.gmail.com>
 <fyojmpiizynnkvvqqwarfubob6vs5xvdi3wpegtgw4ofpksc4v@oldvvj4faghd>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tg5r4kcoiyjbbf44"
Content-Disposition: inline
In-Reply-To: <fyojmpiizynnkvvqqwarfubob6vs5xvdi3wpegtgw4ofpksc4v@oldvvj4faghd>


--tg5r4kcoiyjbbf44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 11, 2023 at 01:35:48PM +0200, Ryan Lahfa wrote:
> On Thu, May 11, 2023 at 06:16:03AM -0400, Neal Gompa wrote:
> > We only recently switched building Chromium from GCC to Clang.
> > Switching back might be an option too, depending on what the
> > compatibility looks like.
>
> I thought that Chromium was tightly coupled to Clang for compilation.

Not quite:
https://chromium.googlesource.com/chromium/src/+/main/docs/clang.md#Using-gcc-on-Linux

--tg5r4kcoiyjbbf44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmRc1MkACgkQ+dvtSFmy
ccB/ChAAlxNyDcvqB1ymz4eaAqG6fDQnmX0wPOnUorJXiIRWKP+GKRLajC2Gx2eU
zaW153x3SUMPeT74sOq9hfyhYFjeyAbvM3p4WDFglj4ZSvyCuMu+jKB0bNvPTkK+
ZEirqPl43mXTpxBRPNdPotQ4vOJlM2BmvSixPX4Wd/6KXIXztyiO8fd4npaHh9zO
hiqm9Uacxvf7IfRl/JL4RTgCOcGPaUwo5IcUKThU/Tqra+zFmecI8yQ4D+mfP5Qk
ey0TmtDzqF32kKcMUXQTgWqOmzGB6CQxdIY+Fu+dNm9qQbuabX5UY52GtaV2YwQ+
/Tc7WKc0L3bl0C9m+rOpR3/9mH1D/e9U9KVA2yRLihbxPBtNxDGmW7R9amir41F6
jB3T2O9zu5licktbz+W+TXljzx7ZTFjlf0qHte7khqxpdRB6nwnTfPnWKxanmdrU
pEKG72/FlbW1u4KU/HN0fyYhLwNEfQNg3uG4WDsr0eIrTnqpH3Kubk/kDQnp0L6Y
Fm2cO9XX4CrpIUb3nxiJmgyNIYXS7B1WN8EY2GLx+SEADemNU4L64wg3Afirc6Dy
wE+1sO8FADCxFIyy4Cokltpz2wfZYap4zXi05Cu4AMjEllxrc+gXCJiuQA4POxKq
UdhLQypPUn80FI7It2dQp8oX8jagVneakhZqNrDjXTTLesC6bxE=
=qPNK
-----END PGP SIGNATURE-----

--tg5r4kcoiyjbbf44--
