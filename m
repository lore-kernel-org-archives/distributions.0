Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0616713D882
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 17:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654484; cv=pass; b=rk03HZ+HU8kRzPYk+wiC2clGIUAfykQTcJGUxIz/vKxExegAw6m3673fE3AXeyFdCVbf5jvvYUYLzb1uOiyrj8M1i6D4gJSevI2h4ogCcjokY2GcDJTjNCbgXw5x0rJprQOB7Blehwz87nwewPiun5g0Z1sp6inGmm9jLClVFew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654484; c=relaxed/simple;
	bh=ztZNICiw6TZ2s5fx+S9cDxk/W+lXg8m0w867MtbDpZo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UrP8nUZM+c1KKhk8sZxtEukL/fdonMYdY8u1bSfDa8u8CEpfrG9YBt3e/hSy4cq1EYIebu6a6zb+0GC5kBMNZuj0qHdondGlhZp6ptBsf/0muYpcc5xnKy427CzGuq0xOy3y2pJU3I0Tjf8EGFkZR9K7ho+Y0VZ1/jfvAKdtyXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=mzaMtO6E; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=JtWw9ylF; arc=pass smtp.client-ip=85.215.255.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="mzaMtO6E";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="JtWw9ylF"
ARC-Seal: i=1; a=rsa-sha256; t=1737654476; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cLcaRrZ3XHxbroEG3aY9qpNX7gZqGv2I3nV+KCabKcp+klkjGPbfyIX3HkbR28SxfX
    NICdXe7/B2VDK3d5ecYe1THuzIFNyJ2LOsDkz+vta/IewIbF1OtIoyFTLedrbcds40eT
    /VsOazo2ZHaCJykwG+bMlhqlg9qVbz/TXvUG0aAuyNMBuTQhunG7bYZf4w1i2Z0Aj/EB
    ILsSsn4i11M1nQKg4A0L49sYAauVzg+y4ywB3BvgNzpO/p3bhpvU452i61anYyrbEvGo
    Cpft8KTgHmJJg8ZkPzK7y8/dVcXjBu0GIXXiPVxyweuDGM43utwIJJ3dg02DQDPlu33l
    sYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1737654476;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=TGe4eKQwk0LvJxKHqEbLiVG3CbKjGpzM5euZyJZ6bV4=;
    b=YDwMnr7wRdkCGwVuwKUanLHLEa5xRSHYrhFRqXkLgFDy91SiFZul1yeueFMoJ9Vayv
    6w1A9kglN0Dn5c254LUu5NSm/Qvv9utxHfz56zAM6TXkgv2UcDSpnOCStku8WVMrJENI
    NpcdhkEqguPfapcpxk94Yf3vy9nQG3WsV6E2w3kgMs6N1FxYdTGOOe4v4FsErYD5ie4s
    w7F6B6EunXoQQ92scXnTflvc2zSp3HPU2JK6LJjvtG3wJAj4mx/7F0oJ4S4ztbhAUzQv
    ckHtSRqptM6kGCBt/TNdpfct/jvxcQMY77JcNsrkwhFQPwjI6sSwck1npL5mSFsLghyK
    pgTA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1737654476;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=TGe4eKQwk0LvJxKHqEbLiVG3CbKjGpzM5euZyJZ6bV4=;
    b=mzaMtO6EbitMw2csrayJY0scVjpZng1rMbylhXK1JanqQaZhTwk/ht69oZomYUJekI
    0BHSPdPlrRRnwvGhAfne4VYNYGs46lNHj9kXVMwRCfZ/jNAn1Qn6cnq1XTgEnI2a5V7B
    Q4w7KAKs2eEHDw+ov/5C+j9QzaVcYm4nuMVgnXRGweAb9147yHOCGRpu+aLP/GkmPI+y
    f6Pe6K4CvkQmbb8CLRe6ey5PaoFCDFefuVXn+hXkroVWpWwmHlaE4LgpIdC8MIwIwnEQ
    X47imFBj4d/MBr8zor8jNUT1rOFivCG/g1FriVQiG01mzuUizaU0LYYGf73jiLAyvPdn
    QQjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1737654476;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=TGe4eKQwk0LvJxKHqEbLiVG3CbKjGpzM5euZyJZ6bV4=;
    b=JtWw9ylFF6vypZXaS3RHhBUu/MWYkBZKo9qxSgLEHUXPG/tjyyG7+fspy57/KRfT/M
    5n5T/VpaDhfUd7yR1dDQ==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlLnY4jECd2hdUURIbZgL8PX2QiTuZ3cdB8X/nqm2aEmETWunvpscJE6zIsYJVSN/a"
Received: from nimes.localnet
    by smtp.strato.de (RZmta 51.2.21 AUTH)
    with ESMTPSA id Nfb42e10NHltOC2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 23 Jan 2025 18:47:55 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: distributions@lists.linux.dev,
 =?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Subject:
 Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment variables
Date: Thu, 23 Jan 2025 18:47:55 +0100
Message-ID: <3678215.caWayghata@nimes>
Organization: GNU
In-Reply-To: <8c59f9bb5145bd73b30014210397be318270ed5a.camel@gentoo.org>
References:
 <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
 <9658083.GK2ZErXSoo@nimes>
 <8c59f9bb5145bd73b30014210397be318270ed5a.camel@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Micha=C5=82 G=C3=B3rny wrote:
> The problem with explicit options

The problems with your environment variable proposal are that:

  1) You can't just shove your desired way of doing things into
     build systems that originated from 1995 to 2025, that are file-based
     or network-based (like npm or cargo), that have unit tests in the
     source files or in specific files, etc.

  2) Environment variable values don't appear in the logs, while command
     line invocations typically do. Thus a developer would wonder "why
     does this build behave differently than on my machine?", creating
     LOTS of headaches.

> is that 1) they are different for every build system
> The first problem means that we simply can't standardize of anything
> like that.  Even if we agreed on a single name, you'd have --disable-
> network and --without-network for autoconf, -Dnetwork=3Dfalse for Meson,
> -DNETWORK=3DOFF for CMake and probably a dozen more.

Yeah. Face it. There is no magic wand that will make wide varieties
of build systems work alike.

> 2) they require explicit support checks,
> The second problem is that we can't simply enable it unconditionally
> and be done with it.  In Gentoo, we already do the messy thing of
> checking --help output to determine if we can pass stuff like --disable-
> shared, and that has already backfired.

Yes. A fact of life as well: Not all packages can be configured in the
same way. And yes, although the './configure --help' of some package
may show an option, occasionally such an option does not work.

If you want a distro will very small per-package configuration, look at
T2SDE.

> and 3) they
> assume you have an explicit control over the build command-line.
>=20
> The third problem goes much deeper.  I largely come from a Python
> background.  The most problematic packages I work with generally involve
> something like a PEP517 backend calling setup.py calling CMake, which
> in turn may involve some subprojects.  Having an explicit option means
> that I need to ask everyone to add an explicit option at every layer,
> and ensure that the option is passed down.

Yes: If someone has added layers over a package's build system ('ebuild'
or whatever), that layer ought to make sure it doesn't prohibit configurati=
on
possibilities on the way. That layer is not proprietary; so, you ought to
be able to fix that.

Bruno



