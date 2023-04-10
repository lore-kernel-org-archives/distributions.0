Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32740322B
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 14:12:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g5so7974711wrb.5
        for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681135934; x=1683727934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fX9hvpqzDqO/AQZANdNUlJZmtDiwLXCYRBmqp4Eel7c=;
        b=d8CM6safsuMLvmr5h60+2hmSicLv7hAVwxO2k2UUiJKiSIKRqqeIDuvGtLoCRVm4HV
         pgNbQmvgpZ5cb2TMOW0WrJDHQShEe7fZ3WuxdP3HEf8tleyb2BMZNvLDw9pgL58ylZ6M
         nPLU6mnFBDs4JnMq8DytP+ugPPQX+wEfyUvNk4Vyl7fPTly6qAOPUgrSnDKYzwjBxt6F
         xQ0CIbhOMLbxo3Jyjtuw83h5a7xeoiKizr5hnnBFzv63Og86pk71eHt6JWXBZTU+2rRg
         vz+i/WSypMyzZ2a6AP8Ka1R13sd0ZYgRokRO0HM/OVVE6X89GQkY1yYIq140eJWL7Q2V
         kkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681135934; x=1683727934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fX9hvpqzDqO/AQZANdNUlJZmtDiwLXCYRBmqp4Eel7c=;
        b=b5Pa3Mw1Y3oZsPnwq4KJfriyNQE4OG0LwNhbJTazWsQECX0uM8I9i4jhYALpDeAd9T
         rPFABLKOCxvuxqM3c1+2v5muXjH8Sv0V9TX0z0m4xRSnEg8940Xk9Or+At9Lq80RR2R3
         OITMw6fbK2dMOBpraopiqfdALQ5WugkNR452RVvqYG4CI8LrCdWj/DV4mpA+40ZeMKsr
         OyZ6uhZjEiKbWWLw0FajmYAUBS9n8R0fkSPI8WldvDjXmw7oO976NrS1pOLR1AV5fdKG
         bnbWMVhaXxV3LYwIxsZ6mfoUNwRKbp1rMysidYgrc5IHPZqCJENVQPgFPOYRNVy7j789
         QWlg==
X-Gm-Message-State: AAQBX9fWM2mqliakOnE5ZrHpA8hVtTlMxI9xp/KFJ0OAgMAY6Pi9i7Mw
	dvj3GpReFvr/cT9N6B3bgaU=
X-Google-Smtp-Source: AKy350ZptZAAFPENwyL7DrjYYFJuYfx2jPixKcYv/N7yNAWDKsK+ZPzQV/xtX/6+ZyAV6gRPicZKsQ==
X-Received: by 2002:adf:dd4a:0:b0:2ef:bb49:5379 with SMTP id u10-20020adfdd4a000000b002efbb495379mr4295345wrm.16.1681135934398;
        Mon, 10 Apr 2023 07:12:14 -0700 (PDT)
Received: from [192.168.1.9] (95-44-90-175-dynamic.agg2.lod.rsl-rtd.eircom.net. [95.44.90.175])
        by smtp.googlemail.com with ESMTPSA id b14-20020adfde0e000000b002d1bfe3269esm11883322wrm.59.2023.04.10.07.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 07:12:13 -0700 (PDT)
Sender: =?UTF-8?Q?P=C3=A1draig_Brady?= <pixelbeat@gmail.com>
Message-ID: <4f4298d3-76a9-3473-0963-f8eff4bdc29d@draigBrady.com>
Date: Mon, 10 Apr 2023 15:12:13 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Thunderbird/109.0
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Content-Language: en-US
To: Bruno Haible <bruno@clisp.org>, Paul Eggert <eggert@cs.ucla.edu>,
 bug-gnulib@gnu.org
Cc: Zack Weinberg <zack@owlfolio.org>, Sam James <sam@gentoo.org>,
 distributions@lists.linux.dev
