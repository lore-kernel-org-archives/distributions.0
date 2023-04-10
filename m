Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF12F3F
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 21:42:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1681162969; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VO25oQQcqe9aHLZqzjpLXdSD+dRv3rI4SW8eO0aDrrI+4LioSgDi3vncvlvyYmTXs3
    ++z8biLIAhUm7d8Et02OSCLhxTuk3Ds0GZrjN3H48it7jM+mzf+UsV08BXo1tBb5tx48
    eqrEcVnf86Z3uNK4DdcBZZaFTGg1Vi4LfaNP47ySBh+QAjbDBwt4s/0bBXLn/LunX7HK
    vCakQkPWtoWxk0uh2ofLxnl9Mvgkn2h+Zstu2SAdd5KfwLGylnWgJFjpXuo85FANeM9N
    ouGM6T417vXEsQsq4pwAMTL2t8Bfu62l5CGQ5Hak3fh7s5bxi50Z1G51VSGfqTqkyYa3
    9cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681162969;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=FZNcxSYIqZZtPjiEhxw2p+Kj77w+9+13s690o6L+n1g=;
    b=l5Vll11BiEeh0soQxZs81NUXCtHSTzT46pSkv1n5jTHWG6eMr+/32/SnZpFNyr24jC
    GumvBVYJgrpiHtRkq6MUmEMJkyHf7MHSVNKitGddYS7EU9SRfrYkQ1DdpjMM+JQ2+j7d
    Oon1SjaC2Cx/L8DoZzTxbOBL1dwUb52QeLHspSkuLzZa6P/ePT8VkxwHe19gf8F+ooBn
    CLDZyov2/e+59TEq/hisQJV8I8SLavDREJdmLT8QJyVo1GcCZWug+e/qNe8ttwgCDjur
    s+Ri+jgSbj7jXql6yhiPd+1RTaUnl5K6jDyw0YwH7e84ACclWG6sHrePlco0IVGd8ZaL
    e+sg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681162969;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=FZNcxSYIqZZtPjiEhxw2p+Kj77w+9+13s690o6L+n1g=;
    b=ConCgHWFFj2wi9NepXYRXkPnRCs9u2v5onRKaQgbgjL1IYQb0u/sLnb8yYqdOG42Dq
    SIg5q0cgw5I8dPBefZas3d93MMB3LwlNfYokGP4aNsbvYuAyDC+QVDJshhidVYQG6XN3
    b2MrRzduCgKz+heCGZagvfKLD1qRtn/RE/6Eu5cwOpQAgp8tEwb4uLmBhxRYAP3GE5Ln
    oJ1Co2M/eJLYUdQeyunuiAfL3dgkM78JG+Cn7OgEoQBE3ceoYdAn2+VVZEmlq3eZWwfw
    pVbxx2FSVrkQn5Ei2IXwlS/TPsAmJfPw3U31ZsUgnmNTl6RuwnfDTdBqwk7716MX+QKr
    347Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681162969;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=FZNcxSYIqZZtPjiEhxw2p+Kj77w+9+13s690o6L+n1g=;
    b=yPbEDGTVt45XvdQfb0ksDN1y7cfp1sUi49FAbBwe99d28NebxjVg/436/by2Yt5HcP
    g2f/rHJtmPKICJSit2Aw==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOR2qCFhc6P4zzpzNGh8xZkWtKSsw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id D064b6z3ALgnbUl
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 10 Apr 2023 23:42:49 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: Zack Weinberg <zack@owlfolio.org>, =?ISO-8859-1?Q?P=E1draig?= Brady <P@draigbrady.com>, bug-gnulib@gnu.org, Paul Eggert <eggert@cs.ucla.edu>
Cc: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Date: Mon, 10 Apr 2023 23:42:48 +0200
Message-ID: <5343648.xEiunlC7Kx@nimes>
In-Reply-To: <c87cc7dd-4eb8-49a1-e27e-b5621909b617@cs.ucla.edu>
References: <6614772.670kD7asE2@nimes> <bffe78fa-dc4d-46e5-8c2d-27f7aaa7baac@app.fastmail.com> <c87cc7dd-4eb8-49a1-e27e-b5621909b617@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Paul,

Here's a suggestion for a compromise.

Recall that the macro AC_SYS_YEAR2038_REQUIRED is like AC_SYS_YEAR2038,
with two modifications:
  - It causes configure to fail if a large 'time_t' is unavailable,
  - It removes the configure option --disable-year2038.

How about a middle ground between the two macros? A macro, say
AC_SYS_YEAR2038_UNLESS_OPT_OUT (*), that
  - like AC_SYS_YEAR2038, has the option --disable-year2038,
  - like AC_SYS_YEAR2038_REQUIRED, fails if a large 'time_t' is
    unavailable and --disable-year2038 was not specified.

It would force the packager to pass --disable-year2038 if he
accepts the year-2038 problems.

It would not require additional documentation.

That would be OK with me.

Would it be OK with you?

Bruno

(*) Feel free to find a better name.



