Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47703222
	for <distributions@lists.linux.dev>; Fri,  3 Mar 2023 20:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1677875105; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=r0VF9evrp7cH4TBwsVBt385wlVdbpo8gl9pz4mbYdEZp9/xGEVGNkKvvw3sDKCv3sg
    x2SSJFR2PSD1u+vM3x+T7gHFNTKiXbQD1wSWg9XEFU0Jd/irYMWG5/heMTwywNNz0tPc
    pH+ilGHGmjkc64KFL7DJAz7tQ1UBqhrtKtB30+ctgcZYSHTu3//cJgruzTBsbG9WdrP+
    ugAbCaWTUhwASvwI0FfdiATNkvCirElaAT9GNlL8BbBC6ptDivTj5hW5dvDGSfrXZL+R
    SFoEqx6/xtdEGfnKzo0epitVZwf2owr4HRDESbT9bXBE7ZzRhDMiAIs6cEQsErFAvsh3
    bDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1677875105;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=TAx6DWJy3zeIDZFfAqTKOx+jvgV/WNkO1opj7Wsp9u0=;
    b=p847AUMbt7J44b6DmPr/7lE/Ta53ykdTl8dQvVShh2E/as5ELIwCN1/xkhYfCIpp4Z
    IRWfDClJhdkB+SY0X5IK+NGbjnf9fRpjNzpI4/Tq3W+jMbjRhJANk9W+x/gME6XNT/LI
    xsEHu1NeXzeJxBxpY+Q4hyLwzxvv3FqN4farSluQkamWiqJYF+eUuVfAKbRng3Ju/DMd
    X6yTSSpk7kXQe60ZIO2LxYyl311I/+k4VDfHnktn5AM5Ssquen+Yhs5TdfWPuns85vFX
    Xwl5biNKnWzhBnkZhALmdf+ksfLz8MLzDMm3l7+zpmXI9NwB5RRpeT4+Z0kbUQnpk0aR
    OU8A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1677875105;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=TAx6DWJy3zeIDZFfAqTKOx+jvgV/WNkO1opj7Wsp9u0=;
    b=XoqoGmWakNL4msiUA4StCsA/+xC0/YMFHMlLXpwiQ91p2zBqVu0gOgzII0ChNFMUNw
    1QPgZA0VI3Z1I4aZyY+ow+UgwSROTAWZja6lu6/EEm0O1VmJ1Or88+vZfZxR+kaklN52
    mxth7YsaOzCfBWNWKkBuHC3irAdPovlAVICngDDFeDANMOi3mdt1mVjdpyYPe5+yOmz2
    NtaEYj05oTJfaE6A6zPZL3aoeSxX92IL5FBlk6NhdsKD8AT5VGWjykYEiQDaMzHVj59x
    nmOSEC7NcJLqUdImy05Vggs5MJyS5XTHDANvFqJ5pi8DQz3wp3/7WIZpQ7Li6ObnLku9
    DKBg==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpPAjffPEe8kXgv4Zw4zff4g9E7hUg=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.3.0 AUTH)
    with ESMTPSA id Yddb27z23KP5Qww
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 3 Mar 2023 21:25:05 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: distributions@lists.linux.dev, Thorsten Kukuk <kukuk@suse.com>
Cc: Eric Blake <eblake@redhat.com>
Subject: Re: Y2038, glibc and utmp/utmpx on 64bit architectures
Date: Fri, 03 Mar 2023 21:25:04 +0100
Message-ID: <2761646.h9gRbJKcGU@nimes>
In-Reply-To: <20230303170729.GA4300@suse.com>
References: <20230303104647.GA20891@suse.com> <3067bd0ec5134b039cdb8be9db8da8e5@DB6PR04MB3255.eurprd04.prod.outlook.com> <20230303170729.GA4300@suse.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Thorsten Kukuk wrote:
> > I really don=E2=80=99t think it is appropriate to outright remove POSIX=
 standard
> > interfaces from Linux, replacing them with non-standard systemd APIs.
>=20
> Nobody wants to remove the current utmp code (ok, not quite correct,
> glibc developers plan to remove it from glibc, as it will stop working
> in a few years) and feel free to convert all the code out there to use
> the utmpx and not utmp interface.

I don't understand: Do the glibc developers plan to remove the utmpx
interface as well (together with utmp interface)?

If no, then
  - Why does your blog post https://github.com/thkukuk/utmpx/blob/main/Y203=
8.md
    say "It looks like the glibc developers don't want to solve this problem
    but instead deprecate the utmp.h/utmpx.h/lastlog.h interface."?
  - What about the '#if __WORDSIZE_TIME64_COMPAT32' in
    /usr/include/x86_64-linux-gnu/bits/utmpx.h ? Isn't it as nasty as the
    '#if __WORDSIZE_TIME64_COMPAT32' in
    /usr/include/x86_64-linux-gnu/bits/utmp.h ?

If yes, then
  - What is the point of your suggestion to "use the utmpx and not utmp
    interface", above?
  - Since there is no "FUTURE DIRECTIONS" in POSIX
    https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/=
endutxent.html
    will the utmpx interface get deprecated in POSIX, or stay as it is?
    Is the Austin Group already involved?

Bruno



