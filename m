Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB97147C96
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 03:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725505870; cv=none; b=XcbVHzubmbo8Ie+qdjjskLEzIXD5Uq6nqsQ7bT+2GCmNQTkkH1hNrXweYhWgJpXUA5OzPgDXx0WN/V6vdYPHsNDGWz5zFJLYizQqMn3l17ErHrqMGoZQpMJ5gxkISkEEYvAKk23dF2iAZkDELezmxK4RY1oNlTutJ2M1/rJ+5vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725505870; c=relaxed/simple;
	bh=EF7sXdJJ3ETVhWrVYNmMA/qR00lST+xq6LuM2wAR3TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzLHJaaq4jcIBl4ltejKymXFrX8kdPq8t6rerFFWQXgk1qb0oN42NtqTaHZrnuQCVnbBgrVWb/mK+qS97EVBkZb9aJ/TDtCEMqqhsgLxhQ5Px3moDAByrdZ2i8SH2Da6xyIjXhRz8Mst0YnOP8nBOLeTSOMN/cGM+Rd9MfhAbhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHIcOPVe; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHIcOPVe"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-277f35c01f5so188866fac.0
        for <distributions@lists.linux.dev>; Wed, 04 Sep 2024 20:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725505868; x=1726110668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUlsYHvDVvSed3nX5pgU2FMAcf/6X/mwYFekzFT6tn8=;
        b=CHIcOPVeICoZDpmz75t3W4fQ7G7PrrXMKsz2qwccvPUcIV81la92nZ8T2s32PJXSPh
         F4he86ceMCEjNRzr7r/NRBORo9VefbmqJEPuekQBrHzW8gPQoBXjmVkkML9uRy/13XDs
         N3/FRmJxKlFr2Xxcs0QoSpRD2jhhKtWlVmG22vDpH00dhmPzX2RsxuHmRLK1jP0aFf+9
         OGdaoOLWFTNPjsc9T89b6qV7ezZ4H1oRq83+d2jMnJTh/oVvDjbIZER+k0AVWchNHOqj
         lvUGJ6ctkFp/aaDEA/M6ex4pbfBwF4hQqcWEwxUzu3Lypq8BUkrBETtCy0PvX2MeNsx/
         JvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725505868; x=1726110668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUlsYHvDVvSed3nX5pgU2FMAcf/6X/mwYFekzFT6tn8=;
        b=aEKGa52bKmGHaOKMpXo1NFN0+4lrBj0vbOuK/2+fcD4r3tKP0Vo46bbeyCnwbD/eBn
         6eAOy2Ew82qykPLXnwbqCz0zzy+848BrnZHEVLitreOR946XQlEqRtldhghhlNDGEnaQ
         bBVZt+CH6vq1VZL01pqfH7G2cVg7RcOoTpGqlgjeCvD592FDryxpOfrB7B2NLRyf9LLD
         AboUd27QeV5f9/5alRpXemD//Dh0OOAbW9UWSpFjgY7s8bsxySvB9kQGCAGN5BQRhfKf
         ErYa1pdgop8NAAnqnKsCtURpkpb7hgjcgzxgWoXmeVwJUg+iAlr/OeKg/alcb1R7lQ27
         gTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjA4drreNG7jdRywhiMlqnmmaTKQPV9s4Wn46LNL+Vd2Ae/yJ6FFMNibNo5lxifv7k8Za1i1Xvojo8NvOS@lists.linux.dev
X-Gm-Message-State: AOJu0YySSJElpzRlRbPMJQF+gFzJnpi7rRilyno7xT+1LaER5rS4BF3i
	3EkcJ0uWfbeTuOoqyw5Z1iipr4FgSc7+MhMHclb0oGRyI8md72QIKIU3Y/i0iJbZtHndH+RVUEk
	X6En1oCBUORzSMceeNNncy81bKo4=
X-Google-Smtp-Source: AGHT+IEWJHZ++Dxu0OOiYUwNF4XDxtPyVECvyjkdYvWPjxkpnald0RrAvexIu19wvGOQ2ys37JQRaGN1TNT24NQLjz4=
X-Received: by 2002:a05:6870:4202:b0:277:d8a7:f63b with SMTP id
 586e51a60fabf-277d8a8202amr15915550fac.39.1725505867950; Wed, 04 Sep 2024
 20:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4996568.GXAFRqVoOG@noumea> <20240905020617.GZ23787@mail.wookware.org>
In-Reply-To: <20240905020617.GZ23787@mail.wookware.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Sep 2024 20:10:42 -0700
Message-ID: <CAMKF1spAZzNH3jYOnwo720nM4zQ_5JCv=ZGq4SC=TWC+WXWVPQ@mail.gmail.com>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
To: Wookey <wookey@wookware.org>
Cc: "Andreas K. Huettel" <dilfridge@gentoo.org>, libc-alpha@sourceware.org, 
	binutils@sourceware.org, gcc@gcc.gnu.org, config-patches@gnu.org, 
	distributions@lists.linux.dev, devel@lists.fedoraproject.org, 
	glaubitz@debian.org, maskray@google.com, dickey@invisible-island.net, 
	toolchain@gentoo.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 7:07=E2=80=AFPM Wookey <wookey@wookware.org> wrote:
