Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6209A610A
	for <distributions@lists.linux.dev>; Mon,  6 Feb 2023 20:28:16 +0000 (UTC)
From: Sam James <sam@gentoo.org>
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3E220EBA-99CE-495A-B068-C818D21A0589";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Fwd: OpenPGP interoperability issues with gnupg >= 2.4
Message-Id: <F30D6590-3E0C-4865-A944-7DE118A619CF@gentoo.org>
References: <Y+FiAeD5eiuC0tMX@hmbx>
To: distributions@lists.linux.dev
Date: Mon, 6 Feb 2023 20:27:57 +0000
X-Mailer: Apple Mail (2.3731.300.101.1.3)


--Apple-Mail=_3E220EBA-99CE-495A-B068-C818D21A0589
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E156C011-E5F5-47B1-88A3-02D18F69524B"


--Apple-Mail=_E156C011-E5F5-47B1-88A3-02D18F69524B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Begin forwarded message:
>=20
> From: David Runge <dvzrv@archlinux.org>
> Subject: OpenPGP interoperability issues with gnupg >=3D 2.4
> Date: 6 February 2023 at 20:24:27 GMT
> To: tmz@pobox.com, ncopa@alpinelinux.org, tbier@posteo.de, =
sam@gentoo.org, demm@kaosx.us, mail@jann-roeder.net, cho-m@tuta.io, =
fpletz@fnordicwalking.de, rahul@gopinath.org, tpgxyz@gmail.com, =
jan.christian@gruenhage.xyz, dkg@fifthhorseman.net, eric@debian.org, =
xtkoba@gmail.com, dleuenberger@suse.com, adridg@freebsd.org, =
jjelen@redhat.com, anthraxx@archlinux.org
>=20
> Hi all,
>=20
> I am one of the package maintainers of gnupg on Arch Linux.
> DISCLAIMER: Since December 2022 I am also a contracted developer for =
the
> Sequoia project (an alternative implementation of the OpenPGP standard
> in Rust).
>=20
> We (Levente Polyak and I) are writing to you because you are the
> maintainers of gnupg on other downstream distributions.
> With gnupg 2.4.0 a change has been merged [1], which has gpg operate
> with certificate material in a way that is incompatible with the
> upcoming IETF approved "crypto-refresh" approach.
> This means, that e.g. messages encrypted using a key generated with
> gnupg >=3D 2.4.0 will not be compatible with OpenPGP implementations
> following the upcoming IETF standard.
>=20
> While this has especially integrators such as Thunderbird [2] and
> keyserver authors worried, it is also a concern for us as a downstream
> distributor of gnupg.
> Some of you have already updated gnupg to >=3D 2.4.0 in some form, but =
we
> would like to take the time and open the discussion on this topic, as =
we
> believe that the change is harmful to the larger OpenPGP ecosystem.
>=20
> We are currently still shipping 2.2.x due to (only now resolved) =
issues
> with our distribution keyring. However, we are wondering how to =
proceed
> with gnupg in the future, as it will also negatively affect the trust
> model of our own distribution.
>=20
> Several scenarios seem likely (depending on adoption):
>=20
> * notifying users of upcoming incompatibilities if they create a key
>  with gnupg >=3D 2.4.0
> * shipping/ using gnupg 2.2.x alongside (or exclusively) for as long =
as
>  possible
> * undoing the change in gnupg
>=20
> We would like to raise awareness and gather some feedback of current
> packagers of gnupg to form a broader response to this issue.
>=20
> As mail threads with large To: headers might get very tedious for
> discussing this topic, we would also like to invite you to
> #openpgp-interop on libera.chat [3].
>=20
> Best,
> David and Levente
>=20
> P.S.: The addressed persons have been gathered via links to downstream
> source data on repology.org [4]. In case we have missed anyone (very
> likely), that should join the discussion, please feel free to forward
> this e-mail to them.
>=20
> [1] =
https://lists.gnupg.org/pipermail/gnupg-devel/2022-December/035183.html
> [2] =
https://lists.gnupg.org/pipermail/gnupg-devel/2023-February/035270.html
> [3] ircs://irc.libera.chat/openpgp-interop
> [4] https://repology.org/project/gnupg/versions
>=20
> --
> https://archlinux.org


--Apple-Mail=_E156C011-E5F5-47B1-88A3-02D18F69524B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><br><blockquote type=3D"cite"><div>Begin =
forwarded message:</div><br class=3D"Apple-interchange-newline"><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px;"><span style=3D"font-family: -webkit-system-font, =
Helvetica Neue, Helvetica, sans-serif; color:rgba(0, 0, 0, =
1.0);"><b>From: </b></span><span style=3D"font-family: =
-webkit-system-font, Helvetica Neue, Helvetica, sans-serif;">David Runge =
&lt;dvzrv@archlinux.org&gt;<br></span></div><div style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;"><span =
style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);"><b>Subject: </b></span><span =
style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif;"><b>OpenPGP interoperability issues with gnupg &gt;=3D =
2.4</b><br></span></div><div style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px;"><span style=3D"font-family: =
-webkit-system-font, Helvetica Neue, Helvetica, sans-serif; =
color:rgba(0, 0, 0, 1.0);"><b>Date: </b></span><span style=3D"font-family:=
 -webkit-system-font, Helvetica Neue, Helvetica, sans-serif;">6 February =
