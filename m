Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802722F3F
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 22:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 7C88D3C02213D;
	Mon, 10 Apr 2023 15:00:09 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id DrMAl10msPAb; Mon, 10 Apr 2023 15:00:09 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 3D3C73C09FA03;
	Mon, 10 Apr 2023 15:00:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu 3D3C73C09FA03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1681164009;
	bh=pulJg5OLI1V9l1vOUyH948dfDFF9vxZWSjMEaDJjrM8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=nuB+0BINsBa2jrSGret4boKxPKUZQ80FxRonF7M+EV0i9qsQ0lAalitSuand5P26X
	 Hatz0XoURC6kxwUqnwcigG0ND7Im3ULd71O+U9xnMMU3lOd08F9bhyD0iczM3J/hJf
	 ffBUnohPDB2Zj2Jw7/A33gYg3nXRL99Lfy9hdjzbrrdMljxOjx+xu3e+spJuNpLMCA
	 rNMIOHiBgrGnKnfImJZw2dA014dOlfg9AEOq+JgE2U193jzOP+O248Cn7bTwpj+Rqs
	 fIfhXt4KRwc1WWFHYgAzd7r2Aa34iqvmo1kMulWd0KIjMEQdZUuvpfZj5M4kKptYWT
	 gnjgeQF5TbBlQ==
X-Virus-Scanned: amavisd-new at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rDJcMtEk7FTN; Mon, 10 Apr 2023 15:00:09 -0700 (PDT)
Received: from [192.168.1.9] (cpe-172-91-119-151.socal.res.rr.com [172.91.119.151])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id 05BA53C02213D;
	Mon, 10 Apr 2023 15:00:08 -0700 (PDT)
Message-ID: <9636462e-920f-2e6e-3d2c-ec58e43021a2@cs.ucla.edu>
Date: Mon, 10 Apr 2023 15:00:08 -0700
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Bruno Haible <bruno@clisp.org>, Zack Weinberg <zack@owlfolio.org>,
 =?UTF-8?Q?P=c3=a1draig_Brady?= <P@draigbrady.com>, bug-gnulib@gnu.org
Cc: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
References: <6614772.670kD7asE2@nimes>
 <bffe78fa-dc4d-46e5-8c2d-27f7aaa7baac@app.fastmail.com>
 <c87cc7dd-4eb8-49a1-e27e-b5621909b617@cs.ucla.edu> <5343648.xEiunlC7Kx@nimes>
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
In-Reply-To: <5343648.xEiunlC7Kx@nimes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-04-10 14:42, Bruno Haible wrote:
> How about a middle ground between the two macros? A macro, say
> AC_SYS_YEAR2038_UNLESS_OPT_OUT (*), that
>    - like AC_SYS_YEAR2038, has the option --disable-year2038,
>    - like AC_SYS_YEAR2038_REQUIRED, fails if a large 'time_t' is
>      unavailable and --disable-year2038 was not specified.

Even simpler, let's have just one new macro instead of two. I.e., let's 
change Autoconf to remove AC_SYS_YEAR2038_REQUIRED and to define instead 
a macro AC_SYS_YEAR2038_OPT_OUT that acts like AC_SYS_YEAR2038 except it 
errors out if wide time_t and --disable-year2038 are both missing.

Then let's propagate this change into Gnulib, and rename Gnulib's 
year2030-required module to year2038-opt-out.

Similarly for AC_SYS_LARGEFILE_REQUIRED.

Since this is a change to Autoconf I'd like to hear Zack's opinion.
