Received: from cheddar.halon.org.uk (cheddar.halon.org.uk [93.93.131.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8681FDA
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 02:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.93.131.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725504533; cv=none; b=QA9YaXZjZIk4y90FXKyt7dNxKVl2hYeWa6HoULRsZfJFjimpwE4E2l4LEYT+j4zSR0V2+etjvKj/FrWT63x17VW7dPdI3XPw0sRFFeFWqxuLCkPta/oVKMNK33tPFRO4ptoK7xFGmZkzYe222kX8HCr8qVg42/sHaH/EsggjBdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725504533; c=relaxed/simple;
	bh=DUQUMBwiriQaS+l0iRCgPSDEoS2jDUrTnvoejeHX+YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiWUGvHlhW64oNDOHNlHp+G8tPBr+L1wdQS05zLBC56J2NuG6v8TlWOQVacRrnlxOVd3Y3OsZFdUEouOaDviQaMDq90M2+VopEGSEAuGbok4teDjaoqtBH5fkJKVbn/wklp1NRYi9nMN4slVv3S1KuXggvQh/pspIQf7SeMTzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wookware.org; spf=pass smtp.mailfrom=wookware.org; dkim=pass (2048-bit key) header.d=wookware.org header.i=@wookware.org header.b=b71i0k03; arc=none smtp.client-ip=93.93.131.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wookware.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wookware.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wookware.org header.i=@wookware.org header.b="b71i0k03"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=wookware.org; s=cheddar; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:Subject:
	Content-Transfer-Encoding:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=0500nuRmYeemHSavz2BhEd+SJf6vVwdkhN+WmTHYDp0=; b=b71i0k03FcFg2HxTY0M0BWQsMq
	VDvddjpTmw3HulvI/sRT7RueSwqwqRa1BY1ApKO3yqGEzrYq/e/HH8H4nk2OQmBej+8zTwl2gm9gy
	yybNDw35mW1lGyOeqQNRIxevBc1JeinUQn05udaamTtF2F9v9+Ci7942FWDyfQ/dlNSBMG+ZdvHo5
	ShHLv+IFxcq44EygzerDZyJ9rp5lwStOIwRC6mfVMM0qOz2BJ7JoST/a8fOzlap3SkNX0y5Eo0apX
	fCqim0SdAlplCLfzRLcCU3A3yunIwaZVIBQige2aXR1tqnisP49eodWEWV+WvsrIXErCJa+Cb9Rr8
	9+tgWMYQ==;
Received: from wookey by cheddar.halon.org.uk with local (Exim 4.92)
	(envelope-from <wookey@wookware.org>)
	id 1sm1t3-0002VC-VG; Thu, 05 Sep 2024 03:06:17 +0100
Date: Thu, 5 Sep 2024 03:06:17 +0100
From: Wookey <wookey@wookware.org>
To: "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
	config-patches@gnu.org, distributions@lists.linux.dev,
	devel@lists.fedoraproject.org, glaubitz@debian.org,
	maskray@google.com, dickey@invisible-island.net,
	toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Message-ID: <20240905020617.GZ23787@mail.wookware.org>
References: <4996568.GXAFRqVoOG@noumea>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7v2SkOxZkOkgWk1E"
Content-Disposition: inline
In-Reply-To: <4996568.GXAFRqVoOG@noumea>
Organization: Wookware          
User-Agent: Mutt/1.10.1 (2018-07-13)


--7v2SkOxZkOkgWk1E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2024-09-04 17:48 +0200, Andreas K. Huettel wrote:
> Dear all,=20
>=20
> in Gentoo Linux we want to change our CHOST triplets for 32-bit glibc sys=
tems that use 64-bit time_t, since
> this is technically an ABI change which breaks binary compatibility [1].

> * In an ideal world this change would be synchronized across distribution=
s. Opinions? [5]

Debian considered this issue over the last 18 months/2 years, and
found very little enthusiasm for making new triplets. Every distro
that is using 64-bit time (on 32-bit arches) just enabled the flags
and changed the ABI without setting a new arch/triplet (or they have
dropped 32-bit stuff entirely so sidestepped the issue).

Given this, and because users would like to just be upgraded to 64-bit
time, not have to install a new architecture, Debian and Ubuntu
decided not to try and push a new triplet and do a library-name ABI
update within the architecture(s). That went ahead between March and
June this year and is now pretty-much done, modulo a few outstanding
bugs
(https://bugs.debian.org/cgi-bin/pkgreport.cgi?users=3Ddebian-arm@lists.deb=
ian.org;tag=3Dtime-t).

Debian's thinking and status is summarised here: https://wiki.debian.org/Re=
leaseGoals/64bit-time

So it's interesting that in fact Gentoo _does_ want to do this, but it
seems to me that this is now a done deal, and 'everyone' has already
switched within the existing triplets, even Debian, which is the
hardest place to do this because it involved 1100 library transitions,
with another 3500-odd rebuilds.

> [1] The ABI of glibc does technically NOT change, however, the type defin=
ition of, e.g., time_t does.
>     And as soon as any other library includes that in its public interfac=
es and data structures, that library
>     changes its ABI.
>     An example for an affected library (found real-world during testing) =
is gnutls, see=20
>     https://bugs.gentoo.org/828001

Yes. We did a big ABI analysis to find out how many libraries were
affected (including LFS which glibc ties into this transition) and it
was about 700. (there were quite a few more where the automated ABI
tools failed and it was easier to do a transition than work out why,
so we ended up transitioning 1093 source packages
(https://people.canonical.com/~vorlon/armhf-time_t/source-packages).

So yes it's an ABI change, but we don't always change the triplet for
this, sometimes we just move the baseline along. This happened in the
last for glibc 5->6 and libstdc++ v4 to v5 and the long-double
redefinition in s390,alpha, sparc, powerpc. In fact, considering the
whole-distro collective ABI, this happens every time there is an ABI
change in a library. The arch/triplet remains the same, but the new
release has a different ABI in some number of libraries and
dependencies.

So it's always a choice whether the triplet should change or it is
just treated as an update, and usually the latter is chosen. This was
a borderline case that could have gone either way, but people decided
to do it as a transition, not a new triplet.

Are you sure gentoo will gain enough value from going it alone here
and defining a new triplet? Because every other distro will have (has
already got in fact) the t64 ABI with the old triplet.


> [2] We've brought up this issue previously, just somehow it never caught =
momentum. See, e.g.,
>     * https://sourceware.org/pipermail/libc-alpha/2022-November/143386.ht=
ml
>     * https://sourceware.org/pipermail/libc-alpha/2023-January/144963.html
>     A more detailed discussion of different possible approaches in Gentoo=
 can be found on a wiki page=20
>     maintained by Sam,
>     https://wiki.gentoo.org/wiki/Project:Toolchain/time64_migration
>     Discussions within Gentoo have led to the conclusion that a new CHOST=
 makes most sense, with
>     the old one staying at 32bit time_t for legacy binary support as depr=
ecated option.
>=20
> [3] https://bpa.st/HV6BS
>=20
> [4] https://sourceware.org/pipermail/libc-alpha/2022-November/143386.html
>=20
> [5] Note that this entire issue / proposal only affects 32bit architectur=
es and distributions.=20
>     For Gentoo this would be ix86, arm(32), hppa, mips(32), m68k, ppc(32).
>     riscv32 is special since from beginning it only has the 64bit time_t =
interface.
>=20
> --=20
> Andreas K. H=FCttel
> dilfridge@gentoo.org
> Gentoo Linux developer=20
> (council, comrel, toolchain, base-system, perl, libreoffice)
> https://wiki.gentoo.org/wiki/User:Dilfridge


Wookey
--=20
Principal hats:  Debian, Wookware, ARM
http://wookware.org/

--7v2SkOxZkOkgWk1E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEER4nvI8Pe/wVWh5yq+4YyUahvnkcFAmbZEhMACgkQ+4YyUahv
nkeEWA//aFQSabQJcwsKBo7cdm3uB3ruyXkPEFtW0ky85hzYlE1HhDxm9gghasCN
OrtC20KnXZlPk8f0LSXRVCYenfG8w7mJMI0sfVYaBP6mk+0BlQm8nxe9Gtn99s44
RLwaUa7FspWcwFbOxujDCJgedpxqMNU6lXoamQePlqeXGd4Pjkz8W+0+SlYStj/9
OYfThuPBOCUV3ODSSRX27nd33D+FxJa6AVJTlRNqlMM8szUJ5aIcf61gjf+je2p7
uQAe06ApBtx5MNKYbKSWTKvrvbNFwUkSXL4RqKpPb4fdMz4fWWKqqHtayzzT9XKV
ZE4hq8q33fpM2cIJWEnAkfuu/F2R+byYMe7GwZS38VO4QX5t4T3vyyAzqlUp2twW
nsAKe1r/5WqAUjTl5/A1pOTB80CK9KM6JB/n4z+58+aDjT4TrzymQCN5zkWzW0yf
EWHUOx2MVdn1t2pn5odmnbaBu7vqLysCrwtE2bqpFe07vj9po7DIPeWvbo39yy+N
rq/qSt/FUQ3hLWGCAmYHAenOwhtDfXz8AZfwUIvs88rrf+Z1NfeabpeygPg/zyH9
EXWemxV6qw/Sfk/+/kJJ1It804V6Qzh7rYIvGoDBcygMntVMYwYnXRDERtuoj0hZ
9WujFpjQ6/yvpDUyl28LqVZ5drumgRuOj1jmfXhunS9gHTU9BNI=
=0JEa
-----END PGP SIGNATURE-----

--7v2SkOxZkOkgWk1E--
