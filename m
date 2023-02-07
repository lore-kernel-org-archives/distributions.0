Received: from out-150.mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0333C9
	for <distributions@lists.linux.dev>; Tue,  7 Feb 2023 14:17:25 +0000 (UTC)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ayaya.dev; s=key1;
	t=1675778314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAq/pOqhRXA9TEaGjjM4fk58EZ831AWJmjS3lD8JOi0=;
	b=hGU1Jj1AQd2mHidv96I6BdUqCUznPqQikqMyD65IGZBYiYIlQzt2Wo9kfyWwVM+76Sm0ai
	UpFg0Ycp6hJMRyGI0SMaOKMtAtCDpG7I3Est/y/9NWogfwCRdZTqRlIsjN0qhkYUm6KpVv
	Xx62mKa6Js+MAO2ZMErwhBCRMUijFa8=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Feb 2023 14:58:26 +0100
Message-Id: <CQCDTY09I8WJ.3NED2ZL98BB4R@sumire>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "alice" <alice@ayaya.dev>
To: "Bruno Haible" <bruno@clisp.org>, <distributions@lists.linux.dev>
Subject: Re: ISO C23 removal of unprototyped functions
References: <2354211.7hzS34FegO@nimes>
In-Reply-To: <2354211.7hzS34FegO@nimes>
X-Migadu-Flow: FLOW_OUT

On Tue Feb 7, 2023 at 1:14 PM CET, Bruno Haible wrote:
> Seen in the GCC change log [1]: Joseph Myers wrote:
>
> "
>   C2x has completely removed unprototyped functions, so that () now
>   means the same as (void) in both function declarations and
>   definitions, where previously that change had been made for
>   definitions only.  Implement this accordingly.
>
>   This is a change where GNU/Linux distribution builders might wish to
>   try builds with a -std=3Dgnu2x default to start early on getting old
>   code fixed that still has () declarations for functions taking
>   arguments, in advance of GCC moving to -std=3Dgnu2x as default maybe in
>    GCC 14 or 15; I don't know how much such code is likely to be in
>   current use.
> "

of note, clang made some of these various c23 changes (and reverted them) i=
n
15. context:
https://discourse.llvm.org/t/configure-script-breakage-with-the-new-werror-=
implicit-function-declaration/65213/1
starting from clang 16 these are errors again. what issues this causes is
discussed in the thread, but generally, this causes invisible configure
failures that misdetect features (false negatives, or even false positives)=
.

gentoo has done quite a bit of work so far on upstreaming fixes regarding t=
hese to a variety of projects' build systems.
fedora is now aiming for the same:
https://fedoraproject.org/wiki/Changes/PortingToModernC
because gcc14 (as mentioned) will most likely contain this same breakage (a=
s clang16 now will).

>
> There were two essential changes in this area in ISO C 23:
>   * https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2432.pdf
>     1) removed the K&R C syntax for function definitions
>          int foo (x, y) int x; long y; { ... }
>     2) in function definitions, () is equivalent to (void).
>   * https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2841.htm
>     3) A function declarator with a parameter list of () declares a proto=
type
>        for a function that takes no parameters (like it does in C++).
>        See ISO C 23 =C2=A7 6.7.6.3.(13).
>
> [1] https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D0a4b219d39c74=
ae

