Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CF8BE5
	for <distributions@lists.linux.dev>; Sat, 23 Dec 2023 06:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Message-ID: <a0db38ec-347d-4b26-97a2-e77d679f05fe@gentoo.org>
Date: Sat, 23 Dec 2023 08:18:03 +0200
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: distributions@lists.linux.dev
Reply-To: distributions@lists.linux.dev
From: Joonas Niilola <juippis@gentoo.org>
Subject: LXD going to lose access to its image server
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------47Q4jgUjfQZKylEy4x61CxZk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------47Q4jgUjfQZKylEy4x61CxZk
Content-Type: multipart/mixed; boundary="------------DX9dMtoO6Qfa1wGSKoUGtqfl";
 protected-headers="v1"
From: Joonas Niilola <juippis@gentoo.org>
Reply-To: distributions@lists.linux.dev
To: distributions@lists.linux.dev
Message-ID: <a0db38ec-347d-4b26-97a2-e77d679f05fe@gentoo.org>
Subject: LXD going to lose access to its image server

--------------DX9dMtoO6Qfa1wGSKoUGtqfl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hey,

short gist is: Earlier this year Canonical moved the LXD project from
community-hosted LinuxContainers under Canonical's management. They
removed administrative access from non-Canonical employees and
introduced Canonical's CLA on all future contributors. Community didn't
like this, so they forked LXD and so Incus was born. Incus would pull
code from upstream LXD to stay compatible.

Now recently Canonical re-licensed LXD so that Incus couldn't pull code
from them anymore. Therefore Incus will become a fully independent projec=
t.

However it is LinuxContainers that builds and hosts nearly all LXD &
Incus container & VM images in https://images.linuxcontainers.org/ -
note that sites such as https://uk.lxd.images.canonical.com/ are just
mirroring the linuxcontainers.org one. Canonical only builds and hosts
their own Ubuntu images.

Because LinuxContainers community can't lean on to LXD, they've decided
not to build and publish LXD images anymore. Non-LTS LXD will gradually
start losing access to these images immediately in 2024, while LTS LXD
is allowed until ~April-May of 2024 to have a fair chance migrating into
Incus LTS, which is expected to be out in April 2024.

At the time of writing it's unclear what Canonical will do. Are they
going to start offering variety of distributions, or just focus on
Ubuntu? Either way this will most likely require actions from downstream
packages.

I've written a more-detailed, Gentoo-focused summary with current
timetables and "what can you do" actions to:
https://bugs.gentoo.org/920527

but basically:
 1: move to incus,
 2: host your own image server,
 3: wait and see what Canonical does.

Follow upstream announcement here:
https://discuss.linuxcontainers.org/t/important-notice-for-lxd-users-imag=
e-server/18479

Canonical's discussion forums:
https://discourse.ubuntu.com/c/lxd/126

-- juippis

--------------DX9dMtoO6Qfa1wGSKoUGtqfl--

--------------47Q4jgUjfQZKylEy4x61CxZk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEltRJ9L6XRmDQCngHc4OUK43AaWIFAmWGe5tfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDk2
RDQ0OUY0QkU5NzQ2NjBEMDBBNzgwNzczODM5NDJCOERDMDY5NjIACgkQc4OUK43A
aWKn/wgAmX0pTLQD5jAFmHkUygASwbyIiL/Nmigj8+qU6VBP/RFXaeA140PMhHYU
pdSPR5j+eXImvrEDbaHdoxbV6dACKEbfYZQKk207k2srw983Z9P1+ACLdU9CeFM5
G7APlOB637EeigzqlhDUESS5+TKte34ZIj7Cxu2lAz3MXHjyUlB3VqRMxifrqk8w
cgtJ7qA6yD3CjMDg/vDcTnDIQDNfLzcQ6XFCMvj3ijjXY3FozgNjUr1wxwsFDGj/
522oBA4nwRztX/nGuY6aTp/DP6UYL29IspQ9ySoUK1SOwwuK7kYCjjFeYOvJFZyJ
t8pS7Vuc9HZTcyocNrJQwdYwOER2OQ==
=2seF
-----END PGP SIGNATURE-----

--------------47Q4jgUjfQZKylEy4x61CxZk--
