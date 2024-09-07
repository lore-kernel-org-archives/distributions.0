Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308181870
	for <distributions@lists.linux.dev>; Sat,  7 Sep 2024 00:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725668575; cv=pass; b=MJg7EugTKlPc8UU5vDhqTuqSJ9zmCS2Y3WbMQGYAg3J1Rgvdmdn5nmmBaq1kWXJ+axRkAJb/KdakNlazyCC7JYC/mF43sFw0isOjgmRIga1W6ft/HqE/2hqQY37q43vuMYyYKfPVJYGkcAKXmn8YFHpeEyjLNP2lxtFuWJ0OL1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725668575; c=relaxed/simple;
	bh=bJQsFEsDXKexk8uk+DEpCR/Wyi31Nnsz9PHT5ZEvl5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npnGe9Z2aJV3HizO5XuFzHqaAZFVC4zyUMhk+O6Bcf9JYprtoJbR2mBF9x759ynC7UfI55yTTM9glH11/xEbU6umdTmPrsY7Ql2Muu83N16MHNyGsiXfUVuP1nWXrI+8Qnl476WbuWQT5QoHZNvBbntxDB6T+J7WP4gB2ShyXxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=mDGWm9pq; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=JWsPgr9y; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="mDGWm9pq";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="JWsPgr9y"
ARC-Seal: i=1; a=rsa-sha256; t=1725668211; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tHpnywW1QoUX1iOQTG8n4FCAYv7l12KdiivN13MNv2uh7o88wALE9A+rQh/E7dJfjH
    wXZSYps6tb+ZEqUQuEN09YMuCv4zCDcJCRz6FlqVbPACEent6SjQXmveQ0j+c+CUKFxl
    zZRMZExoJny+4oYnf6O7mkRl5FO9J15OKu6IFRqp0PdVFO+85gYaBvsU8vb+qx8BM4vV
    IWfg7KuEV4+wBzkb9P90IMQIY8FrtvqCnDeB3nfP7lfnJsgCX7COQOzZCrtYhcHLysLT
    XbvHGmq6te71gVGD/FqQF+Z4lA5UC8uWvwGjrIekl+B0bzxRzSKGV93jmuTSltHzbbiQ
    NIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1725668211;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Omp0S7+0wvCxAksGDzxbQLp9qE/7AMnvO8UoBn8Dlrc=;
    b=dYBS1QQJsulVnjavBUoL8azalxPh4lmb9qcRmOZBa1KUU7yqUzkP+Hzk9KK8ObtCKe
    268H2so0kHpCojpJCou7rGIdPMY6kwixzK1j5fqPfw+thESai/raoCuGXfycSUNKnB/J
    GUSfuD1ndD4DxQE2aSG0rUjGFEYWYky3eER9t8dhHg+cjpGRI8UoLIK05MuXuUht+jR+
    U945qUnCC9l96veuc/lq1QeiipelP2VwpsvEjYvV3X9/1wZ4WdNPc2U0pRKO/Kn5XCWS
    i2KhRprn4sFmuO4i54gWuNebZWaEAl1XF2n24EPdz9Ndv+yZwpzMMxI3dqePrthkbTP7
    pHwA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1725668211;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Omp0S7+0wvCxAksGDzxbQLp9qE/7AMnvO8UoBn8Dlrc=;
    b=mDGWm9pqzEkoEAEp+/az0W5dHEJndyXzLFgEN7sdHuhk5WuFfryGYXnEFglkgsk0AE
    xh4zCo3aYSWuYsmHTaY0CCpKK821QRM6FpmWR8nuXQe/GHFXgKIJbRCwGHwzUfXClSXk
    CWzUYdUYq2Ru6/kT257ZtotCJSCCG++u2aNIfczFBD9D2iMU7r2srCfmCH7Nz9vS+SMS
    K/Bgn71qMxl0JfUaDRF+DCAJS3c4VGTrCr2sCNIWrEy3qg3foFtXKxnSuN2uc0HyZvfq
    Z2JV0MYlmgw7OQBth5pSOfpgMgzELzhd+Z/15cOlQDPCO9iU3OdglA8Ec+5iWg5AbXDh
    Fwfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1725668211;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Omp0S7+0wvCxAksGDzxbQLp9qE/7AMnvO8UoBn8Dlrc=;
    b=JWsPgr9y2DmNn9jGdtzaW4vsH2PmP1ZQs31R7iB/ir0XpDv0c19+nGfe4W/EvzJj7F
    oAGgaTYxlbLz6VQY1JBA==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlLnY4jECd2hdUURIbZgL8PX2QiTuZ3cdB8X/nqj/KEW/SlFzObNjGFxEHZpNkKU7s"
Received: from nimes.localnet
    by smtp.strato.de (RZmta 51.2.3 AUTH)
    with ESMTPSA id N17ea70870GnQ5g
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 7 Sep 2024 02:16:49 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: "Andreas K. Huettel" <dilfridge@gentoo.org>, Wookey <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org, config-patches@gnu.org, distributions@lists.linux.dev, devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com, dickey@invisible-island.net, toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Sat, 07 Sep 2024 02:16:49 +0200
Message-ID: <1868152.c1hCyg87lr@nimes>
In-Reply-To: <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
References: <4996568.GXAFRqVoOG@noumea> <3848277.MHq7AAxBmi@noumea> <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Paul Eggert wrote:
> I'd rather just switch, as Debian has.

I'd go one step further, and not only
  make the ABI transition without changing the canonical triplet,
but also
  make gcc and clang define -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64
  among their predefines.

Rationale:

  * We want that a user of a distro with the new ABI can build
    packages in the usual way:
      - ./configure; make; make install (when using Autoconf), or
      - make; make install  (when there is just a Makefile).
    This *requires* that gcc and clang get patched, as indicated
    above.
    (Only changing Debian-specific files or variables won't do it.)

  * Once this has been done, is there a need for a triplet change?
    Not in the toolchain, and not in the packages either.
    Needs that have been mentioned in [1][2]:

      - Users would like to know in which ABI they / their distro lives.
        This can be done through a property in /etc/os-release.

      - "risks incompatibility with other distributions" [2]
        What is the problem? Do we expect users to build binaries
        on 32-bit distro X and try to run them on 32-bit distro Y?
        Or do we expect binary package distributors (like Mozilla,
        videolan.org) to do so?
        It was my impression that this approach is doomed anyway,
        because so many shared libraries have different major version
        in distro X than in distro Y.
        And that such binary package distributors use flatpak, AppImage, etc.
        precisely to get out of this dilemma.

      - Building gcc and glibc might need some particular options.
        Such options can be documented without requiring a new triplet.

References:
[1] https://wiki.debian.org/ReleaseGoals/64bit-time
[2] https://wiki.gentoo.org/wiki/Project:Toolchain/time64_migration



