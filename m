Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CF23D0
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 22:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1681166207; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=a8GNGiZBrITNYjypoWzedj6M4wcRgR3kSyE9dtMrQ8gWy4wadGA/sBWO4L+l9AcP//
    BqBi8SmwWjTj+xuvfP0rVriVb6SMC5JYESgKfb3fFi0Csx6h+A5zPV7ullpB4WnmUG5s
    o9h5A6lbi1vVC9D1SzLHQJsRfQCqfQZmQKBNaaL/WrlmiDSklWb9GCuFVPwMZF59x3ud
    GeghL8j7RfSRjPkchVZq+t+mvaQEky5cRz/5NFtKpGa747fPw4RkQ9gWIARBmOFik9fV
    +KyeDRNqNaDZj8Q4ePF2Ow27yA9FNwaJdhkt6H863iE/2iwWtGAxDd/DJMSEMLvqJjB8
    zwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681166207;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=q63sH6uRabKwtAyIa3WeGJRM7YFHr4LSlIJ2hwe54kI=;
    b=sDDB359ujKNbDQ9aNVrvv4Ej4yasZuYS3hH+jMA3Xd40xbLCrmr+R38HN8SysBFpBp
    OiU3j5mwoEiK9xmMjk0FenFD4D/737dGyP1CBToQQSk8PuB7stBl34vyq4MXrWDPxO+A
    r4qZ9kdTaLDooVB/531l8f/76ufM5Y06qGCuuUBzYt9mk5T64vo2Dac9dHagBzXjEf6p
    knNeLVLPxKvux2i0PIEHIKEtQ/cCpW2mBNI1VdhzfsCFXv/y48MJG2hTl80toq1jOJvw
    7JxHc/ww5C0OTwaFkBC+20NX6sdYObv7fXVTwQ1+qq4lixbeWh8T+5gHx0TSR+GxvL2D
    ibCA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681166207;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=q63sH6uRabKwtAyIa3WeGJRM7YFHr4LSlIJ2hwe54kI=;
    b=Fg8/FNiEwW69O7+4wU/8jZJyrEF7NtXHQNjEuS2bIqGJ3kvoD7frG6/gT8GCkc8hab
    rxYwSppclHBXQySQ1q8BUPSl6mDWKmmG3dhDNiwfyrU2ou73K8WVmcZNQtSAidtCAOwP
    BxVL0C5aT3Fu8P9Qv9r2p2iXn1LsAdJWcWMmSLFrXe57OMVPgVWtAvJwDGhyaSyvGD0F
    jVCKn0giIpDq1KsK0ZZOYJ/Zt1+uu0MqwAuTdwbFMHy1B7CBzRr3YhgNoxMxhL+ownkK
    ZVtoS4vTTQoSINou4Lqg83gpAX3HwsnY9k5Kzg8vjx3IWhdU2Ysbk6Qd7wDGb7UVkuD5
    suuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681166207;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=q63sH6uRabKwtAyIa3WeGJRM7YFHr4LSlIJ2hwe54kI=;
    b=LMm06g9xjmZJV+MVDLias1vda4iZBYbMBTJA13vSJ6d0XzGsaT5OyQmTUzKBz9oGSF
    cPWn1NQHaZbHhIBK2CDw==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOR2qCFhc6P4zzpzNGh8xZkWtKSsw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id D064b6z3AMajbbv
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 11 Apr 2023 00:36:45 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: Zack Weinberg <zack@owlfolio.org>, =?ISO-8859-1?Q?P=E1draig?= Brady <P@draigbrady.com>, bug-gnulib@gnu.org, Paul Eggert <eggert@cs.ucla.edu>
Cc: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Date: Tue, 11 Apr 2023 00:36:45 +0200
Message-ID: <9797572.lZ1qq7WqSs@nimes>
In-Reply-To: <9636462e-920f-2e6e-3d2c-ec58e43021a2@cs.ucla.edu>
References: <6614772.670kD7asE2@nimes> <5343648.xEiunlC7Kx@nimes> <9636462e-920f-2e6e-3d2c-ec58e43021a2@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Paul Eggert wrote:
> > How about a middle ground between the two macros? A macro, say
> > AC_SYS_YEAR2038_UNLESS_OPT_OUT (*), that
> >    - like AC_SYS_YEAR2038, has the option --disable-year2038,
> >    - like AC_SYS_YEAR2038_REQUIRED, fails if a large 'time_t' is
> >      unavailable and --disable-year2038 was not specified.
> 
> Even simpler, let's have just one new macro instead of two. I.e., let's 
> change Autoconf to remove AC_SYS_YEAR2038_REQUIRED and to define instead 
> a macro AC_SYS_YEAR2038_OPT_OUT that acts like AC_SYS_YEAR2038 except it 
> errors out if wide time_t and --disable-year2038 are both missing.
> 
> Then let's propagate this change into Gnulib, and rename Gnulib's 
> year2030-required module to year2038-opt-out.

I like this. Thanks.

And if the package would very much like to assume a wide time_t and
therefore has some test suite failures if --disable-year2038 was specified,
so be it. It's better to be able to build a package at all, with some
test suite failures, than not being able to build it at all.

> Similarly for AC_SYS_LARGEFILE_REQUIRED.

For the sake of symmetry between the two, that makes sense.

Bruno



