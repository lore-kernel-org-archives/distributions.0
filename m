Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290813222
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 20:55:02 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 1DFD91F74B
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677876901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odfDkx1R33CrH4pqusOUf4hcgYBtCSAASjZ5SgHkLrE=;
	b=Q6nnuUmeJ00+iBRxnvIz7R+zF+3Kp5wxsbUXoIsag9T/MYqKKl2I6GysbhJFA1oUFqPPxE
	9977gZ7y30XETvMa8DIxRWuVpiOyT4vs1y1RoYyFKYMGxaPn0qTaGyBJXczQ/YiDKGGSEY
	w5xorXNorcRwfobE+CvEACT79fTnbDE=
Received: from kukuk-phex.future.suse.de (unknown [10.162.233.67])
	by relay2.suse.de (Postfix) with ESMTP id 149CA2C141
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 20:55:01 +0000 (UTC)
Received: by kukuk-phex.future.suse.de (Postfix, from userid 358)
	id F3ACE64919; Fri,  3 Mar 2023 21:55:00 +0100 (CET)
Date: Fri, 3 Mar 2023 21:55:00 +0100
From: Thorsten Kukuk <kukuk@suse.com>
To: "distributions@lists.linux.dev" <distributions@lists.linux.dev>
Subject: Re: Y2038, glibc and utmp/utmpx on 64bit architectures
Message-ID: <20230303205500.GA13773@suse.com>
References: <20230303104647.GA20891@suse.com>
 <3067bd0ec5134b039cdb8be9db8da8e5@DB6PR04MB3255.eurprd04.prod.outlook.com>
 <20230303170729.GA4300@suse.com>
 <c420abff6abd43cabac8c2fa5d812091@DB6PR04MB3255.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c420abff6abd43cabac8c2fa5d812091@DB6PR04MB3255.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 03, Bruno Haible wrote:

> Thorsten Kukuk wrote:
> > > I really don’t think it is appropriate to outright remove POSIX standard
> > > interfaces from Linux, replacing them with non-standard systemd APIs.
> > 
> > Nobody wants to remove the current utmp code (ok, not quite correct,
> > glibc developers plan to remove it from glibc, as it will stop working
> > in a few years) and feel free to convert all the code out there to use
> > the utmpx and not utmp interface.
> 
> I don't understand: Do the glibc developers plan to remove the utmpx
> interface as well (together with utmp interface)?

In glibc, utmpx is just an alias for utmp.

> If yes, then
>   - What is the point of your suggestion to "use the utmpx and not utmp
>     interface", above?

utmps only supports the utmpx interface, not utmp. So if you want to use
utmps, you need to convert all source code to utmpx.
I did not recommend to use utmpx as this is with glibc identical with
utmp with exact the same problems.

>   - Since there is no "FUTURE DIRECTIONS" in POSIX
>     https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/endutxent.html
>     will the utmpx interface get deprecated in POSIX, or stay as it is?
>     Is the Austin Group already involved?

Linux is not POSIX conform, never was and there was never the plan to
become, but it tries to be as compatible with POSIX as possible where
it makes sense. If it does not make sense, POSIX will not be used. You
should be able to find several examples in glibc, where interfaces
derivate slightly from POSIX because the POSIX interface didn't made any
sense.
Parts of POSIX are really old (don't know how old utmp/utmpx are, but
they did exist already since a long time before I started to work
with Unix, and that's really a long time ago) and things are changing.
Today, utmp/utmpx create more problems then it solve. Many features of
it where never used on Linux or are meanwhile no longer used, at least
not with systemd.
There is just no benefit from it anymore. But on the other side, all the
problems with utmp/utmpx stay. Like the need for applications with
special rights to write to that file, which is security wise a
nightmare. Especially if that is an X11 application.
Or the format, a string can be nul terminated, or be as long as the
field. It's a nightmare to parse such entries in a secure way and often done
wrong.
Or the limitation of the length of the username, which creates regular
bug reports by users, which don't understand this limitation. Which is
only there because of utmp, the full rest of the system does not have
such a limitation of the username.

If somebody really needs a POSIX conform utmpx implementation for Linux:
I'm pretty sure that it is no problem to create a library where the
functions fetches the data from logind and not a file, like utmps is
doing. But he need to be aware: such an interface will introduce all the
useless limitations and problems of utmp/utmpx again.

  Thorsten

-- 
Thorsten Kukuk, Distinguished Engineer, Senior Architect, Future Technologies
SUSE Software Solutions Germany GmbH, Frankenstraße 146, 90461 Nuernberg, Germany
Managing Director: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
