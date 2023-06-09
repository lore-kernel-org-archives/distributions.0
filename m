Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39101879
	for <distributions@lists.linux.dev>; Fri,  9 Jun 2023 03:27:17 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          for distributions@lists.linux.dev with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q7SmR-001F7c-9i; Fri, 09 Jun 2023 05:27:15 +0200
Received: from p5b13a995.dip0.t-ipconnect.de ([91.19.169.149] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          for distributions@lists.linux.dev with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q7SmQ-0044vl-Vp; Fri, 09 Jun 2023 05:27:15 +0200
Message-ID: <d7bc08eb9c4e7aae8664bf2ffc0dce377867ace6.camel@physik.fu-berlin.de>
Subject: Some notes on the HFS filesystem utilities
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: distributions@lists.linux.dev
Date: Fri, 09 Jun 2023 05:27:14 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.169.149
X-ZEDAT-Hint: PO

Hello!

I am the primary maintainer of the big-endian PowerPC ports in Debian and
as such, I am also maintaining the =C2=BBhfsprogs=C2=AB package in Debian [=
1] which
contains tools for creating and checking HFS/HFS+ filesystems.

Currently, the package is based on a patched version of the =C2=BBdiskdev_c=
mds=C2=AB [2]
that was originally published by Matthew Garrett [3] but is no longer avail=
able
from there.

The upstream version of the patched version from [3] was 540.1 which is rat=
her
old. Apple's =C2=BBdiskdev_cmds=C2=AB package has seen multiple updates eve=
r since and
in the meantime, the HFS code was actually separated out into its own packa=
ge
called just =C2=BBhfs=C2=AB [4].

I have forked Apple's =C2=BBhfs=C2=AB package on Github [5] and started pat=
ching the code
to make it build on Linux. Although I'm not done yet, it already successful=
ly
builds the =C2=BBnewfs_hfs=C2=AB component.

In the end, I want to have a small set of patches which I can apply against
Apple's vanilla =C2=BBhfs=C2=AB source package so that it can be easily pac=
kaged for
Linux distributions.

Since HFS support is still useful on Apple Macintosh, I thought I would sha=
re
my efforts with this list. Maybe someone will feel incentivized to support
the project with additional patches to speed up the process.

On a side note, Apple removed support for creating legacy HFS filesystems w=
hich
I re-added with an additional patch in the Debian package [6]. It might be =
useful
to refresh this patch for the latest version of the upstream =C2=BBhfs=C2=
=AB package since
being able to create legacy HFS filesystems is still necessary to install G=
RUB on
an Apple PowerMac computer.

FWIW, I have also contacted Apple's Legal team trying to convince them to c=
hange
the license of the =C2=BBhfs=C2=AB package to a more permissive one. The re=
ason is that
Debian does not consider the APSL to be DFSG-compliant [7] and therefore no=
t
completely free.

Alternatively, Paragon software might release their HFS code under the GPL =
in the
near future like they did with NTFS code although I currently have not hear=
d of
any efforts from that side. I did send them a mail to ask them though.

Thanks,
Adrian

> [1] https://buildd.debian.org/status/package.php?p=3Dhfsprogs&suite=3Dsid
> [2] https://github.com/apple-opensource/diskdev_cmds
> [3] http://cavan.codon.org.uk/~mjg59/diskdev_cmds
> [4] https://github.com/apple-opensource/hfs
> [5] https://github.com/glaubitz/hfs/commits/linux
> [6] https://salsa.debian.org/debian/hfsprogs/-/blob/master/debian/patches=
/0005-Re-add-support-for-creating-legacy-HFS-filesystems.patch
> [7] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D666707

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
