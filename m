Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B04B8DDF
	for <distributions@lists.linux.dev>; Wed,  1 Jul 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909126; cv=pass; b=L+a+yhlvt1zqJAJAvTglsNn847CwilujSfii/5WdBazoDK8Wts9Cfk0p9qjVLSmoQxGvRYLG5t5ptB1aEqJwS6XQANEK9uBaLkMe1VNHU2sN+PLt0OGXMzjoOkRkYnyRQWCZYF/WBJ+8jEjwGIUA6noMgaGRkgLt/ssFpOrUwVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909126; c=relaxed/simple;
	bh=Hl8jI7LmIFgASAdyQ7Wp8iuWP0OwqqDrweT8DK5hTeU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=EMzWQR4eFPVfL21PT4hOm9LZjD6KRao3FdUu0Ty0JFTX0B1rqtSJi4bWI3PZd7gVjLN2nFB4iKeMyNfkQrU3jG+RHMLxfBo4QGfm9dEivU42CE9SuUgx/ZzDE5jI/08s+50kZPvkEME+YicNi5fU9bBBlAChbCOOUAX9MyuaCCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kev009.com; spf=pass smtp.mailfrom=kev009.com; dkim=fail (0-bit key) header.d=kev009.com header.i=@kev009.com header.b=OYqpuCXj reason="key not found in DNS"; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kev009.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kev009.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=kev009.com header.i=@kev009.com header.b="OYqpuCXj"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c0c45c580so3553601cf.0
        for <distributions@lists.linux.dev>; Wed, 01 Jul 2026 05:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782909123; cv=none;
        d=google.com; s=arc-20260327;
        b=Pnr46W6hAWZOzOrdWx9bAI9fgUvnduX3aEwzYCUQxl7jI8MkiuV3pvJhhOs+QDMipe
         KvkhgVfnGY5f4XxzkDpewW+i5F5Jgw9wSMaNN/UW6nOvWhi2VszWRHxIejvPEH60LJqt
         YERwMpJIgLdQJ9jF/FW5TQMs7bUXwYHUJV+KacoXsplyyPhlUZ6m3l5rQia8kgFbSdNr
         mX/3lgqVc9/lqIEzlGwGEif1dfifXPNWt0QTb6L/qL7GS25s9C46eBZ8huhPB3K/0/Qe
         tFw4J1usY1/qQ075dKMtQjnShLOhD25vkQKA1rYr7La3/hzxP7YFCJtICaWzy9QVXny2
         vrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Hl8jI7LmIFgASAdyQ7Wp8iuWP0OwqqDrweT8DK5hTeU=;
        fh=zb5l3nqDsRxIUHRLxsAB5P9+e7j+bTDttUzRzFU7AeA=;
        b=AaSKCYFm2Ur3puGUlyvzyrGqfmEEsxpA9HrCTpbp1+rY51H7Hs64RPQwNzeCJpCDsk
         sOYbBCljbB763567+H1d4i/w2/M52gaOlA+7RLE/hbgGk5DYFe1y6dhdN0KFFCxYYLB7
         hzEBHbcUW4sPfWNuX/GGxOV0xTP3EbD0K3GKbpAvVbkjiwCzwCngLLvqNJNP9Q2Y/xgg
         nX376kQsL/zH3CC7hR2xPw2iSTU2K9W/oYsWX4EI01lYNHFc8giGyZZASeb6RMUzW7CZ
         EouszuzUZDG/e3inNahlrFSrmViWQVzMZTv30DSq4QuDDk42PTLnx2w3naosKzBOtyBD
         /vWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kev009.com; s=google; t=1782909123; x=1783513923; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hl8jI7LmIFgASAdyQ7Wp8iuWP0OwqqDrweT8DK5hTeU=;
        b=OYqpuCXjR3d/WZ/tqoo8C2Qm+MI/6FJ+vaTHAjo8irCWcoaTZ+BCNGsGzsEWlnZh2J
         mnI/mzIg11Dl2qduf3rzuXoWSLMIF24ECw4kjiGWia+hBSjbMkOLtKonscKU+RnpfKG9
         rlRfj1UAPgPF3P3+Lsaxl3d/bQrgO1pklu74E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909123; x=1783513923;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl8jI7LmIFgASAdyQ7Wp8iuWP0OwqqDrweT8DK5hTeU=;
        b=WYZSVM8TKMUUYvAKMpkaDMcnWqT4SQ+MAgdCqghcGerhAimoIdDXvwuGesy7xgrCtz
         bs/tMMGnbrMDW0BqRe2Q1rrxfLIl5rPAe62hzGhXDpufOkQR0Ljxzi1kBVZt4v5gvWNe
         u96IbqI3slrQxHqftGcuouY0/OOHUvXbCnYTGXKZfa0k/hklttIfXlCLbSFOQvdzNnN0
         1w98q4XRgt4kwnLOftxXoRScLuJH4Ozzke2z4fzJwRidm8jSZmIqFwHJiYK91lDxsYuG
         9FSospT3u/Ht7q3sXlt68ymbfVdOOgWVCXKI/+e6Qs+INftGzZuN3HIfix2EFpAVr2+8
         OSAA==
