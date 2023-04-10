Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE905C99
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 20:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1681155906; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kkv5ouApYek388NkLkArh6khVgPdgjBXhGBNktT1SqoDj1DNcunux40n9vob7jwB1a
    ey/Xbtw5I7c844HrtS+Db57H87SQxVTT9lR4BJG2/XYKHuagztrcSkM6KU8xuUXcpzTf
    k022rQTZUdUrr4nrN9kuhU3w2fo3nJ7g2qcNuzY53wKEVdABnnNuETA9xOG767t7yZwx
    qDG7dTD1fKxl7ZPmqEtv1IwfSODSRv1jWDJ0I97Nd8VoaiZZI0/QZZM2uDgGA1TmpdGp
    QF7+6xaPXMhR2hRqV9auzaZzoFWBbYfopdnpNBAveiVFnJW86GiBU9ZM5vUgnoWT1JUy
    2jbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681155906;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3Mknsryfp8XUuL2cJ5IN4d1MJUNeKpIwuEQjFxjGE6o=;
    b=StPEwJXrR7GvdBmmruiosoWB9hW/DEnlLd83a2VvDHQV4Q21AHBmkqFD6X7uiWpY9r
    j7UW30YxPiJf+oz1wyPBbylVzRVLdchBj79DQFFwC3vqwaOzwOaeAke3qRfTASueeYnr
    13MmZD2eDNsz55BTbvbyO3yxqIPPSCL+TON8G42MkNKtUk7lYju9kMFmSrw6xLcVVMFO
    swG0gRX3OsVP4PhbuCp23jWrKRSH0EOOK0YAB2w7emNFTyvh3ty0RMpDS+6SiHDl4QtG
    FzKNxw0K9WT4LehHQCE/i3frHoWuSnvM73FchnyWCedELPBsASSGh55NBLCL1ZEnMBLC
    SrQQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681155906;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3Mknsryfp8XUuL2cJ5IN4d1MJUNeKpIwuEQjFxjGE6o=;
    b=HZqsD2Af5462mIGR2FkcPps8zMM+qJD5aT5CPoV6hg3CfaVpLDjOP2bzOmnNPRCK7T
    MPKXjn9dLOTI7bjtAtUqKRuZ6KbgonHY5xGmwwRkNtg9dzHo1HF/GqlzuADvoj/6P+Bg
    EAuOgGSg2ENumNaM2LcdER6JYdMwPNSKbGwhHKjeduTAUvHwNR3fO87m35o4IcltigG3
    WU+IYZGWirchD2RWmn8TbOSWQ6J4ekr6oww97r/6QeLbA4wiCvoPRdiOzyefUPuJVkwk
    P43Z37skMtdW0GOEHs851yL0gxCyWTQzu+Xp4dnFfu+eCRlSX+A4zmXo5zP8r/LeOPYo
    bRew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681155906;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3Mknsryfp8XUuL2cJ5IN4d1MJUNeKpIwuEQjFxjGE6o=;
    b=aSIsr8Wvlezbf8ADG0PK4DIIpNsTMC9Q7bhACS+V+5tQVIM/lTGJgTqblykKyYRtaV
    4s/k/4/PHKf72raUywCA==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpOR2qCFhc6P4zzpzNGh8xZkWtKSsw=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id D064b6z3AJj6bBN
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 10 Apr 2023 21:45:06 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: =?ISO-8859-1?Q?P=E1draig?= Brady <P@draigbrady.com>, Paul Eggert <eggert@cs.ucla.edu>, bug-gnulib@gnu.org, Zack Weinberg <zack@owlfolio.org>
Cc: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Date: Mon, 10 Apr 2023 21:45:05 +0200
Message-ID: <6250336.ySyUEvhnHf@nimes>
In-Reply-To: <bffe78fa-dc4d-46e5-8c2d-27f7aaa7baac@app.fastmail.com>
References: <6614772.670kD7asE2@nimes> <4f4298d3-76a9-3473-0963-f8eff4bdc29d@draigBrady.com> <bffe78fa-dc4d-46e5-8c2d-27f7aaa7baac@app.fastmail.com>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Zack Weinberg wrote:
> As the person who invented AC_SYS_YEAR2038_REQUIRED and
> AC_SYS_LARGEFILE_REQUIRED, let me say that it was my intention that they
> would only be used in rare circumstances, where the inability to install
> the software on older ABIs is outweighed by some other strong
> requirement for time_t and/or off_t to be at least 64 bits.  I didn't
> have any specific use cases in mind but I was imagining something to do
> with library ABIs involving time_t, or network and/or storage formats
> explicitly specified to use 64-bit counts of seconds since the Unix
> epoch, or similar.

Thanks for the clarification.

Note that I'm perfectly fine with AC_SYS_LARGEFILE_REQUIRED being
documented, because
  - it makes perfect sense for packages that regularly deal with files
    larger than 2 GiB, such as video manipulation,
  - hardly any platform nowadays lacks a way to enforce large files in
    the API.

Bruno



