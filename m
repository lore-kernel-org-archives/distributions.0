Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC282560
	for <distributions@lists.linux.dev>; Wed,  8 Feb 2023 12:19:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1675857698; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Z6o3sD7ucwlR2Se/u6+ULxozzj93SXJOe5K6UtMjhJttilv7jZSI+oGAvuMOaq+mAZ
    kU44s0zkJQsDZj8crT+pIiJGqLc3m6fXBSbmiN8CdHAGIpTjMdE/yNB/t4Nuw58zp2qU
    iKYwwo8cXVSSIJgytcihu940vt1k24IQihZ4jEXf0USOfqzJibKKmmjC/FJJiR9tT0kg
    NWJtrB7Su85Tmu9mxJqo4Y4xf59x4ORKL2Z/Atgxry8JnZDkE09SQeSFhqnn4hunEJVU
    YxhUEN1DkI5Y5yF9yLo6JEYL4CaYpGqYAAqOlR/CNgYU9uqdUJ7DogGnz2G4Quh1gWZP
    nFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1675857698;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=l8kJtH60Ws8PvFvYsDCwyfYorRjaVoPQJG9wl+baBoA=;
    b=sURiokGQ8k4jFS0o4sqPKIfOvhPQHNDPMnciAlYsok21i9JnMJkROMq1qIVQ96CbkK
    Ut9fDkrhg1C0SBIPghKzGS+jW7D3UUUGTKS4h2ehJ46abghzIdC5wOIx58x0BnlOn2Kt
    pCjEpw+kSZiUYefSD8PAZVcL6v02Ou+xyooXS6wgc37gCBz2xUq0wlXu6h38z61AtWJa
    kxz906Q8/uOQqJ1JwJ3TTu1qLznHSoDntqSDsc+Dp7XMsOslH4WECYMyDB2+S7ykcj31
    +IDxTTbd9YfIHAUsW7hT1NmbpX0O99oIfpORkb4Ar77VYyvXoga3VIQVFYkUVGTtKFjd
    s28w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1675857698;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=l8kJtH60Ws8PvFvYsDCwyfYorRjaVoPQJG9wl+baBoA=;
    b=HTPPQfEa6a6Jp+rvqWdP/FxbshRWhaoVRYxLle9enIQWmjpR0ih0IXdAwpUHlv1ld0
    mkYM/P72mvyGshcEI4FmAY2gnmbDrhR/mlBriffbmzZ7JlFk0zogk/0B3ZzO4q5zoTzJ
    77EKvWI+2ZoIJUyaFxF+FB1aw+/KWkgbx/QDjyfnfpYP9vTWMv187uA61fyg+2kwcBPK
    ky0ApGNWCHOjT/RgrMiuFqgPHEkMisqc+AXe9OKz+X/calGPk7e68gzvKinbXqmkRJP4
    h/c/o5r/UAJB4so8KRsTWHhgcpjeMKYXS8RDpoLdAREZMTYNx1dg6KoTjkB2aY0oUNpx
    Km5A==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOT3Pf3uuFFBtaxzk2sKhQlmEEvrw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.3.0 AUTH)
    with ESMTPSA id f83259z18C1c8rh
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 8 Feb 2023 13:01:38 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: distributions@lists.linux.dev, "A. Wilcox" <AWilcox@wilcox-tech.com>
Subject: Re: ISO C23 removal of unprototyped functions
Date: Wed, 08 Feb 2023 13:01:37 +0100
Message-ID: <3651423.PdnHiajgbn@nimes>
In-Reply-To: <199D8658-C6E9-434F-8F5D-B0D79A86080C@Wilcox-Tech.com>
References: <2354211.7hzS34FegO@nimes> <199D8658-C6E9-434F-8F5D-B0D79A86080C@Wilcox-Tech.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

A. Wilcox asked:
> What is the minimum version of GCC to detect this?
> 
> Is there a warning flag that could pick it up before this commit was
> introduced?
> 
> Is the only released compiler that can warn on this Clang 15?[1]

As far as I understand from [1][2]:

The way to get exactly the pertinent diagnostics is to use clang 15
with options
  -std=c2x -Wincompatible-function-pointer-types
and look at all errors and warnings.

If one uses clang 15 with options
  -std=c17 -Wdeprecated-non-prototype
and looks at all warnings, one gets most, but not all, of the needed
diagnostics.

If one uses GCC 12, there are not the appropriate warning options. [2]

Bruno

[1] https://discourse.llvm.org/t/unresolved-issues-from-the-llvm-15-x-release/66071/34
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108694#c2



