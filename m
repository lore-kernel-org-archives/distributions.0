Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B34322B
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 13:52:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1681134049; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LZda9bjPO+TG3n+Sofum7udaPDSz2jYsGhzNuFCK8ywhcS2SyFbJKytCm0+q0ro62+
    +1zvIBeS6a2/5/TNsgHNHlJjy8w2Q9nB43H8I2dXJtUv2XzoT5ffVcMuIxgSybC0AP+Q
    LX1BdmzFA0wmnWhmjiF8uSVDpGclNSrbuZ05AXPuxf3tqW7lo5Ivd9oTkU8e93FqM1dX
    rtTO2ydGIGFzUS+68KoDBc3Q8Tbe4zIbI/XclGN+gTKymQsOo454cPIqGcNwkUCdVoCz
    rJdYJZ2cC9ihFT/NIQ5db7l4doCIclaNMlE98Ed9XJPAXmH7WOr6Gf8/p+qEldSCuBso
    2DNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681134049;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=bRpwgi5A1FIdPgmGZd9eZjJOYbZPqrkoGUweZlgkGms=;
    b=aSEO9vPsnZC9Uai93cxbgsyyWQgV9ImQSw/J5OUq/VM2bZhONVyB3ABETDThrSVuFq
    tREbOd54tzukVHz3dLxZWIS/wTpmfSsrwMesajhk7eHNvOkjSdMoX9ndRv9LYjzM3P1p
    RkRvGhP84xlHModSPc/bTp6XweoHDw3ODhki4pnWyDgSqoUneOEGX40vy4ghGnc472W5
    8Jesu1zyS6C9BnztR7BZp9gCJqzHxoL86j1Ob1XgGt+PfUDQUDE1spk9z7bXMVT1Mhde
    WPvwZL4NXnWzAepGVQfOQi5qEjaucyWUN0qP8JxIpxgkkXgXUHX5sucSqRvEXQpL3bcX
    to3A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681134049;
    s=strato-dkim-0002; d=clisp.org;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=bRpwgi5A1FIdPgmGZd9eZjJOYbZPqrkoGUweZlgkGms=;
    b=aX13yx5o6mbcIkod9oGG/XO5J/6Su8fKJQUDT5KfHI4HYuwLUdo7ieWfBDIGDyQ4T8
    e4J5WbYTuHOoPnsEHRxNuLvIVTufxEdgNrQ4IheXH4KYggLm8/5sNav69KFnCAHBII8H
    zhxF1CVQMH9kSh0vj4wscikKtVgSqLtp2BkaUUulMngj3z8TMLCyIZPuBq0Exb+weu93
    GCaoZe/KMXloNhRWsp/dxneNISW2PC2DIL86yxZSQkfx4tCU0RIXBPmefGl/fGArKKeu
    8cx4C3ZOTnwqLzK2tSOZRFKczIYD14dOBDWncRhZJ5jsRL3s54amTtJkKhAYiManWTBw
    kP0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681134048;
    s=strato-dkim-0003; d=clisp.org;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=bRpwgi5A1FIdPgmGZd9eZjJOYbZPqrkoGUweZlgkGms=;
    b=fQoRVrMjAUoaQyxZpxpU3KBwo4XDQexJByAFsvSXgstJw/zxw3ryv75Ee2+bEzfRSV
    zmOP8PwJpx/qW5KDYnDg==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOR2qCFhc6P4zzpzNGh8xZkWtKSsw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id D064b6z3ADelZkf
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 10 Apr 2023 15:40:47 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: Paul Eggert <eggert@cs.ucla.edu>, bug-gnulib@gnu.org
Cc: Zack Weinberg <zack@owlfolio.org>, Sam James <sam@gentoo.org>, distributions@lists.linux.dev
Subject: recommending AC_SYS_YEAR2038_REQUIRED ?
Date: Mon, 10 Apr 2023 15:40:47 +0200
Message-ID: <6614772.670kD7asE2@nimes>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