X-Gm-Message-State: AOJu0Yz8fOP/q4v9JwfsIICEOfz9BG3148TlUw8foCqWP4A029ZM6y2T
	Z1oXnnA4iqnhhBIlQtt8rNpg/4LwQjnebSCY4fLD59BRaD+rTozDQVg0A6DQSORyzeexo0z1ilu
	zirLOlVJ6O2Opp7wVqT8zOKZYzxZvs898qyJlxwoXizQAAB3l4mdMJ5lP
X-Gm-Gg: AfdE7clh+X9lGLYLKtejyPaM7Y/XDHKHYdCbDR0Mj/V7K1s+TL4CfPBU9LHFGOI2XIh
	zAa7acfcIvnSmt+n0vUtyDbVShz9dpsNOufNFz/wKZhXKebcxEmQB+6kLmkRF46GOsVN+b0Ig2n
	hLv8gIQFYwRz85Wv06nGuhATwZ1j1bgXlxgmNN+RGiYZBu2mTOri8thaUo9oPlVibruZ8nfjitT
	ymhEhJlmfAN9aEIg4QWybUzTzBqoy2Zk1Dybvt1EmrDRlzThDs050CC/Qpz1tZ+bsVtlgUlVdWK
	DGbYhvK/t0SZE9WIK2NKYKKlePKO+7GY9Ej/W3zRNzYVkGpJlYzFQrDEdinvgw/W9Dr6N4gJQTN
	vVJJx5KNsmrX06vYVPvknIvolvzjkpXHxd515U5g=
X-Received: by 2002:a05:622a:1812:b0:51b:fe30:b8bf with SMTP id
 d75a77b69052e-51c26b14390mr19146441cf.35.1782909123369; Wed, 01 Jul 2026
 05:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Kevin Bowling <kevin.bowling@kev009.com>
Date: Wed, 1 Jul 2026 05:31:52 -0700
X-Gm-Features: AVVi8CdIIGORoN6-Ntx2eT64QI2IkzNwL08uiGO0OEUKHJZsnrKFGG_7g1M7NTU
Message-ID: <CAK7dMtBrD2qx=NadEqZcq_5MZpOaXY=btW5A-JZLNp8T-LnyXQ@mail.gmail.com>
Subject: libevent 2.1.13-stable
To: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

https://github.com/libevent/libevent/releases/tag/release-2.1.13-stable
(and https://github.com/libevent/libevent/releases/tag/release-2.2.2-alpha)
are primarily security releases and a re-priming the release process.

Changes in version 2.1.13-stable (01 July 2026)

This release contains several security fixes, affecting users of the
following modules: evbuffer, bufferevent, evtag, evrpc, evdns, evhttp.
If you have a program that uses one of those modules,
or if you distribute libevent, you should upgrade.

Additionally, this release backports some small modernizations to
the libevent codebase, to aid in compiling with the compilers
released over the last few years.

Security Fixes (evtag, evrpc):

Fix an out-of-bounds read in decode_tag_internal.
(Found by @Brubbish. GHSA-fj29-64w6-73h6)
Fix an integer overflow in evtag_unmarshal_header.
(Found by @Brubbish. GHSA-45c6-qx49-89m8)

Security Fixes (evhttp):

Discard HTTP trailers, to prevent header smuggling attacks.
(Found by @sebastianosrt. GHSA-2gmv-p5m7-98p6)
Restrict HTTP header parsing to prevent request smuggling.
(Originally reported by @xclow3n; and then by @kodareef5,
@nstaller0490, @AsafMeizneer, and @yaotushaozhu.
GHSA-q39v-w2g7-gr8j.)
Treat CRLF and %00 more strictly in HTTP headers, to prevent
parser mismatch attacks.
(Reported by @xclow3n and @AsafMeizner. See GHSA-q39v-w2g7-gr8j,
GHSA-jcwh-pvf2-73p2.)
Fix a heap out-of-bound write that could occur when using
AF_UNIX sockets and compiling libevent with -DNDEBUG.
(Found by @mat-mo. GHSA-cvq5-vrvr-j338)

Security fixes (evbuffer, bufferevent):

Fixed a dangling pointer in evbuffer_add_reference.
(Found by @DarkaMaul. GHSA-c2pj-cg4r-88c8)

Security fixes (evdns):

Fix an out-of-bounds write in dnsname_to_labels
when building a DNS response of 2^16 bytes.
(Found by @sectroyer. GHSA-58rx-7448-jw47)

Security fixes (example code):

Avoid using strcpy() in sample/http-server.c.
(Reported by @sectroyer. GHSA-5rgj-2c58-7jrc.)

Other fixes:

Backport fixes for numerous compiler warnings.
Backport fixes for compilation with openssl 3 and later.

Regards,
Kevin Bowling (co-maintainer)
