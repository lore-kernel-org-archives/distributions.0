Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E662F3F
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 22:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 697693C02213D;
	Mon, 10 Apr 2023 15:01:10 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ClLPYjrlG9BG; Mon, 10 Apr 2023 15:01:10 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id E460A3C09FA03;
	Mon, 10 Apr 2023 15:01:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu E460A3C09FA03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1681164069;
	bh=GmVtqsqKerS4GDvHMoq60Zy4VpJEOnUziPSK27lIMbk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Z+1FBPRobtbcmn/PPwzkB+UwY01nUufjVP9mNIAGFZ7gRNvP3Fx6ci3FmTQmOihB1
	 6B9B17sY61CkcwgvAcYpB73Fpni5lR/MTBDCr/1p4qfoiMoFGSGJyOVv5kOipI8oIP
	 +5pOaUpSyOQJOWWn+V9serjwc6hhbztA0mHLX1VIa4pOOkcbn8VSATYJNSlmg5snuT
	 0vQyVKSYdsjuhsBcwvIYQ4avfaHn8A8Z8OmA9xlSEzTCwSrXTUo2rjEoGQ6t5PUIqU
	 1WPRzJ6Bbp9EBKnp2SjBIbTA/idsuQWIrUAmVKxfy2Q3K224OlfQr3kAFdO3OIhB9f
	 VyKvw8D0g3MfQ==
X-Virus-Scanned: amavisd-new at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zVVSov3hPEdq; Mon, 10 Apr 2023 15:01:09 -0700 (PDT)
Received: from [192.168.1.9] (cpe-172-91-119-151.socal.res.rr.com [172.91.119.151])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id ADE983C02213D;
	Mon, 10 Apr 2023 15:01:09 -0700 (PDT)
Message-ID: <f8a82029-d5b8-9651-73dc-83693971de86@cs.ucla.edu>
Date: Mon, 10 Apr 2023 15:01:09 -0700
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
 <c87cc7dd-4eb8-49a1-e27e-b5621909b617@cs.ucla.edu> <8903614.REtRWnDglx@nimes>
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
In-Reply-To: <8903614.REtRWnDglx@nimes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-04-10 14:08, Bruno Haible wrote:
>> Applications like 'ls' and 'date'
>> and even 'grep' need support for timestamps past 2038.
> ... if they are used in hardware that will operate in and beyond 2038.

That's not the only reason year-2038 support is needed. And it's not 
just trivial things like "date -d'now + 15 years'"; it's packages like 
tar and coreutils that need to work even in environments where users 
today can mistakenly (or purposely!) set file timestamps to be 15 years 
from now. A common command like 'grep' or 'find' shouldn't misbehave 
merely because a file timestamp is in the future.

I plan to reword the manual to suggest year2038 over year2038-required 
as you suggested, and to give packagers an out even when 
year2038-required is used. However, for core packages year 2038 support 
really should be opt-out, not opt-in, and for these packages 
year2038-required is more likely to save people trouble down the road.

If we change to AC_YEAR2038_OPT_OUT we can update the manual accordingly 
of course.