In yesterday's changes, you added to the Gnulib documentation, section
"Avoiding the year 2038 problem", wording that

  * explicitly recommends the =E2=80=98year2038-required=E2=80=99 module,
    which does AC_REQUIRE([AC_SYS_YEAR2038_REQUIRED]):

    "The Gnulib module =E2=80=98year2038-required=E2=80=99 is recommended f=
or any package
     that might be used after the year 2038 on 32-bit platforms."

  * presents the =E2=80=98year2038-required=E2=80=99 module as the first an=
d the =E2=80=98year2038=E2=80=99
    module (which does AC_REQUIRE([AC_SYS_YEAR2038])) only as the secondary
    option.

I strongly object to this recommendation and presentation.

The reason is that we have three personas:
  - The package maintainer who edits configure.ac.
  - The distro people who create distros comprised of many packages,
    passing appropriate options to 'configure'.
  - The user / sysadmin who installs packages on their systems from source,
    passing appropriate options to 'configure' as well.

If the package maintainer adds an AC_SYS_YEAR2038_REQUIRED invocation to
his package's configure script, or equivalently, if he pulls in the
'year2038-required' module, he is *taking freedom away* from *both* the
distro people and the users/sysadmins.

It is simply the wrong person's decision if the package maintainer
uses the AC_SYS_YEAR2038_REQUIRED macro.

In detail:

When AC_SYS_YEAR2038_REQUIRED is used, the package can no longer be
installed on the following 32-bit platforms/ABIs:

  - Linux with glibc < 2.34 on x86, arm, mips (32-bit or n32 ABI), powerpc,
    sparc, s390, hppa, m68k, sh, csky, microblaze, nios2,
  - Linux/riscv32,
  - Mac OS X on x86 and powerpc,
  - GNU/Hurd/x86,
  - GNU/kFreeBSD/x86,
  - FreeBSD/x86,
  - MidnightBSD/x86,
  - AIX/powerpc,
  - Solaris 10 and 11 on x86 and sparc,
  - Cygwin/x86,
  - Haiku/x86.

Regarding the distro people:

  The outcome of a discussion, about a month or two ago, was AFAIU that
  Linux/x86 and Linux/arm distros have a choice between
    (a) enabling 64-bit time_t for all packages, thus breaking ABI
        compatibility once and becoming year 2038 saft, or
    (b) staying with the 32-bit time_t, and announcing that their
        distro will stop working in 2038.
  An incremental or partial move to 64-bit time_t would be too expensive,
  did the distro people say.

  Now, if a package maintainer adds AC_SYS_YEAR2038_REQUIRED to their
  configure.ac, they are telling the distros of type (b) "you cannot use
  new releases of my package any more".

  This is discriminatory and without justification, since the maintainers
  of a type (b) distro already know that they have to limit the lifetime
  expectations of their distro.

Regarding the users/sysadmins:

  It is their decision to know until when they want to use their hardware,
  and which ABI they want to use for the binaries that they install on
  this hardware.

  Now, if a package maintainer adds AC_SYS_YEAR2038_REQUIRED to their
  configure.ac, they are telling the users "you cannot install releases
  of my package any more" or "I force you to install 64-bit binaries
  instead of 32-bit binaries".

  It is just not appropriate for the package maintainer to push such a
  decision onto the user.

I would therefore propose that the module 'year2038-required' gets
removed from Gnulib, as I cannot see any positive uses of it.

If that is not possible, then at least:
  1) The Gnulib documentation should present 'year2038' first, and
     'year2038-required' as a rarely needed alternative,
  2) The Gnulib documentation should not recommend 'year2038-required'.

Note: In constrast, there is nothing wrong with the Autoconf documentation.
It presents the AC_SYS_YEAR2038 and AC_SYS_YEAR2038_REQUIRED macros
without favouring one or the other.

Bruno



