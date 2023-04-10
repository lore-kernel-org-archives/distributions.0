Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F55250
	for <distributions@lists.linux.dev>; Mon, 10 Apr 2023 20:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 716BA3C02213D;
	Mon, 10 Apr 2023 12:52:21 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SVGaqHe0uRw2; Mon, 10 Apr 2023 12:52:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 22B153C097AFA;
	Mon, 10 Apr 2023 12:52:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu 22B153C097AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1681156341;
	bh=ngfIt2Bn8tA76TPWuwrQfZpeSLyVO4oFIgRglsp0Ebc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=dS6N8n3nRR4JHZHd2U0sFD0fAkDW4NtDbLOjBbZBUROU/zWRJbMHRXSlzVztlukph
	 sZ0YpnDMu3HBIjAb8zacPINRYKyQ5wSFwRoLlCT/dLGwKCOn539gZslNnzccINnhN7
	 QxaZ2YUggnuW7uDhL3Zlk8AX4stoVrLfW8GP0by5S4bHi+O39i5k7j+n1IEv9wQdF2
	 XXckO1lCZQLu9jPXDjrG83S1T+kFxzw0YYXj7PcW9gcaOhJUVzndaq5kvcykD4zc3Q
	 pL5zgauxTAErJIjc3uUp6EsNaVSnVHPCp4A1YlVunxytbGgHw+5RPCiZZJY5Utg7cv
	 XGwHbiggH2aRA==
X-Virus-Scanned: amavisd-new at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NNIPsGATZcFx; Mon, 10 Apr 2023 12:52:21 -0700 (PDT)
Received: from [192.168.1.9] (cpe-172-91-119-151.socal.res.rr.com [172.91.119.151])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id E5C173C02213D;
	Mon, 10 Apr 2023 12:52:20 -0700 (PDT)
Message-ID: <c87cc7dd-4eb8-49a1-e27e-b5621909b617@cs.ucla.edu>
Date: Mon, 10 Apr 2023 12:52:20 -0700
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Zack Weinberg <zack@owlfolio.org>, =?UTF-8?Q?P=c3=a1draig_Brady?=
 <P@draigBrady.com>, Bruno Haible <bruno@clisp.org>, bug-gnulib@gnu.org
Cc: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
References: <6614772.670kD7asE2@nimes>
 <4f4298d3-76a9-3473-0963-f8eff4bdc29d@draigBrady.com>
 <bffe78fa-dc4d-46e5-8c2d-27f7aaa7baac@app.fastmail.com>
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
In-Reply-To: <bffe78fa-dc4d-46e5-8c2d-27f7aaa7baac@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-04-10 12:09, Zack Weinberg wrote:
> I was imagining something to do
> with library ABIs involving time_t, or network and/or storage formats
> explicitly specified to use 64-bit counts of seconds since the Unix
> epoch, or similar.

Needs are not limited to library code. Applications like 'ls' and 'date' 
and even 'grep' need support for timestamps past 2038. A 'grep' built 
with 32-bit time_t can't read files with timestamps after 2038.

Many embedded systems being developed now will still be used after 2038, 
long after their current developers have left (or fled :-) the scene. 
And some of these will be part of important infrastructure such as 
municipal water systems. For general-purpose apps like coreutils that 
are widely used in these systems, 32-bit time_t should be opt-in not 
opt-out, so that developers know of the problem and consciously decide 
to go with 32-bit time_t despite the looming 2038 deadline.

Of course there are occasions where one can still safely build for 
platforms that one *knows* won't be in use 15 years from now. So we'll 
need to describe how to do that and I plan to follow up with a Gnulib 
doc patch along those lines.

PS. Timestamp needs are more complicated than 32 vs 64 bits. For 
example, ustar format (specified by POSIX) has 33-bit unsigned 
timestamps. And gzip format (specified by RFC 1952)  has timestamps in 
the range 1 .. (2**32 - 1).