2023 at 20:24:27 GMT<br></span></div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px;"><span =
style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);"><b>To: </b></span><span =
style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif;">tmz@pobox.com, ncopa@alpinelinux.org, tbier@posteo.de, =
sam@gentoo.org, demm@kaosx.us, mail@jann-roeder.net, cho-m@tuta.io, =
fpletz@fnordicwalking.de, rahul@gopinath.org, tpgxyz@gmail.com, =
jan.christian@gruenhage.xyz, dkg@fifthhorseman.net, eric@debian.org, =
xtkoba@gmail.com, dleuenberger@suse.com, adridg@freebsd.org, =
jjelen@redhat.com, =
anthraxx@archlinux.org<br></span></div><br><div><div><div =
class=3D"content-isolator__container">Hi all,<br><br>I am one of the =
package maintainers of gnupg on Arch Linux.<br>DISCLAIMER: Since =
December 2022 I am also a contracted developer for the<br>Sequoia =
project (an alternative implementation of the OpenPGP standard<br>in =
Rust).<br><br>We (Levente Polyak and I) are writing to you because you =
are the<br>maintainers of gnupg on other downstream =
distributions.<br>With gnupg 2.4.0 a change has been merged [1], which =
has gpg operate<br>with certificate material in a way that is =
incompatible with the<br>upcoming IETF approved "crypto-refresh" =
approach.<br>This means, that e.g. messages encrypted using a key =
generated with<br>gnupg &gt;=3D 2.4.0 will not be compatible with =
OpenPGP implementations<br>following the upcoming IETF =
standard.<br><br>While this has especially integrators such as =
Thunderbird [2] and<br>keyserver authors worried, it is also a concern =
for us as a downstream<br>distributor of gnupg.<br>Some of you have =
already updated gnupg to &gt;=3D 2.4.0 in some form, but we<br>would =
like to take the time and open the discussion on this topic, as =
we<br>believe that the change is harmful to the larger OpenPGP =
ecosystem.<br><br>We are currently still shipping 2.2.x due to (only now =
resolved) issues<br>with our distribution keyring. However, we are =
wondering how to proceed<br>with gnupg in the future, as it will also =
negatively affect the trust<br>model of our own =
distribution.<br><br>Several scenarios seem likely (depending on =
adoption):<br><br>* notifying users of upcoming incompatibilities if =
they create a key<br> &nbsp;with gnupg &gt;=3D 2.4.0<br>* shipping/ =
using gnupg 2.2.x alongside (or exclusively) for as long as<br> =
&nbsp;possible<br>* undoing the change in gnupg<br><br>We would like to =
raise awareness and gather some feedback of current<br>packagers of =
gnupg to form a broader response to this issue.<br><br>As mail threads =
with large To: headers might get very tedious for<br>discussing this =
topic, we would also like to invite you to<br>#openpgp-interop on =
libera.chat [3].<br><br>Best,<br>David and Levente<br><br>P.S.: The =
addressed persons have been gathered via links to downstream<br>source =
data on repology.org [4]. In case we have missed anyone =
(very<br>likely), that should join the discussion, please feel free to =
forward<br>this e-mail to them.<br><br>[1] =
https://lists.gnupg.org/pipermail/gnupg-devel/2022-December/035183.html<br=
>[2] =
https://lists.gnupg.org/pipermail/gnupg-devel/2023-February/035270.html<br=
>[3] ircs://irc.libera.chat/openpgp-interop<br>[4] =
https://repology.org/project/gnupg/versions<br><br>-- =
<br>https://archlinux.org<br></div></div></div></blockquote></div><br></bo=
dy></html>=

--Apple-Mail=_E156C011-E5F5-47B1-88A3-02D18F69524B--

--Apple-Mail=_3E220EBA-99CE-495A-B068-C818D21A0589
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iNUEARYKAH0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCY+FizV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MAAKCRBzhAn1IN+R
kJ3PAP9JnD6Z2oFhKktAorJeWBGMPP2Y3/y8WKg+knS2RrKS0AD/SKOhUGagUBfN
nv8TzFtbTsB7sv7Wvf6PcVrLyznFxw8=
=vY/5
-----END PGP SIGNATURE-----

--Apple-Mail=_3E220EBA-99CE-495A-B068-C818D21A0589--
