Received: from mail.wilcox-tech.com (mail.wilcox-tech.com [45.32.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA911FA1
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 16:58:39 +0000 (UTC)
Received: (qmail 28314 invoked from network); 3 Mar 2023 16:51:55 -0000
Received: from localhost (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@127.0.0.1)
  by localhost with ESMTPA; 3 Mar 2023 16:51:55 -0000
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Y2038, glibc and utmp/utmpx on 64bit architectures
Date: Fri, 3 Mar 2023 10:51:54 -0600
References: <20230303104647.GA20891@suse.com>
To: Thorsten Kukuk <kukuk@suse.com>,
 distributions@lists.linux.dev
In-Reply-To: <20230303104647.GA20891@suse.com>
Message-Id: <7938DE1F-C31A-470F-A7CA-60DD8749C4B8@Wilcox-Tech.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)

On Mar 3, 2023, at 4:46 AM, Thorsten Kukuk <kukuk@suse.com> wrote:
> Hi,
>=20
> I hope everybody is aware of the Y2038 problem. And not only for 32bit
> architectures, but also 64bit architectures are not ready today, at
> least not if they use glibc.
> glibc uses for compatibility with 32bit userland applications 32bit
> values for time_t and other variables even on 64bit systems.
> Affected is everything around utmp/utmpx, wtmp/wtmpx and lastlog.
>=20
> I wrote a blog about how to solve that for utmp/utmpx by using the =
data
> from systemd-logind instead:
> https://www.thkukuk.de/blog/Y2038_glibc_utmp_64bit/
>=20
> A detailed analysis also for wtmp and lastlog, which have the same
> problems, can be found here:
> https://github.com/thkukuk/utmpx/blob/main/Y2038.md
>=20
>=20
>   Thorsten
>=20
> --=20
> Thorsten Kukuk, Distinguished Engineer, Senior Architect, Future =
Technologies
> SUSE Software Solutions Germany GmbH, Frankenstra=C3=9Fe 146, 90461 =
Nuernberg, Germany
> Managing Director: Ivo Totev, Andrew Myers, Andrew McDonald, Martje =
Boudien Moerman
> (HRB 36809, AG N=C3=BCrnberg)

Hi Thorsten,

Please don=E2=80=99t require systemd for utmpx features.  It is not =
exactly
accurate that musl does not support utmp.  The musl view is that utmp
*in the libc* is insecure, but can be implemented securely using an
external process.  That process is the utmps package that you found.  It
does not require s6, other than skalibs (which is not a very heavy
dependency at all).

What if I also told you that systemd itself is a replacement for
`s6-ipcserver`? :)  All you need is a socket unit with Accept=3DYes.  I
could wire up an example Fedora container that you could play around
with, using utmps and a custom built coreutils/util-linux against it,
over the weekend if it would help sway anyone=E2=80=99s mind.

I really don=E2=80=99t think it is appropriate to outright remove POSIX =
standard
interfaces from Linux, replacing them with non-standard systemd APIs.
The number of packages that use utmpx are numerous and far beyond what
you probably realise:

* tcsh uses it for its custom lastlog primitive.

* AccountsService uses wtmp.

* lynx uses it.

* net-snap uses it for exposing utmp information over MIBs.

* Xterm, urxvt, etc use it to update information on logged in shells.

* Python psutil package uses it to display status information.

* SDDM display manager updates wtmp/utmp for logged in sessions.

* lsof tool.

* libutempter, which is used by tmux and Konsole to update utmp.

* X11VNC, OpenSSH, procps, sysklogd, sudo=E2=80=A6

These are just the packages we have in Ad=C3=A9lie, and we are a small
distribution, which is also built on musl libc and has full utmpx
support.

It is much better to provide a secure way for the standard POSIX utmpx
header, than try to replace it and add all those conditionals to all
those packages.  Remember that in addition to distros that don=E2=80=99t =
have
systemd, there are other systems (BSD, Illumos, even Mac OS for some of
those) that will never have logind APIs, so you are asking all those
packages to special-case glibc Linux=E2=80=A6

Best,
-A.

--
A. Wilcox (they/them)
SW Engineering: C/C++, DevOps, POSIX
Wilcox Technologies Inc.