>
> On 2024-09-04 17:48 +0200, Andreas K. Huettel wrote:
> > Dear all,
> >
> > in Gentoo Linux we want to change our CHOST triplets for 32-bit glibc s=
ystems that use 64-bit time_t, since
> > this is technically an ABI change which breaks binary compatibility [1]=
.
>
> > * In an ideal world this change would be synchronized across distributi=
ons. Opinions? [5]
>
> Debian considered this issue over the last 18 months/2 years, and
> found very little enthusiasm for making new triplets. Every distro
> that is using 64-bit time (on 32-bit arches) just enabled the flags
> and changed the ABI without setting a new arch/triplet (or they have
> dropped 32-bit stuff entirely so sidestepped the issue).
>
> Given this, and because users would like to just be upgraded to 64-bit
> time, not have to install a new architecture, Debian and Ubuntu
> decided not to try and push a new triplet and do a library-name ABI
> update within the architecture(s). That went ahead between March and
> June this year and is now pretty-much done, modulo a few outstanding
> bugs
> (https://bugs.debian.org/cgi-bin/pkgreport.cgi?users=3Ddebian-arm@lists.d=
ebian.org;tag=3Dtime-t).
>
> Debian's thinking and status is summarised here: https://wiki.debian.org/=
ReleaseGoals/64bit-time
>

FWIW, yocto/openembedded have also done the same and offered a distro
setting to the users
to select 32bit time_t if they wished to but defaulted to 64bit time_t.

> So it's interesting that in fact Gentoo _does_ want to do this, but it
> seems to me that this is now a done deal, and 'everyone' has already
> switched within the existing triplets, even Debian, which is the
> hardest place to do this because it involved 1100 library transitions,
> with another 3500-odd rebuilds.
>
> > [1] The ABI of glibc does technically NOT change, however, the type def=
inition of, e.g., time_t does.
> >     And as soon as any other library includes that in its public interf=
aces and data structures, that library
> >     changes its ABI.
> >     An example for an affected library (found real-world during testing=
) is gnutls, see
> >     https://bugs.gentoo.org/828001
>
> Yes. We did a big ABI analysis to find out how many libraries were
> affected (including LFS which glibc ties into this transition) and it
> was about 700. (there were quite a few more where the automated ABI
> tools failed and it was easier to do a transition than work out why,
> so we ended up transitioning 1093 source packages
> (https://people.canonical.com/~vorlon/armhf-time_t/source-packages).
>
> So yes it's an ABI change, but we don't always change the triplet for
> this, sometimes we just move the baseline along. This happened in the
> last for glibc 5->6 and libstdc++ v4 to v5 and the long-double
> redefinition in s390,alpha, sparc, powerpc. In fact, considering the
> whole-distro collective ABI, this happens every time there is an ABI
> change in a library. The arch/triplet remains the same, but the new
> release has a different ABI in some number of libraries and
> dependencies.
>
> So it's always a choice whether the triplet should change or it is
> just treated as an update, and usually the latter is chosen. This was
> a borderline case that could have gone either way, but people decided
> to do it as a transition, not a new triplet.
>
> Are you sure gentoo will gain enough value from going it alone here
> and defining a new triplet? Because every other distro will have (has
> already got in fact) the t64 ABI with the old triplet.
>
>
> > [2] We've brought up this issue previously, just somehow it never caugh=
t momentum. See, e.g.,
> >     * https://sourceware.org/pipermail/libc-alpha/2022-November/143386.=
html
> >     * https://sourceware.org/pipermail/libc-alpha/2023-January/144963.h=
tml
> >     A more detailed discussion of different possible approaches in Gent=
oo can be found on a wiki page
> >     maintained by Sam,
> >     https://wiki.gentoo.org/wiki/Project:Toolchain/time64_migration
> >     Discussions within Gentoo have led to the conclusion that a new CHO=
ST makes most sense, with
> >     the old one staying at 32bit time_t for legacy binary support as de=
precated option.
> >
> > [3] https://bpa.st/HV6BS
> >
> > [4] https://sourceware.org/pipermail/libc-alpha/2022-November/143386.ht=
ml
> >
> > [5] Note that this entire issue / proposal only affects 32bit architect=
ures and distributions.
> >     For Gentoo this would be ix86, arm(32), hppa, mips(32), m68k, ppc(3=
2).
> >     riscv32 is special since from beginning it only has the 64bit time_=
t interface.
> >
> > --
> > Andreas K. H=C3=BCttel
> > dilfridge@gentoo.org
> > Gentoo Linux developer
> > (council, comrel, toolchain, base-system, perl, libreoffice)
> > https://wiki.gentoo.org/wiki/User:Dilfridge
>
>
> Wookey
> --
> Principal hats:  Debian, Wookware, ARM
> http://wookware.org/
