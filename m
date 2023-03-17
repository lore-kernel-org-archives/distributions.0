Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA56AB6
	for <distributions@lists.linux.dev>; Fri, 17 Mar 2023 14:04:17 +0000 (UTC)
User-agent: mu4e 1.8.14; emacs 29.0.60
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: Breakage with glib-2.76.0 (exposes bugs in buggy packages)
Date: Fri, 17 Mar 2023 14:00:43 +0000
Message-ID: <87pm97325m.fsf@gentoo.org>
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

Hi folks,

glib-2.76 switches from using its own 'slice' allocator to using
the system malloc instead.

This ends up exposing various memory safety bugs in consumers
of glib, including some XFCE software.

So far:
=2D openbox (https://bugzilla.icculus.org/show_bug.cgi?id=3D6669)
=2D xfce4-session (https://gitlab.xfce.org/xfce/xfce4-session/-/issues/166)=
=20
=2D xfce4-screensaver (https://gitlab.xfce.org/apps/xfce4-screensaver/-/iss=
ues/119)
=2D thunar (https://gitlab.xfce.org/xfce/thunar/-/issues/1063)
=2D gegl (https://gitlab.gnome.org/GNOME/gegl/-/issues/320)
=2D girara (https://git.pwmt.org/pwmt/girara/-/issues/17)
=2D tint2 (not yet reported upstream, https://bugs.gentoo.org/901775)

See also:
=2D
https://bugs.gentoo.org/showdependencytree.cgi?id=3D901805&hide_resolved=3D0
=2D https://gitlab.gnome.org/GNOME/glib/-/issues/2937
=2D https://gitlab.gnome.org/GNOME/glib/-/issues/2941

You can try see these issues with older glib by using Valgrind (which
makes glib on older versions disable the slice allocator) or ASAN.

I anticipate there'll be quite a few more of these.

best,
sam

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZBRzVl8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZDufwEAj09igY0PU3JeFmGqAfaE44T2CUVb32nr/v/Z
yfm+kNoA/38RPUwJJMN0gilztBErf2WZWnkPpG3ytOSKFE+cLU4L
=e/dG
-----END PGP SIGNATURE-----
--=-=-=--
