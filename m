Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8981FA1
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 17:07:31 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 24A1222CD2
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677863250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ng/eqct9gfz0FZCuSWGc5cD3E+DsSAV5O88pBehsRVA=;
	b=r0Ws3L7z1b0zA2XLUnWDpXAX/VoOeIjS518Jzo2SPuVEgdreb5p/fzN8ddq8etCC7xjjx1
	a7yLpmoLrjZwE/BsLFdU/wErHfn4Ug3voM+eGC9ECNfvumj5kdcwOiy/D5Fttl4L5p9aZz
	LtJOHWI2j9LSNXihL62wOG6fdjGCv8Y=
Received: from kukuk-phex.future.suse.de (unknown [10.162.233.67])
	by relay2.suse.de (Postfix) with ESMTP id 198202C141
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 17:07:30 +0000 (UTC)
Received: by kukuk-phex.future.suse.de (Postfix, from userid 358)
	id 01F5F648E6; Fri,  3 Mar 2023 18:07:29 +0100 (CET)
Date: Fri, 3 Mar 2023 18:07:29 +0100
From: Thorsten Kukuk <kukuk@suse.com>
To: "distributions@lists.linux.dev" <distributions@lists.linux.dev>
Subject: Re: Y2038, glibc and utmp/utmpx on 64bit architectures
Message-ID: <20230303170729.GA4300@suse.com>
References: <20230303104647.GA20891@suse.com>
 <3067bd0ec5134b039cdb8be9db8da8e5@DB6PR04MB3255.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3067bd0ec5134b039cdb8be9db8da8e5@DB6PR04MB3255.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)


Hi,

On Fri, Mar 03, A. Wilcox wrote:

> On Mar 3, 2023, at 4:46 AM, Thorsten Kukuk <kukuk@suse.com> wrote:
> > Hi,
> > 
> > I hope everybody is aware of the Y2038 problem. And not only for 32bit
> > architectures, but also 64bit architectures are not ready today, at
> > least not if they use glibc.
> > glibc uses for compatibility with 32bit userland applications 32bit
> > values for time_t and other variables even on 64bit systems.
> > Affected is everything around utmp/utmpx, wtmp/wtmpx and lastlog.
> > 
> > I wrote a blog about how to solve that for utmp/utmpx by using the data
> > from systemd-logind instead:
> > https://www.thkukuk.de/blog/Y2038_glibc_utmp_64bit/
> > 
> > A detailed analysis also for wtmp and lastlog, which have the same
> > problems, can be found here:
> > https://github.com/thkukuk/utmpx/blob/main/Y2038.md
> > 
> > 
> >   Thorsten
> > 
> > -- 
> > Thorsten Kukuk, Distinguished Engineer, Senior Architect, Future Technologies
> > SUSE Software Solutions Germany GmbH, Frankenstraße 146, 90461 Nuernberg, Germany
> > Managing Director: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
> > (HRB 36809, AG Nürnberg)
> 
> Hi Thorsten,
> 
> Please don’t require systemd for utmpx features.  It is not exactly
> accurate that musl does not support utmp.  The musl view is that utmp
> *in the libc* is insecure, but can be implemented securely using an
> external process.  That process is the utmps package that you found.  It
> does not require s6, other than skalibs (which is not a very heavy
> dependency at all).

Exactly what you write is what I wrote. musl libc itself does not
support utmp, but there is utmps.
So I don't understand your complain.

> What if I also told you that systemd itself is a replacement for
> `s6-ipcserver`? :)  All you need is a socket unit with Accept=Yes.  I
> could wire up an example Fedora container that you could play around
> with, using utmps and a custom built coreutils/util-linux against it,
> over the weekend if it would help sway anyone’s mind.

Not really, as I wrote in my blog. utmps does not solve all problems
with utmp/utmps and it's just another daemon doing the same things as
systemd-logind is already doing.

> I really don’t think it is appropriate to outright remove POSIX standard
> interfaces from Linux, replacing them with non-standard systemd APIs.

Nobody wants to remove the current utmp code (ok, not quite correct,
glibc developers plan to remove it from glibc, as it will stop working
in a few years) and feel free to convert all the code out there to use
the utmpx and not utmp interface.

> The number of packages that use utmpx are numerous and far beyond what
> you probably realise:

No, I know how many tools are using it and for what, look at the
document I did reference in my blog.

> * tcsh uses it for its custom lastlog primitive.

It's on the list.

> * AccountsService uses wtmp.

It's on the list, it just looks when a user did logout.
Your mistake: utmp is not wtmp.

> * net-snap uses it for exposing utmp information over MIBs.

Do you mean net-snmp? It's only using utmp to count the number of logged
in users. And as I explained in my blog, with utmp this number is very
likely even wrong.

> * Xterm, urxvt, etc use it to update information on logged in shells.

They use it to create fake logged in users for wall. And since Desktop
users hate to be spamed with wall messages on all ttys, tools try to be
clever and ignore such fake entries.
And if you use GNOME, tmux or anything else: they don't create fake
entries.

> * Python psutil package uses it to display status information.

It's on my list

> * SDDM display manager updates wtmp/utmp for logged in sessions.

It's all on the list.

> * lsof tool.

Not the version I have.

> * libutempter, which is used by tmux and Konsole to update utmp.

It's on the list.

> * X11VNC, OpenSSH, procps, sysklogd, sudo…

It's all on the list.

Next time please read everything, saves you a lot of time ;)

  Thorsten

-- 
Thorsten Kukuk, Distinguished Engineer, Senior Architect, Future Technologies
SUSE Software Solutions Germany GmbH, Frankenstraße 146, 90461 Nuernberg, Germany
Managing Director: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