References: <6614772.670kD7asE2@nimes>
From: =?UTF-8?Q?P=C3=A1draig_Brady?= <P@draigBrady.com>
In-Reply-To: <6614772.670kD7asE2@nimes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/04/2023 14:40, Bruno Haible wrote:
> Hi Paul,
> 
> In yesterday's changes, you added to the Gnulib documentation, section
> "Avoiding the year 2038 problem", wording that
> 
>    * explicitly recommends the ‘year2038-required’ module,
>      which does AC_REQUIRE([AC_SYS_YEAR2038_REQUIRED]):
> 
>      "The Gnulib module ‘year2038-required’ is recommended for any package
>       that might be used after the year 2038 on 32-bit platforms."
> 
>    * presents the ‘year2038-required’ module as the first and the ‘year2038’
>      module (which does AC_REQUIRE([AC_SYS_YEAR2038])) only as the secondary
>      option.
> 
> I strongly object to this recommendation and presentation.
> 
> The reason is that we have three personas:
>    - The package maintainer who edits configure.ac.
>    - The distro people who create distros comprised of many packages,
>      passing appropriate options to 'configure'.
>    - The user / sysadmin who installs packages on their systems from source,
>      passing appropriate options to 'configure' as well.
> 
> If the package maintainer adds an AC_SYS_YEAR2038_REQUIRED invocation to
> his package's configure script, or equivalently, if he pulls in the
> 'year2038-required' module, he is *taking freedom away* from *both* the
> distro people and the users/sysadmins.
> 
> It is simply the wrong person's decision if the package maintainer
> uses the AC_SYS_YEAR2038_REQUIRED macro.
> 
> In detail:
> 
> When AC_SYS_YEAR2038_REQUIRED is used, the package can no longer be
> installed on the following 32-bit platforms/ABIs:
> 
>    - Linux with glibc < 2.34 on x86, arm, mips (32-bit or n32 ABI), powerpc,
>      sparc, s390, hppa, m68k, sh, csky, microblaze, nios2,
>    - Linux/riscv32,
>    - Mac OS X on x86 and powerpc,
>    - GNU/Hurd/x86,
>    - GNU/kFreeBSD/x86,
>    - FreeBSD/x86,
>    - MidnightBSD/x86,
>    - AIX/powerpc,
>    - Solaris 10 and 11 on x86 and sparc,
>    - Cygwin/x86,
>    - Haiku/x86.
> 
> Regarding the distro people:
> 
>    The outcome of a discussion, about a month or two ago, was AFAIU that
>    Linux/x86 and Linux/arm distros have a choice between
>      (a) enabling 64-bit time_t for all packages, thus breaking ABI
>          compatibility once and becoming year 2038 saft, or
>      (b) staying with the 32-bit time_t, and announcing that their
>          distro will stop working in 2038.
>    An incremental or partial move to 64-bit time_t would be too expensive,
>    did the distro people say.
> 
>    Now, if a package maintainer adds AC_SYS_YEAR2038_REQUIRED to their
>    configure.ac, they are telling the distros of type (b) "you cannot use
>    new releases of my package any more".
> 
>    This is discriminatory and without justification, since the maintainers
>    of a type (b) distro already know that they have to limit the lifetime
>    expectations of their distro.
> 
> Regarding the users/sysadmins:
> 
>    It is their decision to know until when they want to use their hardware,
>    and which ABI they want to use for the binaries that they install on
>    this hardware.
> 
>    Now, if a package maintainer adds AC_SYS_YEAR2038_REQUIRED to their
>    configure.ac, they are telling the users "you cannot install releases
>    of my package any more" or "I force you to install 64-bit binaries
>    instead of 32-bit binaries".
> 
>    It is just not appropriate for the package maintainer to push such a
>    decision onto the user.
> 
> I would therefore propose that the module 'year2038-required' gets
> removed from Gnulib, as I cannot see any positive uses of it.
> 
> If that is not possible, then at least:
>    1) The Gnulib documentation should present 'year2038' first, and
>       'year2038-required' as a rarely needed alternative,
>    2) The Gnulib documentation should not recommend 'year2038-required'.
> 
> Note: In constrast, there is nothing wrong with the Autoconf documentation.
> It presents the AC_SYS_YEAR2038 and AC_SYS_YEAR2038_REQUIRED macros
> without favouring one or the other.

Yes I'm a bit confused with the new restrictions myself.
A build on Solaris 10 on sparc for example now fails.
I was able to get a build to complete though by passing this to configure:

   ac_year2038_required=no

I'm confused also about the auto detection / rejection modes for this.
IIUC, previously a build would fail only if `touch -t` could create 64 bit times,
while the build was setup for 32 bit time_t. But now the build fails
irrespective of what touch supports. For completeness touch on this platform
does not support 64 bit times.

   > touch -t 203901010101 file.t
   touch: bad time specification

   > touch -t 203701010101 file.t

   > src/touch -t 203901010101 file.t
   touch: invalid date format '203901010101'

   > src/touch -t 203701010101 file.t

cheers,
Pádraig
