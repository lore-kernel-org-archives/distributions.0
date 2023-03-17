Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE16ABD
	for <distributions@lists.linux.dev>; Fri, 17 Mar 2023 14:30:40 +0000 (UTC)
References: <87pm97325m.fsf@gentoo.org>
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: Re: Breakage with glib-2.76.0 (exposes bugs in buggy packages)
Date: Fri, 17 Mar 2023 14:29:35 +0000
In-reply-to: <87pm97325m.fsf@gentoo.org>
Message-ID: <87ilez30xe.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Sam James <sam@gentoo.org> writes:

> [[PGP Signed Part:Undecided]]
> Hi folks,
>
> glib-2.76 switches from using its own 'slice' allocator to using
> the system malloc instead.
>
> This ends up exposing various memory safety bugs in consumers
> of glib, including some XFCE software.
>
> So far:
> - openbox (https://bugzilla.icculus.org/show_bug.cgi?id=3D6669)
> - xfce4-session (https://gitlab.xfce.org/xfce/xfce4-session/-/issues/166)=
=20
> - xfce4-screensaver (https://gitlab.xfce.org/apps/xfce4-screensaver/-/iss=
ues/119)
> - thunar (https://gitlab.xfce.org/xfce/thunar/-/issues/1063)
> - gegl (https://gitlab.gnome.org/GNOME/gegl/-/issues/320)
> - girara (https://git.pwmt.org/pwmt/girara/-/issues/17)
> - tint2 (not yet reported upstream, https://bugs.gentoo.org/901775)
>
> See also:
> -
> https://bugs.gentoo.org/showdependencytree.cgi?id=3D901805&hide_resolved=
=3D0
> - https://gitlab.gnome.org/GNOME/glib/-/issues/2937
> - https://gitlab.gnome.org/GNOME/glib/-/issues/2941
>
> You can try see these issues with older glib by using Valgrind (which
> makes glib on older versions disable the slice allocator) or ASAN.

To be explicit, you can do this with <glib-2.76:
```
$ export G_SLICE=3Dalways-malloc
$ some-application
```

Or just valgrind in the usual way, etc.

> I anticipate there'll be quite a few more of these.
>
> best,
> sam
>
> [[End of PGP Signed Part]]


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZBR5jV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZAPlwD+Nk7wb7PJpBGfAieQRABrJAyxPcxAUKWQcRlD
b7xSym0A+gP5cC09TIxYVKcc60H4oqI+WIn7PccntO6hNmhvvfQD
=Bi1Z
-----END PGP SIGNATURE-----
--=-=-=--
