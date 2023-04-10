Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8952F3F
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 21:08:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1681160917; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Vqc8hR/lOkwdPEbFSD0ol7kQ/Elvol8VdghVOxiCZNkJrRETzdggHuPuxcsaWW2A7u
    aGwLzKHVH9rNlOFXr+bxA7ysorAVMTqypo1Z52Qk8GYo8a55TL+NypHiy8lDaaNkUvce
    Z/2p0ySWRsw8Dhd05gHWI9lUNDiWZWXYbwIZIyQrI8IqZrx6/FMyYKMcMBzu4i1OMWSU
    xTKmCplApaHqXtUBXg+opssKZgtTAE2NA8XQXKdlQQ7agbbLwQjovU8IXtALhI/KH/0y
    y/9nGE18ZfvY6kTtfElBV8rgrHj/VTF7eNH0wRWTnsg46l9huGNm5citr66wkVlmJoKc
    oIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681160917;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=jmbiTeP2LOay5JP8/cYjPZd4Fe01F5rFFEfpwNOHUh4=;
    b=T5zzi621u1tP4j9e/BAAdVNOexDkBLYan0bm4Zq4b9BXVTbF6Dq7aYPU9yC6PkEwCH
    uLYzwx/e7wMbnTeX7cQn/Gjz3/olfHhg00gfyryVp41G+uRj7D15keuHfF8WsLeyBLP5
    u72Ij5WEXJy9zej2yRLVi3g5qePMnonwTXfo/dbiLbrxkl7JXK7iHb62MRZRyOiNfyTx
    aAPtKis0a1nNdp8Aodo/egoKgYyKqfUkrxttH7O8nJo4r1h5xzbAnk+BByP1uSuviKqw
    BtW7FBt2KZQG3frBURBSAj5d9QJn735tyKO7jw2C/sbYgQpSFkBTD5dliEYBD457C7b+
    fCDg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681160917;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=jmbiTeP2LOay5JP8/cYjPZd4Fe01F5rFFEfpwNOHUh4=;
    b=iUhxtzXhvZ6Wsv4w622K4yRshpJ0NfCPHwCKwvl8IbVp5KEer2yI5FNc9TaU+rxrjY
    9E1EYeX5iaglQ215bYINgoFJk0HFjX6fVIUZ3ICKanbXepzBHpw3X0QeenuFpMdKAsGj
    qRMqmV3v7GJ7g51SoFq5v4sl+vl9KnbyHmP0RiYwZN8c3V9cRQfgKZ9UEiPUFjRrLOGB
    o8bg4XnfCPDphFcKa6BV0aX7YyTm23t5o7wMtxnTGhvJzd3s7MmX1XF9fX2unqRurnt2
    t1Iyi95vNH8JycpmO9ZiESjsxhU0JRUEdOJENdwQK93f8rhUPC+XVNMNr0HeQhdXEqRg
    XUkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681160917;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=jmbiTeP2LOay5JP8/cYjPZd4Fe01F5rFFEfpwNOHUh4=;
    b=deGi0ViWKQRXHbiw9B9p45++LtjyIgXA+aRchNgyvzqxxM5sLEbaAgrXEN7FJZ/IW8
    zH+t1c5pw21MaEOzAvBQ==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOR2qCFhc6P4zzpzNGh8xZkWtKSsw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id D064b6z3AL8abPz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 10 Apr 2023 23:08:36 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: Zack Weinberg <zack@owlfolio.org>, =?ISO-8859-1?Q?P=E1draig?= Brady <P@draigbrady.com>, bug-gnulib@gnu.org, Paul Eggert <eggert@cs.ucla.edu>
Cc: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Date: Mon, 10 Apr 2023 23:08:35 +0200
Message-ID: <8903614.REtRWnDglx@nimes>
In-Reply-To: <c87cc7dd-4eb8-49a1-e27e-b5621909b617@cs.ucla.edu>
References: <6614772.670kD7asE2@nimes> <bffe78fa-dc4d-46e5-8c2d-27f7aaa7baac@app.fastmail.com> <c87cc7dd-4eb8-49a1-e27e-b5621909b617@cs.ucla.edu>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

I want to avoid year-2038 breakage as much as you want. But what you
are doing in coreutils and recommending through the Gnulib manual
goes beyond that goal.

> Applications like 'ls' and 'date'=20
> and even 'grep' need support for timestamps past 2038.

=2E.. if they are used in hardware that will operate in and beyond 2038.

Please read again my concerns regarding distro people and users/sysadmins.

I am sysadmin of a machine with an Intel 'Atom' CPU (x86) and want the
freedom to install, up until December 2037, any new releases of software
on it. What you have done in coreutils is to prevent me from installing
coreutils 9.3 or newer.

> Many embedded systems being developed now will still be used after 2038,=
=20
> long after their current developers have left (or fled :-) the scene.
> And some of these will be part of important infrastructure such as=20
> municipal water systems.

It is their responsibility =E2=80=94 of the people who assemble such munici=
pal
water systems =E2=80=94 to do so, not yours as maintainer of any particular
package that gets installed on this system.

The proper actions to achieve the goal would be to
  - raise awareness of the problem,
  - get active in the organizations of the people who assemble such
    systems, to exert influence there.

You are trying to exert influence / power on *everyone* who installs
coreutils, and as I've described in the previous mail, this has
negative effects on some distro guys and some users.

> For general-purpose apps like coreutils that=20
> are widely used in these systems, 32-bit time_t should be opt-in not=20
> opt-out

But the 'year2038' module / the AC_SYS_YEAR2038 is already opt-in,
not opt-out. It offers an option --disable-year2038.

> so that developers know of the problem and consciously decide=20
> to go with 32-bit time_t despite the looming 2038 deadline.

Please by all means, increase awareness. But choosing
AC_SYS_YEAR2038_REQUIRED instead of AC_SYS_YEAR2038, and thus
suppressing the --disable-year2038 configure option, is more
than let packagers / users "consciously decide". You are not
giving them any decision power, since you have removed that
decision power from them already.

> Of course there are occasions where one can still safely build for=20
> platforms that one *knows* won't be in use 15 years from now. So we'll=20
> need to describe how to do that and I plan to follow up with a Gnulib=20
> doc patch along those lines.

The Gnulib documentation is the wrong place to explain such a
workaround or option. It needs to be explained in the 'configure --help'
output of the package.

Bruno



