Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093B33EC
	for <distributions@lists.linux.dev>; Wed, 19 Apr 2023 21:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id AC8DD3C097AFC;
	Wed, 19 Apr 2023 14:23:31 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JkjJf4VfdgLt; Wed, 19 Apr 2023 14:23:31 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 4EA053C097AFF;
	Wed, 19 Apr 2023 14:23:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu 4EA053C097AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1681939411;
	bh=BH1VCDo4dzTzpm6Px5iItCXA/DYIxNArk0YBKQWvtIY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=nE+1tNiXhGQ1xysqf7KA05OeP51qYUVJ+AilO2dhOykxQvvCv6drZFPXJ3M1d92QP
	 1QtC2KpRiYfrLabx3VaL+pDfwqA7ESpeahcukiyfcOacRPyFtG70pRyNYc7ZayHSh4
	 A3Mx5/Kse3yL/CFK8URgT0wbFbu1DhLjiQFDgBRiFU74+klQ36Pi4JW4AyVkJc0TeS
	 tjnG05SzJINMozUUW6eC6OGLrsGEPyIRCtm3mJ1WVWiACP5Dy8O1vheyspoR7zPhs8
	 pdSygT6fdcT09hXNHcjYq1O2KawJ63HxwUwf+XZ9zm998t4hvA+/3wwZccpFH6BWoc
	 m/9ybyI75NyUg==
X-Virus-Scanned: amavisd-new at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
	by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GK9sZC6cD32k; Wed, 19 Apr 2023 14:23:31 -0700 (PDT)
Received: from [192.168.1.9] (cpe-172-91-119-151.socal.res.rr.com [172.91.119.151])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id 1E0953C097AFC;
	Wed, 19 Apr 2023 14:23:31 -0700 (PDT)
Message-ID: <c8505ba3-bd85-49db-69d4-1087754b436d@cs.ucla.edu>
Date: Wed, 19 Apr 2023 14:23:30 -0700
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: recommending AC_SYS_YEAR2038_REQUIRED ?
Content-Language: en-US
To: Zack Weinberg <zack@owlfolio.org>, Bruno Haible <bruno@clisp.org>,
 =?UTF-8?Q?P=c3=a1draig_Brady?= <P@draigbrady.com>, bug-gnulib@gnu.org
Cc: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
References: <6614772.670kD7asE2@nimes> <5343648.xEiunlC7Kx@nimes>
 <9636462e-920f-2e6e-3d2c-ec58e43021a2@cs.ucla.edu> <9797572.lZ1qq7WqSs@nimes>
 <7fb8ec1e-0db9-dd86-d718-214133f88b53@cs.ucla.edu>
 <26320c3d-53e9-4fe8-9218-4b04b37bf7d5@app.fastmail.com>
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
In-Reply-To: <26320c3d-53e9-4fe8-9218-4b04b37bf7d5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-04-11 17:10, Zack Weinberg wrote:
> I'm also happy with this resolution.  I do not have time to do the Autoconf work until the weekend.

I notice you were careful to not say *which* weekend. :-)

Anyway, I coded up a draft patch and published it here:

https://lists.gnu.org/r/autoconf/2023-04/msg00027.html
