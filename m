Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB796A938
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 22:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1677881509; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hpQre4C9y4wn9c9lKmn981fw2k+IXkUsF6uE66/lNizTF6iUGjIioHzgIgF9L50lX/
    NhcDZaQZxYVwiEUjsqamtMpmvjpS7MhApvw3jvt7ZM/haEEHjeoZdAZluURHOckB2O90
    CN9GGkYe4mcp8Oos3pX7/MqkozrxooHwxt4Y7A6YsB9JFM7B5LJ3TSszon6BNDNEyiMx
    jQCP6P99WZBf67S3usF71oXZ8KD+HKakJafzt3ALRNHmWIESnVc3mFlUHMve5FZZHify
    5n0eA2MeZu+JrfEOxtd+2kqVbjCiKhUF5j4PlJ7nZBBsZkpUMRxBjMVcnLb+CmulG5yu
    djgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1677881509;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ViJjHv07+EHeoTimrRZv+ChzHMtxMYe009kHjDbNVwQ=;
    b=hHpPIxO7PQqG7Xagd76WDvuW1fERAxXZaq/f3Pt/B3HCvDPC2kfJ6XxdWtiKprg9bs
    wsE7wCybd2Arxk1e8XVAW9qsVOryP3P2M90vm0uwWc8ksQYsONJzrnJ+BH3RQNFqkzga
    wi4ypcMj3g9A1pTCtqx0OJlpjqPjH6OEY2enD2Z0UoAlMdegv63d2RdZgrb5kj72msTg
    Or3JU7Di4PFWDzjTuEvDZX5J9N6zWfBXiFis4lATbnuOPx9ZPrS9yimB6GnwM8t7RQ97
    r3empsHT5rwp5OEi4/JjDi0VJiEkFBgeBOUl+j63pN77Qzv0ABQW27CeRfot5XYBQ8TS
    4HIg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1677881509;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ViJjHv07+EHeoTimrRZv+ChzHMtxMYe009kHjDbNVwQ=;
    b=SEtlJKNxVJFxMrY3z7cpAjgQyfKsfrvkgFap55iO/rrHMDQNYipKW3JKonbxeoOpFx
    3SX1McbVNmols2Kgl6VAFndYy3hJTF3i2FuW8oUBjniVCSe0bGjsogMLtpJQ99kImMS3
    hipf5wi61iQOYcCxM24dZQqq9VrMhrzNFQ7IN/Ro+W1t71YCn59oKfjKBtBCStDATg/J
    A7mmYLtFMX5PM2fWeabJChgiBPM+qwuGJPytAxtQUr7OzhXy1cVci/YHWLrmprJ0hiwu
    kum490L3NIN6arxqDN+ueoJxpwtHyTJHsI8Th5tI5QNQNEMp8OLUX/6cXS1ckP0azERs
    9hNg==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpPAjffPEe8kXgv4Zw4zff4g9E7hUg=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.3.0 AUTH)
    with ESMTPSA id Yddb27z23MBnRDC
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 3 Mar 2023 23:11:49 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: distributions@lists.linux.dev, Thorsten Kukuk <kukuk@suse.com>
Cc: Eric Blake <eblake@redhat.com>
Subject: Re: Y2038, glibc and utmp/utmpx on 64bit architectures
Date: Fri, 03 Mar 2023 23:11:49 +0100
Message-ID: <2900303.CPfdCl3LZh@nimes>
In-Reply-To: <20230303205500.GA13773@suse.com>
References: <20230303104647.GA20891@suse.com> <c420abff6abd43cabac8c2fa5d812091@DB6PR04MB3255.eurprd04.prod.outlook.com> <20230303205500.GA13773@suse.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Thorsten Kukuk wrote:
> > Do the glibc developers plan to remove the utmpx
> > interface as well (together with utmp interface)?
> 
> In glibc, utmpx is just an alias for utmp.
> 
> > If yes, then
> >   - What is the point of your suggestion to "use the utmpx and not utmp
> >     interface", above?
> 
> utmps only supports the utmpx interface, not utmp. So if you want to use
> utmps, you need to convert all source code to utmpx.

Thanks for the explanations. It's clear now.

> >   - Since there is no "FUTURE DIRECTIONS" in POSIX
> >     https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/endutxent.html
> >     will the utmpx interface get deprecated in POSIX, or stay as it is?
> >     Is the Austin Group already involved?
> 
> Linux is not POSIX conform, never was and there was never the plan to
> become, but it tries to be as compatible with POSIX as possible where
> it makes sense. If it does not make sense, POSIX will not be used. You
> should be able to find several examples in glibc, where interfaces
> derivate slightly from POSIX because the POSIX interface didn't made any
> sense.
> Parts of POSIX are really old (don't know how old utmp/utmpx are, but
> they did exist already since a long time before I started to work
> with Unix, and that's really a long time ago) and things are changing.
> Today, utmp/utmpx create more problems then it solve. Many features of
> it where never used on Linux or are meanwhile no longer used, at least
> not with systemd.
> There is just no benefit from it anymore. ...

I don't disagree with that.

Just that, as part of keeping Linux + glibc as close a possible to POSIX
over the long term, when we remove a feature from glibc that is POSIX-
standardized, we should also remove (or at least mark as LEGACY) this
part from POSIX. POSIX evolves, partially based on our inputs. I don't see
the deprecation of [1][2] on the Austin Group's agenda so far [3].

Bruno

[1] https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/basedefs/utmpx.h.html
[2] https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/endutxent.html
[3] https://www.austingroupbugs.net/view_all_bug_page.php



